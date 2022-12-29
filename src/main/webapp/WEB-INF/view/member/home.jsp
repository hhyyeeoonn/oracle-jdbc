<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#logoutBtn').click(function() {
			var out = confirm('로그아웃하시겠습니까?') 
			if(out == true) {
				alert('로그아웃되었습니다');
			} else {
				alert('로그아웃 취소');
				return false;
			}
		});
	});
</script>
</head>
<body>
	<!-- 로그인 한 멤버만 볼 수 있음 --> 
	
	<div>
		${loginMemberName}님 반갑습니다
	</div>
	
	<!-- 게시판링크 -->
	<div>
		<a href = "${pageContext.request.contextPath}/board/boardList">
			<button type = "button">게시판</button>
		</a>
	</div>
	
	<!-- 회원정보조회 -->
	<div>
		<a href = "${pageContext.request.contextPath}/member/memberOne">
			<button type = "button">회원정보</button>
		</a>
	</div>
	
	<!-- 로그아웃 -->
	<div>
		<a href = "${pageContext.request.contextPath}/member/logout">
			<button type = "button" id = "logoutBtn">logout</button>
		</a>
	</div>
</body>
</html>