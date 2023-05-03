package controller.random;

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

@WebServlet("/random")
public class RandomController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		req.setCharacterEncoding("utf-8");
		String pick = req.getParameter("pick");
		System.out.println(pick);

		if (pick != null) {
			req.setAttribute("pick", pick);
			String page = req.getParameter("page");
			int p = page == null ? 1 : Integer.parseInt(page);
			Map<String, Object> map = new HashMap<>();
			map.put("a", (p - 1) * 10 + 1);
			map.put("b", 10 * p);
			map.put("pick","%"+pick+"%");			

			List<Restaurants> picklist = new ArrayList<>();

			picklist = sqlSession.selectList("stores.randomPick", map);
			
			req.setAttribute("picklist", picklist);
					
			int total = sqlSession.selectOne("pickCount", "%"+pick+"%");		
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
		}
		sqlSession.close();

		req.getRequestDispatcher("/WEB-INF/views/random/pick.jsp").forward(req, resp);
	}
}
