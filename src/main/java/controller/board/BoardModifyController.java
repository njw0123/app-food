package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Boards;

@WebServlet("/board/modify")
public class BoardModifyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		Boards board = sqlSession.selectOne("boards.findByCode", code);
		req.setAttribute("board", board);
		
		req.getRequestDispatcher("/WEB-INF/views/board/boardModify.jsp").forward(req, resp);
	}
}
