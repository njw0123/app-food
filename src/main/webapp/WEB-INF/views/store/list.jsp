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
		
		<div>
			<table>
				<thead>
					<th>식당고유번호</th>
					<th>식당이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>음식점소개</th>
					<th>별점</th>
					<th>추천</th>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="store">
						<tr>
							<td>${store.id }</td>
							<td>${store.name }</td>
							<td>${store.jibun }</td>
							<td>${store.tel }</td>
							<td>${store.info }</td>
							<td>${store.stars }</td>
							<td>${store.cnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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