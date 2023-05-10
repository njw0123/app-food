package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;

@WebFilter({"/createBoard", "/review*", "/board/comments*", "/comments*", "/board/m*"})
public class AuthFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, 
							FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		
		boolean login = (boolean)request.getSession().getAttribute("login");
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		// if 를 걸어서
		// 현재 요청을 보낸 사용자의 세션에 logon 값이 true 면  통과
		
		if(!login || loginUser == null) {
			response.sendRedirect("/login?url="+uri);
		}else {
			chain.doFilter(request, response);	// 필터 통과시켜주는
			// 그게 아니면 /flow/login.jsp 로 리 다이렉트 시키는 필터를 만들어보자.
		}
		
	}
}


