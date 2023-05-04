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

@WebServlet("/review-del")
public class ReviewDelAJAXController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		double star = Double.parseDouble(req.getParameter("star"));
		String id = req.getParameter("id");
		sqlSession.delete("reviews.deleteReview", code);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("stars", star);
		sqlSession.update("stores.updateDownStar", map);
		
		sqlSession.close();
	}
}
