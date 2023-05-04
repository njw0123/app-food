package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.BoardComment;
import data.Boards;
import data.Restaurants;

@WebServlet("/boards/detail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		String code = req.getParameter("code");
		Boards board = sqlSession.selectOne("boards.findByCode", code);

		List<BoardComment> list = sqlSession.selectList("comment.commentByBoardId", code);
		
		req.setAttribute("coreviews", list);

		req.setAttribute("board", board);

		sqlSession.close();

		req.getRequestDispatcher("/WEB-INF/views/board/boardDetail.jsp").forward(req, resp);
	}
}
