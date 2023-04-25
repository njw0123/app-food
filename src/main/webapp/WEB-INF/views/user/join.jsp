<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
/* 회원가입 폼 컨테이너 */
.signup-form-container {
  max-width: 400px; /* 폼의 최대 너비 */
  margin: 0 auto; /* 가운데 정렬 */
  padding: 20px; /* 패딩 */
  background-color: #f7f7f7; /* 배경색 */
  border: 1px solid #ddd; /* 테두리 */
}

/* 회원가입 폼 */
.signup-form {
  display: flex; /* flex 사용 */
  flex-direction: column; /* 세로 방향으로 정렬 */
}

/* 회원가입 입력 필드 */
.signup-form input[type="text"],
.signup-form input[type="password"] {
  margin-bottom: 10px; /* 아래쪽 여백 */
  padding: 10px; /* 패딩 */
  border: 1px solid #ddd; /* 테두리 */
  border-radius: 5px; /* 모서리 둥글게 */
}

/* 회원가입 버튼 */
.signup-form button {
  background-color: #4CAF50; /* 배경색 */
  color: #fff; /* 글자색 */
  border: none; /* 테두리 없앰 */
  border-radius: 5px; /* 모서리 둥글게 */
  padding: 10px; /* 패딩 */
  margin-top: 10px; /* 위쪽 여백 */
  cursor: pointer; /* 마우스 커서 변경 */
}

/* 회원가입 버튼 호버 시 스타일 */
.signup-form button:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>
	<div style="display: flex; justify-content: space-between;">
		<%-- 메뉴창 --%>
		<div>
			<a href="/index">홈</a> | <a href="/list">식당목록</a> | <a href="/random">랜덤뽑기</a>
			<c:if test="${sessionScopelogon }">
				 | <a href="/create">식당등록</a>
			</c:if>
		</div>
		<%-- 로그인 상태창 --%>
		<div>
			<c:choose>
				<c:when test="${logon }">
					ㅇㅇ님 / <a>로그아웃</a>				
				</c:when>
				<c:otherwise>
					<a href="/login">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%-- 회원가입 창 --%>
	<div style="text-align: center; margin: 10px;">
		아이디, 비밀번호, 닉네임을 작성하여 회원가입을 해 주세요.
	</div>
	<c:if test="">
		<div style="text-align: center;">
			<font color="red">이미 있는 아이디입니다.</font>
		</div>
	</c:if>
	<div class="signup-form-container">
	  <form class="signup-form" action="/join-task">
	    <input type="text" placeholder="아이디">
	    <input type="password" placeholder="비밀번호">
	    <input type="text" placeholder="닉네임">
	    <div style="text-align: center">
		    사업자면 체크해주세요.
	    </div>
	    <input type="checkbox" id="check"/>
	    <button>Sign up</button>
	  </form>
	</div>
</body>
</html>