<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
 form {
      margin: 20px;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"], textarea {
      display: block;
      width: 100%;
      padding: 5px;
      margin-bottom: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="file"] {
      margin-bottom: 10px;
    }

    button[type="submit"] {
      display: block;
      padding: 10px;
      font-size: 18px;
      font-weight: bold;
      color: #fff;
      background-color: #007bff;
      border: 0;
      border-radius: 4px;
      cursor: pointer;
    }
    textarea {
    width: 100%;
    height: 10em;
    resize: none;
  	}
</style>
</head>
<body>
	<div style="display: flex; justify-content: space-between;">
		<%-- 메뉴창 --%>
		<div>
			<b><a href="/index">홈</a> | <a href="/list">식당목록</a> | <a href="/random">랜덤뽑기</a>
			| <a href="/boards">게시판</a></b>
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
	<%-- 글쓰기 창 --%>
	<div>
	  <form action="board-task" method="post" enctype="multipart/form-data">
	    <label for="title">제목</label>
	    <input type="text" id="title" name="title" required>
	
	    <label for="ment">내용</label>
	    <textarea id="ment" name="ment" required></textarea>
	
	    <label for="ima">이미지</label>
	    <input type="file" id="img" name="img">
	
	    <button type="submit">글쓰기</button>
 	 </form>
	</div>
</body>
</html>