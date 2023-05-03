<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
#category-container {
  margin: 20px auto;
  text-align: center;
  font-size: 24px;
  font-weight: bold;
}

#category-container::before {
  content: "추천 카테고리: ";
  font-weight: normal;
}

.b {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px;
  font-size: 16px;
  cursor: pointer;
}

.b:hover {
  background-color: #3e8e41;
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
	<%-- 랜덤추천 창 --%>
	<div style="margin: 20px; text-align: center">
		먹을거 고민을 줄여주기 위해 버튼을 누르면 음식 카테고리중 하나를 선택 해드립니다.
	</div>
	<div id="category-container">
		${pick }
	</div>
	<div style="text-align: center">
		<a href="/random-task"><button class="b">고민해결 버튼</button></a>
	</div>
</body>
</html>