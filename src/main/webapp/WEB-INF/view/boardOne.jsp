<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>Title.</th>
			<td>
				<input type = "text" name = "title" value = "${board.title}">
			</td>
		</tr>
		<tr>
			<td rowspan = "2">
				작성일:${board.}
			</td>
		</tr>
		<tr>
			<td rowspan = "2">
				<textarea rows="5" cols="20">${board.content}</textarea>
			</td>
		</tr>
	</table>
	<a href = "${pageContext.request.contextPath}/UpdateBoardFormController?bord">
		<button type = "button">수정</button>
	</a>
	<a href = "${pageContext.request.contextPath}/DeleteBoardController">
		<button type = "button">삭제</button>
	</a>
</body>
</html>