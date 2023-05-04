<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
/* 날씨 정보 전체를 감싸는 div 요소의 스타일 */
.weather-info {
  display: flex;
  justify-content: space-around;
  align-items: center;
  font-size: 1.5rem;
  background-color: #f4f4f4;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2);
}

/* 각각의 날씨 정보를 감싸는 div 요소의 스타일 */
.weather-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 20px;
}

/* 텍스트 요소의 스타일 */
.weather-text {
  margin: 0;
  text-align: center;
  font-weight: bold;
}
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
	<%-- 메인 로고 사진 --%>
	<div style="text-align: center">
		<img src="resource/image/main.jpg" width="500px" height="300px"/>
	</div>
	<%-- 날씨 창 --%>
	<c:forEach items="${list }" var="i">
		<div class="weather-info">
	  	<div class="weather-item">
	   	 <div class="weather-text">${i }</div>
	  	</div>
	  </div>
	</c:forEach>
</body>
</html>