package controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repoistory.usersDAO;

@WebServlet("/join-task")
public class JoinTaskController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String nick = req.getParameter("nick");
		System.out.println(id);
		System.out.println(pass);
		System.out.println(nick);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("nick", nick);
		int r = usersDAO.create(map);
		if (r != 1) {
			resp.sendRedirect("/join?cause=error");
			return;
		}
		resp.sendRedirect("/login");
	}
}
