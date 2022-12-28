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
	
	<form method = "post" action = "${pageContext.request.contextPath}/board/modifyBoard">
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
		<button type = "submit">글 수정</button>
	</form>
</body>
</html>