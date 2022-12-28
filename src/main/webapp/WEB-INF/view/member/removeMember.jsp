<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/index.jsp"></jsp:include>
	</div>
	
	<h5>회원탈퇴</h5>
	<form action = "${pageContext.request.contextPath}/member/removeMember" method = "post">
		<div>
			PW / <input type = "password" id = "pw" name = "pw">
		</div>
		<div>
			탈퇴하시겠습니까?
			<button type = "submit">탈퇴</button>
		</div>
	</form>
</body>
</html>