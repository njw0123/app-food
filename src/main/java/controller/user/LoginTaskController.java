package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/login-task")
public class LoginTaskController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();
		User user = sqlSession.selectOne("users.findById", id);
		if (user == null) {
			resp.sendRedirect("/login?cause=error");
			return;
		}else {
			if (!pass.equals(user.getPass())) {
				resp.sendRedirect("/login?cause=error");
				return;
			}
			HttpSession session = req.getSession();
			session.setAttribute("login", true);
			session.setAttribute("loginUser", user);
			String uri = req.getParameter("uri");
			if (uri == null) {
				resp.sendRedirect("/index");				
			}else {
				resp.sendRedirect(uri);
			}
		}
		sqlSession.close();
	}
}
