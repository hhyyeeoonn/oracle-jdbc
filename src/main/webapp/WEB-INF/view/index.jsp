<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
<div>
	<a href = "${pageContext.request.contextPath}/home">
		<button type = "button">메인</button>
	</a>
	<a href = "${pageContext.request.contextPath}/board/boardList">
		<button type = "button">게시판</button>
	</a>
	<a href = "${pageContext.request.contextPath}/member/logout">
		<button type = "button" id = "logoutBtn">logout</button>
	</a>
</div>
