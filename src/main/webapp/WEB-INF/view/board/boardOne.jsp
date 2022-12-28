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
	
	<table>
		<tr>
			<th>Title.</th>
			<td>
				<input type = "text" name = "title" value = "${boardOne.boardTitle}">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				작성일 / ${boardOne.createdate}
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<textarea rows="5" cols="30">${boardOne.boardContent}</textarea>
			</td>
		</tr>
	</table>
	<a href = "${pageContext.request.contextPath}/board/modifyBoard?boardNo=${boardOne.boardNo}">
		<button type = "button">수정</button>
	</a>
	<a href = "${pageContext.request.contextPath}/board/removeBoard?boardNo=${boardOne.boardNo}">
		<button type = "button">삭제</button>
	</a>
</body>
</html>