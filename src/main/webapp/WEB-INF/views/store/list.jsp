<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<!-- style  -->
<link rel="stylesheet" href="resource/css/style.css">

<!-- 구글폰트 -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
</style>
<style type="text/css">

button:hover {
  background-color: #ff8533;
}

table {
  border-collapse: collapse;

  width: 100%;
  font-family: Arial, sans-serif;
  font-size: 12px;
  background-color: transparent; /* 배경색을 투명하게 설정 */
}

th, td {
 
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  background-color: rgba(255, 255, 255, 0.5); /* 배경색을 반투명하게 설정 */
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}

tr:hover {
  background-color: #ddd;
}

a {
	color: #000; /* 링크의 기본 색상 */
	text-decoration: none; /* 링크에 밑줄 제거 */
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
body {
    background-image: url('resource/image/listback.jpg');
	background-repeat: no-repeat;
    background-size: 38%;
    background-attachment : fixed;
    background-position: center center;
    height: auto;
    width: auto;
    margin 0
}

/* 버튼관련 모르겠어서 다퍼옴
링크참조
https://inpa.tistory.com/entry/CSS-%F0%9F%92%8D-%EB%B2%84%ED%8A%BC-%EB%94%94%EC%9E
%90%EC%9D%B8-%EB%AA%A8%EC%9D%8C#%EB%B8%94%EB%9F%AD_%ED%9A%A8%EA%B3%BC_%EB%B2
%84%ED%8A%BC*/

* {
  box-sizing: border-box;
}

.header {
  background: white;
  padding: 30px;
  text-align: left;
}
.header h1 {
  font-weight: 300;
  display: inline;
}
h2 {
  color: #89867e;
  text-align: center;
  font-weight: 300;
}
.color {
  width: 350px;
  margin: 0 auto;
}
.color li {
  margin: 0 15px 0 0;
  width: 30px;
  height: 30px;
  display: inline-block;
  border-radius: 100%;
}
.color .red    {background: #fa5a5a;}
.color .yellow {background: #f0d264;}
.color .green  {background: #82c8a0;}
.color .cyan   {background: #7fccde;}
.color .blue   {background: #6698cb;}
.color .purple {background: #cb99c5;}

.content, 
.content-gradient, 
.content-3d {
  margin: 40px auto;
}
.content {
  width: 80%;
  max-width: 700px;
}
.content-3d {
  width: 50%;
  max-width: 300px;
}
pre {
  width: 100%;
  padding: 30px;
  background-color: rgba(0, 0, 0, 0.72);
  color: #f8f8f2;
  border-radius: 0 0 4px 4px;
  margin-top: 20px;
  white-space: pre-wrap; /* css-3 */
  white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
  white-space: -pre-wrap; /* Opera 4-6 */
  white-space: -o-pre-wrap; /* Opera 7 */
  word-wrap: break-word; /* Internet Explorer 5.5+ */
}
pre .bt  {color: #f8f8f2;} /* <> */
pre .anc {color: #f92672;} /* anchor tag */
pre .att {color: #a6a926;} /* attribute */
pre .val {color: #e6db74;} /* value */

.btn-container, .container {
  background-color: white;
  border-radius: 4px;
  text-align: left;
  margin-bottom: 40px;
}
.container h2 {
  padding-top: 30px;
  font-weight: 300;
}
.btn, .btn-two {
  margin: 9px;
}
.btn-gradient {
  margin: 5px;
}
a[class*="btn"] {text-decoration: none;}
input[class*="btn"], 
button[class*="btn"] {border: 0;}

/* Here you can change the button sizes */
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: left;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}

/* Colors for .btn and .btn-two */
.btn.blue, .btn-two.blue     {background-color: #7fb1bf;}
.btn.green, .btn-two.green   {background-color: #9abf7f;}
.btn.red, .btn-two.red       {background-color: #fa5a5a;}
.btn.purple, .btn-two.purple {background-color: #cb99c5;}
.btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
.btn.yellow, .btn-two.yellow {background-color: #f0d264;}

.rounded {
  border-radius: 10px;
}

/* default button style */
.btn {
  position: relative;
  border: 0;
  padding: 15px 25px;
  display: inline-block;
  text-align: left;
  color: white;
}
.btn:active {
  top: 4px; 
}

/* color classes for .btn */
.btn.blue {box-shadow: 0px 4px #74a3b0;}
.btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}

.btn.green {box-shadow: 0px 4px 0px #87a86f;}
.btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}

.btn.red {box-shadow:0px 4px 0px #E04342;}
.btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}

.btn.purple {box-shadow:0px 4px 0px #AD83A8;}
.btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}

.btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
.btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}

.btn.yellow {box-shadow:0px 4px 0px #D1B757;}
.btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}

/* Button two - I have no creativity for names */
.btn-two {
  color: white; 
  padding: 15px 25px;
  display: inline-block;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom-color: rgba(0,0,0,0.34);
  text-shadow:0 1px 0 rgba(0,0,0,0.15);
  box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
              0 2px 0 -1px rgba(0,0,0,0.13), 
              0 3px 0 -1px rgba(0,0,0,0.08), 
              0 3px 13px -1px rgba(0,0,0,0.21);
}
.btn-two:active {
  top: 1px;
  border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
  box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
  position: relative;
}
/* 3D Button */
.btn-3d {
  position: relative;
  display: inline-block;
  font-size: 22px;
  padding: 20px 60px;
  color: white;
  margin: 20px 10px 10px;
  border-radius: 6px;
  text-align: left;
  transition: top .01s linear;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.red:hover    {background-color: #e74c3c;}
.btn-3d.blue:hover   {background-color: #699DD1;}
.btn-3d.green:hover  {background-color: #80C49D;}
.btn-3d.purple:hover {background-color: #D19ECB;}
.btn-3d.yellow:hover {background-color: #F0D264;}
.btn-3d.cyan:hover   {background-color: #82D1E3;}

.btn-3d:active {
  top: 9px;
}

/* 3D button colors */
.btn-3d.red {
  background-color: #e74c3c;
  box-shadow: 0 0 0 1px #c63702 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 #C24032,
        0 8px 0 1px rgba(0,0,0,0.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.red:active {
  box-shadow: 0 0 0 1px #c63702 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.blue {
  background-color: #6DA2D9;
  box-shadow: 0 0 0 1px #6698cb inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(110, 164, 219, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
  box-shadow: 0 0 0 1px #6191C2 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.green {
  background-color: #82c8a0;
  box-shadow: 0 0 0 1px #82c8a0 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(126, 194, 155, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.green:active {
  box-shadow: 0 0 0 1px #82c8a0 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.purple {
  background-color: #cb99c5;
  box-shadow: 0 0 0 1px #cb99c5 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(189, 142, 183, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.purple:active {
  box-shadow: 0 0 0 1px #cb99c5 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.cyan {
  background-color: #7fccde;
  box-shadow: 0 0 0 1px #7fccde inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(102, 164, 178, .6),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.cyan:active {
  box-shadow: 0 0 0 1px #7fccde inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

.btn-3d.yellow {
  background-color: #F0D264;
  box-shadow: 0 0 0 1px #F0D264 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(196, 172, 83, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.yellow:active {
  box-shadow: 0 0 0 1px #F0D264 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}

/* Gradient buttons */
.btn-gradient {
  text-decoration: none;
  color: white;
  padding: 10px 30px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom: 4px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
  background: rgba(27,188,194,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
  background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.red{ 
  background: rgba(250,90,90,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
  background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}
.btn-gradient.orange {
  background: rgba(255,105,30,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255,105,30,1)), to(rgba(230,95,28,1)));
  background: -webkit-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -moz-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -o-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
}
.btn-gradient.blue {
  background: rgba(102,152,203,1);
  background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
  background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
}
.btn-gradient.purple { 
  background: rgba(203,153,197,1);
  background: -moz-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(203,153,197,1)), color-stop(100%, rgba(181,134,176,1)));
  background: -webkit-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -o-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -ms-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: linear-gradient(to bottom, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb99c5', endColorstr='#b586b0', GradientType=0 );
}
.btn-gradient.yellow {
  background: rgba(240,210,100,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(240,210,100,1)), to(rgba(229,201,96,1)));
  background: -webkit-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -moz-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -o-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f0d264', endColorstr='#e5c960', GradientType=0 );
}
.btn-gradient.green {
  background: rgba(130,200,160,1);
  background: -moz-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(130,200,160,1)), color-stop(100%, rgba(130,199,158,1)));
  background: -webkit-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -o-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -ms-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: linear-gradient(to bottom, rgba(130,200,160,1) 0%, rgba(124, 185, 149, 1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#82c8a0', endColorstr='#82c79e', GradientType=0 );
}

.btn-gradient.red:active    {background: #E35252;}
.btn-gradient.orange:active {background: #E8601B;}
.btn-gradient.cyan:active   {background: #169499;}
.btn-gradient.blue:active   {background: #608FBF;}
.btn-gradient.purple:active {background: #BD8EB7;}
.btn-gradient.yellow:active {background: #DBC05B;}
.btn-gradient.green:active  {background: #72B08E;}

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
	<%-- 식당 리스트 창 --%>
	<div style="text-align: left" class ="color">
		<a class ="btn-gradient cyan small" href="list">등록순</a><a class= "btn-gradient red small" href="list?sort=cnt">리뷰순</a><a class = "btn-gradient orange small"
			href="list?sort=star">별점순</a>
		
	</div>
	<div>
		<h1 style="text-align: center">식당 목록</h1>
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
		      <td>${fn:substring(i.stars,0,3) }</td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
	<%-- prve 처리 --%>
	<div style="text-align: center;">
		<c:choose>
			<c:when test="${existPrev }">
				<a href="/list?page=${start -10}"> <i style="color: black"></i>◀◀이전페이지
				</a>
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
				<a href="/list?page=${last + 1}"> <i style="color: black"></i>▶▶다음페이지
				</a>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>