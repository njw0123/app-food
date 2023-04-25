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
			<a>홈</a> | <a>식당목록</a> | <a>랜덤뽑기</a> | <a>식당등록</a>
		</div>
		<%-- 로그인 상태창 --%>
		<div>
			<c:choose>
				<c:when test="${logon }">
					ㅇㅇ님 / <a>로그아웃</a>				
				</c:when>
				<c:otherwise>
					<a>로그인</a>
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
	<%-- 메인 로고 사진 --%>
	<div style="text-align: center">
		<img src="resource/image/main.jpg" width="500px" height="300px"/>
	</div>
	<%-- 별점 높은순 3개 --%>
	<div style="display: flex; justify-content: space-around;">
		<div>
			<img src=""/>
			<ul style="list-style: none">
				<li>가게이름</li>
				<li>소개글</li>
			</ul>
		</div>
		<div>
			<img src=""/>
			<ul style="list-style: none">
				<li>가게이름</li>
				<li>소개글</li>
			</ul>
		</div>
		<div>
			<img src=""/>
			<ul style="list-style: none">
				<li>가게이름</li>
				<li>소개글</li>
			</ul>
		</div>
	</div>
</body>
</html>