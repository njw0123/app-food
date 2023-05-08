<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<header>
<meta charset="UTF-8">
<title>맛스타그램</title>
<!-- style  -->
<link rel="stylesheet" href="resource/css/style.css">

<!-- 구글폰트 -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
</style>

<style type="text/css">

/* 전체 컨테이너에 대한 스타일 */
.container {
	height: 75vh;
	border-radius: 5px;
	background-image:
		url("https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
	background-size: cover;
	background-position: center;
}

/* 날씨 정보 전체를 감싸는 div 요소의 스타일 */
.weather-info {
  font-size: 1.5rem;
  background-color: #f4f4f4;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2);
  margin: 1em;
}

/* 각각의 날씨 정보를 감싸는 div 요소의 스타일 */
.weather-item {
  margin: 0 20px;
}

/* 텍스트 요소의 스타일 */
.weather-text {
  margin: 0;
  text-align: center;
  font-weight: bold;
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
<div class ="container">
  <!-- 기존 코드 내용 -->
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
				<b>${loginUser.nick } 님 </b>/ <a href="/logout"><b>로그아웃</b></a>				
				</c:when>
				<c:otherwise>
					<a href="/login"><b>로그인</b></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%-- 검색창 --%>
	<div style="text-align: center">
		<form action="/search">
			<input class="search" type="text" name="search" placeholder="찾고 싶은 맛집을 검색해보세요." list="search-list" autocomplete="off" style="width: 300px;"/>
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
	<%-- 메인 로고 사진 --%>
	<div style="text-align: left; margin: 0.1em;">
		<img src="resource/image/main.png" width="270px" height="230px"/>
	</div>
	</div>
	<%-- 날씨 창 --%>
	<div style=" text-align: center; margin: 1em">
		<h2 style="color: skyblue;">🌞 오늘의 날씨 🌞</h2>
	</div>
	<div style="display: flex; justify-content: space-between; font-size:40px">
		<c:forEach items="${list }" var="i">
			<div class="weather-info">
		  		<div class="weather-item "> 
		   	 		<div class="weather-text">${i }</div>
		  		</div>
		  </div>
		</c:forEach>
	</div>
	
</body>
</html>