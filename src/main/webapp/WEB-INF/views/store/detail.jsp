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
	<%-- 디테일 창 --%>
	
	<div style="text-align:center;">
		<h2>${restaurant.name}</h2>
		<p>도로명 주소 : ${restaurant.doro }</p>
		<p>지번 주소 : ${restaurant.jibun }</p>
		<p>전화번호 : ${restaurant.tel }</p>
		<p>카테고리 : ${restaurant.cate }</p>
		<p>소개 : ${restaurant.info }</p>
		<p><img src="${restaurant.img }"></p>
		<p>${restaurant.lat } / ${restaurant.lng }</p>
	</div>
	<p>
	${list[0].ment }
	</p>
	

	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b343d4aaf4128dced96d12b4c307c50c"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(restaurant.lat, restaurant.lng),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>