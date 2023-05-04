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
	// 댓글 작성자 ID는 세션으로부터 가져오기
	// 현재 시간을 댓글 작성일로 사용하기 위해 날짜 형식 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date createDate = new Date();
	String createdDate = dateFormat.format(createDate);
	
	Map<String, Object> map = new HashMap<>();
	map.put("userId", userId);
	 
	map.put("boardId", boardId);
	map.put("ment", ment);
	map.put("createDate", createDate);
	
	sqlSession.insert("comment.create", map);
	
	
	resp.sendRedirect("/boards/detail?code=" + boardId);
	sqlSession.close();
	
}
}