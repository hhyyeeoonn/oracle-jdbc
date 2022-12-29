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
		
		$('#deleteMemberBtn').click(function() {
			if(('#pw').val() != '') {
				alert('비밀번호를 확인하세요');
				$('#pw').focus();
				return;
			}
			
			if($('#pw').val() != '') {
				$('#deleteMemberForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/index.jsp"></jsp:include>
	</div>
	
	<h5>회원탈퇴</h5>
	<form id = "deleteMemberForm" action = "${pageContext.request.contextPath}/member/removeMember" method = "post">
		<div>
			PW / <input type = "password" id = "pw" name = "pw">
		</div>
		<div>
			탈퇴하시겠습니까?
			<button type = "button" id = "deleteMemberBtn">탈퇴</button>
		</div>
	</form>
</body>
</html>