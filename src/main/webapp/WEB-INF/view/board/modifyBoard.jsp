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
		$('#title').focus();
		$('#modifyBtn').click(function() {
			if($('#title').val() == '' || $('#content').val() == '') { // 빈칸 체크
				alert('비어있는 내용을 입력하세요');
				return;
			} 
			
			if($('#title').val() != '' && $('#content').val() != '') {
				$('#modifyForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/index.jsp"></jsp:include>
	</div>
	<form id = "modifyForm" method = "post" action = "${pageContext.request.contextPath}/board/modifyBoard">
		<input type = "hidden" name = "memberId" value = "${board.memberId}">
		<input type = "hidden" name = "boardNo" value = "${board.boardNo}">
		<table>
			<tr>
				<th>Title</th>
				<td>
					<input type = "text" id = "title" name = "title" value = "${board.boardTitle}">
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<textarea rows="5" cols="20" id = "content" name = "content">${board.boardContent}</textarea>
				</td>
			</tr>
		</table>
		<button type = "button" id = "modifyBtn">글 수정</button>
	</form>
</body>
</html>