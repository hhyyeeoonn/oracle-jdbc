<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<button type = "button">logout</button>
		</a>
	</div>
</body>
</html>