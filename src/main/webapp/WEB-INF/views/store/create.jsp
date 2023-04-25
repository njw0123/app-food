<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛스타그램</title>
<style type="text/css">
/* 회원가입 폼 컨테이너 */
.signup-form-container {
  max-width: 400px; /* 폼의 최대 너비 */
  margin: 0 auto; /* 가운데 정렬 */
  padding: 20px; /* 패딩 */
  background-color: #f7f7f7; /* 배경색 */
  border: 1px solid #ddd; /* 테두리 */
}

/* 회원가입 폼 */
.signup-form {
  display: flex; /* flex 사용 */
  flex-direction: column; /* 세로 방향으로 정렬 */
}

/* 프로필 이미지 미리보기 */
.profile-image-preview {
  max-width: 300px;
  margin-top: 10px;
}

/* 프로필 이미지 업로드 버튼 */
.profile-image-upload-button {
  background-color: #4CAF50; /* 배경색 */
  color: #fff; /* 글자색 */
  border: none; /* 테두리 없앰 */
  border-radius: 5px; /* 모서리 둥글게 */
  padding: 10px; /* 패딩 */
  margin-top: 10px; /* 위쪽 여백 */
  cursor: pointer; /* 마우스 커서 변경 */
}

/* 프로필 이미지 업로드 버튼 호버 시 스타일 */
.profile-image-upload-button:hover {
  background-color: #3e8e41;
}

/* 회원가입 버튼 */
.signup-button {
  background-color: #4CAF50; /* 배경색 */
  color: #fff; /* 글자색 */
  border: none; /* 테두리 없앰 */
  border-radius: 5px; /* 모서리 둥글게 */
  padding: 10px; /* 패딩 */
  margin-top: 10px; /* 위쪽 여백 */
  cursor: pointer; /* 마우스 커서 변경 */
}

/* 회원가입 버튼 호버 시 스타일 */
.signup-button:hover {
  background-color: #3e8e41;
}
</style>
</head>
<body>
	<div style="display: flex; justify-content: space-between;">
		<%-- 메뉴창 --%>
		<div>
			<a href="/index">홈</a> | <a href="/list">식당목록</a> | <a href="/random">랜덤뽑기</a>
			<c:if test="${sessionScopelogon }">
				 | <a href="/create">식당등록</a>
			</c:if>
		</div>
		<%-- 로그인 상태창 --%>
		<div>
			<c:choose>
				<c:when test="${logon }">
					ㅇㅇ님 / <a>로그아웃</a>				
				</c:when>
				<c:otherwise>
					<a href="/login">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%-- 가게 등록 창 --%>
	<div class="signup-form-container">
	  <form class="signup-form">
	    <label for="profile-image">가게 대표 사진 업로드</label>
	    <input type="file" id="profile-image" onchange="previewImage(event)" accept="image/*">
	    <img class="profile-image-preview" src="" alt="프로필 이미지 미리보기">
	    <label for="name">가게 이름</label>
	    <input type="text" id="name">
	    <label for="number">전화번호</label>
	    <input type="text" id="number">
	    <label for="address">주소</label>
	    <input type="text" id="address">
	    <label for="intro">소개글</label>
	    <input type="text" id="intro">
	    <button class="signup-button" type="submit">등록</button>
	  </form>
	</div>
	<script type="text/javascript">
		function previewImage(event) {
		  const reader = new FileReader(); // FileReader 객체 생성
		  const imagePreview = document.querySelector('.profile-image-preview'); // 프로필 이미지 미리보기 엘리먼트

		  reader.onload = function() {
		    imagePreview.src = reader.result; // 이미지 미리보기 업데이트
		  };

		  reader.readAsDataURL(event.target.files[0]); // 선택한 파일을 읽어옴
		}
	</script>
</body>
</html>