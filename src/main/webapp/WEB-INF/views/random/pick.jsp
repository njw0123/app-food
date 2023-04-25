<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
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
	<%-- 검색창 --%>
	<div style="text-align: center">
		<form action="">
			 <input type="text" id="search" placeholder="가게이름"/>
			 <button>검색</button>
		</form>
	</div>
	<%-- 랜덤추천 창 --%>
	<div style="margin: 20px; text-align: center">
		먹을거 고민을 줄여주기 위해 버튼을 누르면 음식 카테고리중 하나를 선택 해드립니다.
	</div>
	<div style="text-align: center">
		<button>고민해결 버튼</button>
	</div>
</body>
</html>