package controller.board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/board/comments")
public class BoardCommentController extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	req.setCharacterEncoding("utf-8");
	SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
	SqlSession sqlSession = factory.openSession(true);
	
	HttpSession session = req.getSession();
	User user = (User)session.getAttribute("loginUser");
	if (user == null) {
		resp.sendRedirect("/boardDetail?code="+req.getParameter("id"));
		return;
	}
	String userId = user.getId();
	int boardId = Integer.parseInt(req.getParameter("id"));	
	String ment = req.getParameter("ment");
	
	Map<String, Object> map = new HashMap<>();
	map.put("userId", userId);
	map.put("boardId", boardId);
	map.put("ment", ment);
	
	sqlSession.insert("comment.create", map);

	resp.sendRedirect("/boards/detail?code=" + boardId);
	sqlSession.close();
	
}
}