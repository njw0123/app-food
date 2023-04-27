package controller.random;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/random")
public class RandomController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pick = req.getParameter("pick");
		if (pick != null) {
			req.setAttribute("pick", pick);			
		}
		req.getRequestDispatcher("/WEB-INF/views/random/pick.jsp").forward(req, resp);
	}
}
  