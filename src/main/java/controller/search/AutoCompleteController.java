package controller.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import data.Restaurants;

@WebServlet("/api/search")
public class AutoCompleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		Gson gson = new Gson();
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		String q = req.getParameter("q");
		List<Restaurants> list = sqlSession.selectList("stores.search", "%"+q+"%");
		List<String> result = new ArrayList<>();
		for(Restaurants w : list) {
			result.add(w.getName());
		}
		out.println(gson.toJson(result));
		sqlSession.close();
	}
}
