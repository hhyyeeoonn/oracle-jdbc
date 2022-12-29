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
		if($('#msg').val() != '') { // 가입 완료 후
			alert('가입을 환영합니다!');
			$('#msg').val('');
		}
		
		if($('#loginMsg').val() != '') { // 로그인 실패시
			alert('아이디와 비밀번호를 확인하세요');
			$('#loginMsg').val('');
		}
		
		$('#id').focus();
		$('#loginBtn').click(function() {
			if($('#id').val() == '') { // 아이디 빈칸 체크
				alert('아이디를 입력하세요');
				$('#id').focus();
				return;
			} 
			if($('#pw').val() == '') { // 비밀번호 빈칸 체크
				alert('비밀번호를 입력하세요');
				$('#pw').focus();
				return;
			}
			
			if($('#id').val() != '' && $('#pw').val() != '') {
				$('#loginForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<h2>login</h2>
	<input type = "hidden" id = "msg" value = "${msg}">
	<input type = "hidden" id = "loginMsg" value = "${loginMsg}">
	<form id = "loginForm" method = "post" action ="${pageContext.request.contextPath}/member/login">
		<div>
			<input type = "text" id = "id" name = "id">
		</div>
		<div>
			<input type = "password" id = "pw" name ="pw">
		</div>
		<button type = "button" id = "loginBtn">login</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/member/addMember">
			<button type = "button">Join Us!</button>
		</a>
	</div>
</body>
</html>