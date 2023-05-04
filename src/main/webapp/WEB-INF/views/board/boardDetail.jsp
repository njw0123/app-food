<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

/* 전체 컨테이너에 대한 스타일 */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image:
		url("https://as1.ftcdn.net/v2/jpg/05/71/10/20/1000_F_571102094_uqXSqH15cd5uMjGfjqis5Uo6sCTnraBY.webp");
	background-size: cover;
	background-position: center;
}

/* 내용을 담을 컨테이너에 대한 스타일 */
.content {
	flex: 1;
	max-width: 800px;
	background-color: white;
	padding: 80px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 제목에 대한 스타일 */
h2 {
	font-size: 25px;
	margin-bottom: 10px;
}

/* 아이디와 닉네임에 대한 스타일 */
.id {
	font-size: 16px;
	color: #666;
	margin-bottom: 5px;
}

/* 글 내용에 대한 스타일 */
.ment {
	font-size: 18px;
	margin-bottom: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 2em;
}

/* 이미지에 대한 스타일 */
img {
	max-width: 100%;
	height: auto;
	margin-bottom: 20px;
}

.divider {
	height: 1px;
	margin: 10px 0;
	background-color: #ddd;
	border: none;
}

p.date {
	float: right;
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
			<input type="text" name="search" placeholder="가게이름" />
			<button>검색</button>
		</form>
	</div>
	<%-- 게시판 디테일 창 --%>
	<div class="container">
		<div class="content">
			<h1 style="color: skyblue; text-align: center;">${board.title }</h1>
			<p class="id">
				<b> 작성자 : ${board.id } (${board.nick })</b>
			</p>
			<hr class="divider">
			<!-- 한줄 추가 -->
			<p class="ment">${board.ment}</p>

			<p>
				<img src="${board.img }" alt="board image">
			</p>
			<p style="text-align: right;"><fmt:formatDate value="${board.createDate }" pattern="yyyy.MM.dd"/>  </p>
			<hr class="divider">
			<!-- 한줄 추가 -->
			<div>
			<button>수정</button>
			<button>삭제</button>
			</div>
			<%--댓글 영역 --%>
			<div class="comment-box">
				<c:choose>
					<c:when test="${login }">
						<form action="/board/comments">
							<input type="hidden" value="${board.code }" name="id" /> <label
								for="ment">댓글 달기</label>

							<textarea id="ment" name="ment"></textarea>
							<button type="submit">댓글 등록</button>
						</form>
					</c:when>
					<c:otherwise>
					댓글를 남기실려면 로그인을 해야합니다.
				</c:otherwise>
				</c:choose>
				<div>
					<h3>댓글 목록</h3>
					<div class="comment-list">
						<ul>
							<c:forEach items="${coreviews }" var="i">
								<li>
									<div class="comment-body">
										<p>${i.userId }:${i.ment }</p>
										<p>${i.createDate }</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>