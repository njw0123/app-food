<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
.login-form-container {
  max-width: 400px; /* 폼의 최대 너비 */
  margin: 0 auto; /* 가운데 정렬 */
  padding: 20px; /* 패딩 */
  background-color: #f7f7f7; /* 배경색 */
  border: 1px solid #ddd; /* 테두리 */
}

/* 로그인 폼 */
.login-form {
  display: flex; /* flex 사용 */
  flex-direction: column; /* 세로 방향으로 정렬 */
}

/* 로그인 입력 필드 */
.login-form input[type="text"],
.login-form input[type="password"] {
  margin-bottom: 10px; /* 아래쪽 여백 */
  padding: 10px; /* 패딩 */
  border: 1px solid #ddd; /* 테두리 */
  border-radius: 5px; /* 모서리 둥글게 */
}

/* 로그인 버튼 */
.login-form button {
  background-color: #4CAF50; /* 배경색 */
  color: #fff; /* 글자색 */
  border: none; /* 테두리 없앰 */
  border-radius: 5px; /* 모서리 둥글게 */
  padding: 10px; /* 패딩 */
  margin-top: 10px; /* 위쪽 여백 */
  cursor: pointer; /* 마우스 커서 변경 */
}

/* 로그인 버튼 호버 시 스타일 */
.login-form button:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>
	<div style="display: flex; justify-content: space-between;">
		<%-- 메뉴창 --%>
		<div>
			<a href="/index">홈</a> | <a href="/list">식당목록</a> | <a href="/random">랜덤뽑기</a>
			| <a href="/boards">게시판</a>
		</div>
		<%-- 로그인 상태창 --%>
		<div>
			<c:choose>
				<c:when test="${login }">
					${loginUser.nick } 님 / <a href="/logout">로그아웃</a>		
				</c:when>
				<c:otherwise>
					<a>로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%-- 로그인 창 --%>
	<div style="text-align: center; margin: 10px;">
		아이디와 비밀번호를 입력하여 로그인 해주세요.
	</div>
	<c:if test="${param.cause eq 'error' }">
		<div style="text-align: center;">
			<font color="red">아이디 또는 비밀번호가 틀렸습니다.</font>
		</div>
	</c:if>
	<div class="login-form-container">
  		<form action="/login-task" class="login-form">
  			<c:if test="${!empty param.url }">
  				<input type="hidden" name="uri" value="${param.url }"/>
  			</c:if>
		    <input type="text" name="id" placeholder="아이디">
		    <input type="password" name="pass" placeholder="비밀번호">
		    <button>Login</button>
  		</form>
	</div>
	<div style="text-align: center; margin: 0.2em;">
		<a href="/join" style="text-decoration: none;">아이디가 없으신가요? 회원가입<small>하러가기</small></a>
	</div>
</body>
</html>