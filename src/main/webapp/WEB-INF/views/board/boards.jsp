<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
.post-list {
  margin: 20px;
}

.post {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
}

.post-title {
  flex: 1;
  font-size: 18px;
  font-weight: bold;
  color: #007bff;
  text-decoration: none;
}

.post-date {
  font-size: 14px;
  color: #999;
  margin-left: 10px;
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
		<form action="">
			 <input type="text" id="search" placeholder="가게이름"/>
			 <button>검색</button>
		</form>
	</div>
	<%-- 게시판 리스트 창 --%>
	<div style="text-align: right;">
		<a href="/createBoard"><button>글쓰러가기</button></a>
	</div>
	<div class="post-list">
	  <div class="post">
	    <a class="post-title" href="#">게시글 제목 1</a>
	    <span class="post-date">닉네임</span>
	    <span class="post-date">2023-04-27</span>
	  </div>
	  <div class="post">
	    <a class="post-title" href="#">게시글 제목 2</a>
	    <span class="post-date">닉네임</span>
	    <span class="post-date">2023-04-26</span>
	  </div>
	  <div class="post">
	    <a class="post-title" href="#">게시글 제목 3</a>
	    <span class="post-date">닉네임</span>
	    <span class="post-date">2023-04-25</span>
	  </div>
  		<!-- 이하 생략 -->
	</div>
</body>
</html>