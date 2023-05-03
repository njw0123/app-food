<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
/* 입력 필드 스타일 */
input[type="text"] {
  border: none;
  border-radius: 5px;
  padding: 10px;
  font-size: 16px;
  box-shadow: 0px 0px 5px 0px #ccc;
  outline: none;
  width: 200px;
  margin-right: 10px;
}

/* 검색 버튼 스타일 */
button {
  border: none;
  border-radius: 5px;
  padding: 10px;
  font-size: 16px;
  background-color: #f60;
  color: #fff;
  box-shadow: 0px 0px 5px 0px #ccc;
  cursor: pointer;
}

/* 검색 버튼에 호버 효과 추가 */
button:hover {
  background-color: #ff8533;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th,
td {
  text-align: left;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

a {
	color: #000; /* 링크의 기본 색상 */
	text-decoration: none; /* 링크에 밑줄 제거 */
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
					<a href="/login">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%-- 검색창 --%>
	<div style="text-align: center">
		<form action="/search">
			 <input type="text" name="search" placeholder="가게이름"/>
			 <button>검색</button>
		</form>
	</div>
	<%-- 검색 리스트 창 --%>
	<div>
		<h1>식당 목록</h1>
		<table>
		  <thead>
		    <tr>
		      <th>식당이름</th>
		      <th>주소</th>
		      <th>리뷰개수</th>
		      <th>별점</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${list }" var="i">
		    <tr onclick="location.href='/detail?id=${i.id}';">
		      <td>${i.name}</td>
		      <td>${i.doro}</td>
		      <td>${i.cnt }</td>
		      <td>${i.stars }</td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
	<%-- prve 처리 --%>
	<div style="text-align: center;">
		<c:choose>
			<c:when test="${existPrev }">
				<a href="/search?search=${param.search }&page=${start -10}"> <i style="color: black"></i>◀◀이전페이지
				</a>
			</c:when>
			<c:otherwise>
				<a><i style="color: white"></i></a>
			</c:otherwise>
		</c:choose>
		<%-- next 처리 --%>
		<c:forEach begin="${start }" end="${last}" var="idx">
			<a href="/search?search=${param.search }&page=${idx}">${idx }</a>
		</c:forEach>
		<%-- next 처리 --%>
		<c:choose>
			<c:when test="${existNext }">
				<a href="/search?search=${param.search }&page=${last + 1}"> <i style="color: black"></i>▶▶다음페이지
				</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>