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

/* 전체 컨테이너에 대한 스타일 */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image:
		url("https://png.pngtree.com/background/20210710/original/pngtree-creative-minimalist-gourmet-synthetic-cartoon-background-picture-image_1031378.jpg");
	background-size: cover;
	background-position: center;
	border-radius: 10px;
}

/* 내용을 담을 컨테이너에 대한 스타일 */
.content {
	flex: 1;
	max-width: 800px;
	background-color: white;
	padding: 80px;
	border-radius: 100px;
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
	font-size: 1em;
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

a {
	color: #000; /* 링크의 기본 색상 */
	text-decoration: none; /* 링크에 밑줄 제거 */
}

.long-input {
  width: 400px; /* 입력창의 너비를 400px로 설정 */
  height: 50px; /* 입력창의 높이를 50px로 설정 */
  font-size: 20px; /* 입력창의 글자 크기를 20px로 설정 */
  /* 필요에 따라 다른 스타일도 추가할 수 있습니다. */
}
.comment-box form {
  margin-bottom: 1rem;
}

.input-container {
  display: flex;
  align-items: center;
}

.input-container textarea {
  flex: 1;
  height: 20px;
  margin-right: 0.5rem;
  font-size: 1rem;
  resize: none;
  border: 1px solid #ccc;
  padding: 10px;
}
.input-container input[type="submit"] {
  width: 100px;
  height: 40px;
  font-size: 1rem;
 background-color: #f60;
 
 border: none;
	border-radius: 5px;
	padding: 10px;
	color: #fff;
	box-shadow: 0px 0px 5px 0px #ccc;
	cursor: pointer;
}

.comment-box {
  margin-top: 20px; /* 원하는 크기로 조절 */
}
ul {
    list-style: none;
    padding: 0;
    margin: 0;
  background-color: #f5f5f5; /* 댓글 배경 색상 */
  border-radius: 10px; /* 댓글 테두리 둥글게 */
  box-shadow: 2px 2px 5px #ccc; /* 댓글 그림자 */
  margin-bottom: 10px; /* 댓글 간격 */
  padding: 10px; /* 댓글 내용과 테두리 사이 간격 */
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
			<c:if test="${loginUser.id eq board.id }">
				<div>
				<a href="/board/modify?code=${param.code }"><button>수정</button></a>
				<a onclick="boardDelete()" data-target="${param.code }"><button>삭제</button></a>
				</div>
			</c:if>
			<div class="comment-box">
			</div>
			<%--댓글 영역 --%>
			<div class="comment-box">
				<c:choose>
    <c:when test="${login }">
      <form action="/board/comments">
        <input type="hidden" value="${board.code }" name="id" />
        <div class="input-container">
           <textarea id="ment" name="ment" rows="5" placeholder="댓글을 입력하세요"></textarea>
          <input type="submit" class="long-button" value="댓글 등록">
        </div>
      </form>
    </c:when>
    <c:otherwise>
      댓글를 남기실려면 로그인을 해야합니다.
    </c:otherwise>
  </c:choose>
				<div>
					<h3>댓글 목록</h3>
					<div class="comment-list">
						<ul class="comment-list">
							<c:forEach items="${coreviews }" var="i">
								<li>
									<div class="comment-body">
										<div style="display: flex; justify-content: space-between;">										
										<div><b>${i.userId }</b> : ${i.ment }</div>
										<div>
											<small><fmt:formatDate value="${i.createdDate }" pattern="yyyy.MM.dd"/></small>
											<c:if test="${loginUser.id eq i.userId }">
												<small class="del" data-target="${i.code }">✖</small>
											</c:if>
										</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.querySelectorAll(".del").forEach(tag =>{
			tag.onclick = function(E) {
				let del = confirm("리뷰를 삭제 하시겠습니까?");
				if(del){
					const target = this.dataset.target;
					const xhr = new XMLHttpRequest();
					xhr.open("get", "/comment-del?code="+target, true);
					xhr.send();
					xhr.onreadystatechange = function() {
						if(this.readyState===4) {
							alert('삭제 되었습니다.');
							location.reload();
						}
					}
				}else{					
				}
			};
		});
		
		function boardDelete() {
			let del = confirm("리뷰를 삭제 하시겠습니까?");
			if(del) {
				const xhr = new XMLHttpRequest();
				xhr.open("get", "/board/delete?code=${param.code}", true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if(this.readyState===4) {
						alert('삭제 되었습니다.');
						let url = '/boards'
						location.replace(url);
					}
				}
			}
		};
	</script>
</body>
</html>