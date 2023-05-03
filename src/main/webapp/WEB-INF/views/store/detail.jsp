<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
.comment-box {
  width: 500px;
  margin: 20px auto;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 10px;
}

textarea {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: none;
}

.star-ratings {
  display: inline-block;
  border: none;
}

.star-ratings input[type="radio"] {
  display: none;
}

.star-ratings label {
  font-size: 20px;
  color: #ccc;
  display: inline-block;
  padding: 5px;
  transition: all 0.2s ease-in-out;
}

.star-ratings input[type="radio"]:checked ~ label {
  color: #ffd700;
}

button[type="submit"] {
  background-color: #4caf50;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}
.comment-list {
  border: 1px solid #ccc;
  padding: 10px;
}

.comment-list h3 {
  margin: 0;
  padding: 10px;
  background-color: #f5f5f5;
}

.comment-list ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.comment-list li {
  border-bottom: 1px solid #ccc;
  margin: 0;
  padding: 10px;
}

.comment-body {
  margin: 0;
  padding: 0;
}

.comment-body h4 {
  margin: 0 0 5px 0;
  padding: 0;
}

.comment-body p {
  margin: 0;
  padding: 0;
}

.comment-date {
  display: block;
  margin-top: 5px;
  font-size: 12px;
  color: #888;
}
/* 레스토랑 이름 스타일 */
h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

/* 이미지 스타일 */
img {
  max-width: 100%;
  height: auto;
  margin-bottom: 10px;
}

/* 주소, 전화번호, 카테고리, 소개 스타일 */
p {
  font-size: 16px;
  margin-bottom: 5px;
}

/* 지도 영역 스타일 */
#map {
  margin-top: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
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
	<%-- 디테일 창 --%>
	<div style="display: flex;">
		<div style="flex: 1;">
			<h2>${restaurant.name}</h2>
			<p><img src="${restaurant.img }"></p>
			<p>도로명 주소 : ${restaurant.doro }</p>
			<p>지번 주소 : ${restaurant.jibun }</p>
			<p>전화번호 : ${restaurant.tel }</p>
			<p>카테고리 : ${restaurant.cate }</p>
			<p>소개 : ${restaurant.info }</p>
			<div id="map" style="width:500px;height:400px;"></div>
		</div>
		<div class="comment-box">
			<c:choose>
				<c:when test="${login }">
				  <form action="/reviews">
				  	<input type="hidden" value="${restaurant.id }" name="id"/>
				    <label for="ment">댓글 달기</label>
				    <fieldset class="star-ratings">
				      <input type="radio" id="star5" name="rating" value="5" />
				      <label for="star5">5 점</label>
				      <input type="radio" id="star4" name="rating" value="4" />
				      <label for="star4">4 점</label>
				      <input type="radio" id="star3" name="rating" value="3" />
				      <label for="star3">3 점</label>
				      <input type="radio" id="star2" name="rating" value="2" />
				      <label for="star2">2 점</label>
				      <input type="radio" id="star1" name="rating" value="1" />
				      <label for="star1">1 점</label>
				    </fieldset>
				    <textarea id="ment" name="ment"></textarea>
					<button type="submit">등록</button>
				  </form>
				</c:when>
				<c:otherwise>
					리뷰를 남기실려면 로그인을 해야합니다.
				</c:otherwise>
			</c:choose>
		  <div>
			<h3>댓글 목록</h3>
		  	<div class="comment-list">
				<ul>
			  		<c:forEach items="${reviews }" var="i">
						<li>
							<div class="comment-body">
						        <h4>${i.userId }</h4>
						        <p>${i.ment }</p>
						    	<span class="comment-date">${i.stars }</span>
							</div>
						</li>
				  	</c:forEach>
				</ul>
			</div>
		  </div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b343d4aaf4128dced96d12b4c307c50c"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${restaurant.lat}, ${restaurant.lng}),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>