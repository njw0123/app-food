package controller.reviews;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/reviews")
public class ReviewsController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("loginUser");
		if (user == null) {
			resp.sendRedirect("/detail?id="+req.getParameter("id"));
			return;
		}
		String userId = user.getId();
		int storeId = Integer.parseInt(req.getParameter("id"));
		String ment = req.getParameter("ment");
		double stars = Double.parseDouble(req.getParameter("rating"));

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("storeId", storeId);
		map.put("ment", ment);
		map.put("stars", stars);
		int r = sqlSession.insert("reviews.create", map);

		map.clear();
		map.put("stars", stars);
		map.put("id", storeId);
		sqlSession.update("stores.updateStars", map);

		resp.sendRedirect("/detail?id=" + storeId);
		sqlSession.close();

	}

}
