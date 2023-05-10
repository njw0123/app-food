package controller.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Restaurants;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String page = req.getParameter("page");
		int p = page == null ? 1 : Integer.parseInt(page);
		Map<String, Object> map = new HashMap<>();	
		map.put("a", (p - 1) * 10 + 1);
		map.put("b", 10 * p);
		List<Restaurants> list = new ArrayList<>();
		String search = req.getParameter("search");
		if (search == null) {
			resp.sendRedirect("/search?search=");
			return;
		}
		int total = 0;
		if (search.equals("")) {
			list = sqlSession.selectList("stores.starSort", map);
			total = sqlSession.selectOne("stores.countStore");
		}else {
			map.put("search", "%"+search+"%");
			list = sqlSession.selectList("searchAtoB", map);
			total = sqlSession.selectOne("searchCount", map);
		}
		req.setAttribute("list", list);
		
		int totalPage = total / 10 + (total % 10 > 0 ? 1 : 0);
		int viewPage = 10;

		int endPage = (((p - 1) / viewPage) + 1) * viewPage;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startPage = ((p - 1) / viewPage) * viewPage + 1;

		int idx = p * 10;
		req.setAttribute("idx", idx);
		req.setAttribute("start", startPage);
		req.setAttribute("last", endPage);
		boolean existPrev = p >= 11;
		boolean existNext = true;
		if (endPage >= totalPage) {
			existNext = false;
		}
		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);

		sqlSession.close();
		req.getRequestDispatcher("/WEB-INF/views/store/search.jsp").forward(req, resp);
	}
}
