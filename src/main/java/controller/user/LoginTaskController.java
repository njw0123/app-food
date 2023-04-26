package controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.User;
import repoistory.usersDAO;

@WebServlet("/login-task")
public class LoginTaskController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		User user = usersDAO.findById(id);
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
			resp.sendRedirect("/index");
		}		
	}
}
