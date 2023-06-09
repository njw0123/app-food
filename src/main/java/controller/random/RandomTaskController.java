package controller.random;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Restaurants;

@WebServlet("/random-task")
public class RandomTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> options = Arrays.asList("경양식", "기타", "다방", "분식", "뷔페식", "일식", "제과점영업", "중국식", "한식", "호프/통닭", "회집");
		String pick = options.get((int) (Math.random() * options.size()));
		pick = URLEncoder.encode(pick,"utf-8");
		resp.sendRedirect("/random?pick="+pick);	
	}

}
