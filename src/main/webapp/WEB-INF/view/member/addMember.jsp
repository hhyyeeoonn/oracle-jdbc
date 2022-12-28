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
		
	});
</script>
</head>
<body>
	<h2>회원가입</h2>
	<form method = "post" action ="${pageContext.request.contextPath}/member/addMember">
		<div>
			<input type = "text" id = "id" name = "id">
		</div>
		<div>
			<input type = "password" id = "pw" name ="pw">
		</div>
		<div>
			<input type = "password2" id = "pw2">
		</div>
		<div>
			<input type = "text" id = "name" name = "name">
		</div>
		<button type = "submit">register</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/member/login">
			<button type = "button">login?</button>
		</a>
	</div>
</body>
</html>