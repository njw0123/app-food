package controller.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Restaurants;
import data.Reviews;

@WebServlet("/detail")
public class DetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		int id = Integer.parseInt(req.getParameter("id"));
		Restaurants restaurant = sqlSession.selectOne("stores.findById", id);
		List<Reviews> list  = sqlSession.selectList("reviews.findReviews", id); // 리뷰 목록 가져오기
		req.setAttribute("restaurant", restaurant);
		req.setAttribute("reviews", list); //리뷰 목록 전달하기
 		req.getRequestDispatcher("/WEB-INF/views/store/detail.jsp").forward(req, resp);
	}
			
		
	
}