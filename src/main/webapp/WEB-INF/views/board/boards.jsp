<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">

/* 전체 컨테이너에 대한 스타일 */
.container {
	height: 90vh;
	background-image:
		url("https://images.pexels.com/photos/1055270/pexels-photo-1055270.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
	background-size: cover;
	background-position: center;
	border-radius: 10px;
}

/* 게시글 리스트 전체를 감싸는 div 요소 */
	.post-list {
  margin: 20px;
  background-color: rgba(255, 255, 255, 0.5); /* 투명한 배경 색상 설정 */
  padding: 10px; /* 필요에 따라 내용을 감싸는 패딩값 설정 */
  border-radius: 40px;
}
/* 게시글 하나를 감싸는 div 요소 */
.post {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 10px;
}
/* 게시글 제목 스타일 */
.post-title {
	flex: 1;
	font-size: 18px;
	font-weight: bold;
	color: #007bff;
	text-decoration: none;
}
/* 게시글 작성자 및 작성일 스타일 */
.post-date {
	font-size: 14px;
	color: #999;
	margin-left: 10px;
}
/* 입력 필드 스타일 */
 .search {
    padding: 8px;
    border: none;
    border-radius: 5px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    font-size: 16px;
    width: 300px;
    margin-right: 10px;
  }

  .search-list {
    list-style: none;
    margin: 0;
    padding: 0;
    position: absolute;
    width: 300px;
    background-color: white;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    z-index: 1;
  }

  .search-list option {
    padding: 5px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
  }

  .search-list option:hover {
    background-color: #f2f2f2;
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

/* 페이징 처리 스타일 */
.paging {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.paging a {
	margin-right: 10px;
}

.current-page {
	font-weight: bold;
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
			<input class="search" type="text" name="search" placeholder="찾고 싶은 맛집을 검색해보세요." style="width: 300px;" list="search-list" autocomplete="off"/>
			<datalist class="search-list" id="search-list">
			</datalist>
			 <button>검색</button>
		</form>
	</div>
	<script type="text/javascript">
		document.querySelector(".search").onkeyup= function(evt) {
			const val = evt.target.value;
			if(val.length == 0) 
				return;
			
			const xhr = new XMLHttpRequest();
			xhr.open("get", "/api/search?q="+val, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if(this.readyState===4) {
					const txt = this.responseText;
					const obj = JSON.parse(txt);
					const cvt = obj.map((e)=>"<option>"+e+"</option>");
					document.querySelector(".search-list").innerHTML = cvt.join("");
				}
			}
		}
	</script>
	<%-- 게시판 리스트 창 --%>
	<div class="container">
		<h2>게시판 목록</h2>
		<a href="/createBoard"><button >글쓰러가기</button></a>
	
	<div class="post-list">
		<c:forEach items="${boards }" var="i">
			<div class="post">
				<a class="post-title" href="/boards/detail?code=${i.code }">${i.title }</a>
				<span class="post-date">${i.nick }</span> <span class="post-date">
				<fmt:formatDate value="${i.createDate }" pattern="yyyy.MM.dd HH:mm"/>
				</span>
				
			</div>
		</c:forEach>
	</div>
</div>
	<%-- 페이징 처리 부분 --%>
	<div style="text-align: center;">
		<c:choose>
			<c:when test="${existPrev }">
				<a href="/boards?page=${start -10}"> <i style="color: black"></i>◀◀이전페이지
				</a>
			</c:when>
			<c:otherwise>
				<a><i style="color: white"></i></a>
			</c:otherwise>
		</c:choose>
		<%-- next 처리 --%>
		<c:forEach begin="${start }" end="${last}" var="idx">
			<a href="/boards?page=${idx}">${idx }</a>
		</c:forEach>
		<%-- next 처리 --%>
		<c:choose>
			<c:when test="${existNext }">
				<a href="/boards?page=${last + 1}"> <i style="color: black"></i>▶▶다음페이지
				</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>