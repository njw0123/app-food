package controller.board;

import java.io.File;
import java.io.IOException;
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

import com.oreilly.servlet.MultipartRequest;

import data.Boards;
import data.User;

@WebServlet("/board/modify-task")
public class BoardModifyTaskController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			resp.sendRedirect("/login");
			return;
		}
		String id = user.getId(); 		
		String img = "";
		
		String path = req.getServletContext().getRealPath("/resource/board/"+id);
		File pathFile = new File(path);
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		MultipartRequest multi = new MultipartRequest(req, path, 1024*1024*20, "utf-8");
		String title = multi.getParameter("title");
		String ment = multi.getParameter("ment");
		String code = multi.getParameter("code");
		Boards board = sqlSession.selectOne("boards.findByCode", code);
		if (!board.getId().equals(id)) {
			resp.sendRedirect("/board/detail?code="+code);
			return;
		}
		if (title == null || ment == null) {
			resp.sendRedirect("/board/modify?code="+code);
			return;
		}
		String genCode = Long.toString(System.currentTimeMillis());
		if(multi.getFile("img")==null){
		}else{
			multi.getFile("img").renameTo(new File(path, genCode));				
			img = "/resource/board/"+id+"/"+genCode;
		}
		Map<String, String> map = new HashMap<>();
		map.put("title", title); map.put("code", code);
		map.put("ment", ment); map.put("img", img);
		
		sqlSession.update("boards.update", map);
		sqlSession.close();
		
		resp.sendRedirect("/boards/detail?code="+code);				
	}
}
