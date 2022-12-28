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
	<div>
		<jsp:include page="/WEB-INF/view/index.jsp"></jsp:include>
	</div>
	
	<h2>회원정보</h2>
	<form method = "post" action ="${pageContext.request.contextPath}/member/modifyMember">
		<div>
			<input type = "text" id = "id" name = "id" value = "${selectMember.memberId}" readonly = "readonly">
		</div>
		<div>
			<input type = "text" id = "name" name = "name" value ="${selectMember.memberName}">
		</div>
		<div>
			<input type = "password" id = "pw" name ="pw">
		</div>
		<button type = "submit">수정</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/member/removeMember">
			<button type = "button">탈퇴</button>
		</a>
	</div>
</body>
</html>