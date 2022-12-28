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
		if($('#msg').val() != '') {
			alert('가입을 환영합니다!');
			$('#msg').val('');
		}
		
	});
</script>
</head>
<body>
	<h2>login</h2>
	<input type = "hidden" id = "msg" value = "${msg}">
	<form method = "post" action ="${pageContext.request.contextPath}/member/login">
		<div>
			<input type = "text" id = "id" name = "id">
		</div>
		<div>
			<input type = "password" id = "pw" name ="pw">
		</div>
		<button type = "submit">login</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/member/addMember">
			<button type = "button">Join Us!</button>
		</a>
	</div>
</body>
</html>