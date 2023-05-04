package controller.reviews;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

@WebServlet("/review-mdfy")
public class ReviewMdfyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		String ment = req.getParameter("ment");
		int code = Integer.parseInt(req.getParameter("code"));
		String id = req.getParameter("id");
		Map<String, Object> map = new HashMap<>();
		map.put("ment", ment);
		map.put("code", code);
		sqlSession.update("reviews.updateReview", map);
		sqlSession.close();
		resp.sendRedirect("/detail?id="+id);
	}
}
