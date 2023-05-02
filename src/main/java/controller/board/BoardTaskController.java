package controller.board;

import java.io.File;
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

import com.oreilly.servlet.MultipartRequest;

import data.User;

@WebServlet("/board-task")
public class BoardTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			resp.sendRedirect("/boards?cause=error");
			return;
		}
		String id = user.getId(); 
		String nick = user.getNick();
		String img = "";
		
		String path = req.getServletContext().getRealPath("/resource/board/"+id);
		File pathFile = new File(path);
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		MultipartRequest multi = new MultipartRequest(req, path, 1024*1024*20, "utf-8");
		String title = multi.getParameter("title");
		String ment = multi.getParameter("ment");
		if (title == null || ment == null) {
			resp.sendRedirect("/boards?cause=error");
			return;
		}
		String genCode = Long.toString(System.currentTimeMillis());
		if(multi.getFile("img")==null){
		}else{
			multi.getFile("img").renameTo(new File(path, genCode));				
			img = "/resource/board/"+id+"/"+genCode;
		}
		Map<String, String> map = new HashMap<>();
		map.put("id", id); map.put("nick", nick); map.put("title", title);
		map.put("ment", ment); map.put("img", img);
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		sqlSession.insert("boards.create", map);
		resp.sendRedirect("/boards");				
		sqlSession.close();
	}
}
