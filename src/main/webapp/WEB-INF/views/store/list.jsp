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
			| <a href="/boards">게시판</a>
		</div>
		<%-- 로그인 상태창 --%>
		<div>
			<c:choose>
				<c:when test="${login }">
					${loginUser.nick } 님 / <a href="/logout">로그아웃</a>		
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
	<%-- 식당 리스트 창 --%>
	<div style="text-align: left">
		<span>등록순</span> | <span>리뷰순</span> | <span>별점순</span>
	</div>
	<div style="display: flex; flex-direction: column; margin: 10px;">
		<div style="text-align: center">
			<c:forEach var = "restaurants" items = "${list }">
			<table>
			<tr><p>${restaurants.name }</p></tr>
			<tr><p>${restaurants.doro }</p></tr>
			<tr><p>${restaurants.tel }</p></tr>
			<tr><p>${restaurants.info }</p></tr>
			</table>
			</c:forEach>
		</div>
	</div>
		<%-- prve 처리 --%>
		<div style="text-align: center;">
			<c:choose> 
				<c:when test="${existPrev }">
					<a href="/list?page=${start -10}">
					<i style="color: black"></i>◀◀이전페이지</a>
				</c:when>
				<c:otherwise>
					<a><i style="color: white"></i></a>
				</c:otherwise>
			</c:choose>
	
		<%-- next 처리 --%>
			<c:forEach begin="${start }" end="${last}" var="idx">
				<a href="/list?page=${idx}">${idx }</a>
			</c:forEach>
	
		
		<%-- next 처리 --%> 
			<c:choose>
				<c:when test="${existNext }">
					<a href="/list?page=${last + 1}">
					<i style="color: black"></i>▶▶다음페이지</a>
				</c:when>
				<c:otherwise>
					<a><i style="color: white"></i>222</a>
				</c:otherwise>
			</c:choose>
		</div>
		
</body>
</html>