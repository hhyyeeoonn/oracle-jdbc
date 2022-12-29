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
		$('#id').focus();
		$('#createBtn').click(function() {
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
			if($('#pw').val() != $('#pw2').val()) { // 비밀번호 확인
				alert('비밀번호를 확인하세요');
				$('#pw2').focus();
				return;
			}
			if($('#name').val() == '') { // 비밀번호 빈칸 체크
				alert('이름을 입력하세요');
				$('#name').focus();
				return;
			}
			
			if($('#id').val() != '' && $('#pw').val() != '' && $('#name').val() != '') {
				$('#addMemberForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<h2>Create Account</h2>
	<form id = "addMemberForm" method = "post" action ="${pageContext.request.contextPath}/member/addMember">
		<div>
			<input type = "text" id = "id" name = "id">
		</div>
		<div>
			<input type = "password" id = "pw" name ="pw">
		</div>
		<div>
			<input type = "password" id = "pw2">
		</div>
		<div>
			<input type = "text" id = "name" name = "name">
		</div>
		<button type = "button" id = "createBtn">create</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/member/login">
			<button type = "button">login?</button>
		</a>
	</div>
</body>
</html>