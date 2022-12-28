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
		$('#rowPerPage').change(function() {
			$('#pageForm').submit();
			alert('change');
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/index.jsp"></jsp:include>
	</div>
	
	<h1>BOARD LIST</h1>
	<form id = "pageForm" method = "get" action ="${pageContext.request.contextPath}/board/BoardList">
		<select name = "rowPerPage" id = "rowPerPage">
			<c:if test = "${rowPerPage == 10}">
				<option value = "10" selected = "selected">10</option>
				<option value = "20">20</option>
				<option value = "30">30</option>
			</c:if>
			<c:if test = "${rowPerPage == 20}">
				<option value = "10">10</option>
				<option value = "20" selected = "selected">20</option>
				<option value = "30">30</option>
			</c:if>
			<c:if test = "${rowPerPage == 30}">
				<option value = "10">10</option>
				<option value = "20">20</option>
				<option value = "30" selected = "selected">30</option>
			</c:if>
		</select>
	</form>
	<table>
		<tr>
			<th>No.</th>
			<th>Title</th>
			<th>Createdate</th>
		</tr>
		<c:forEach var = "b" items = "${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href = "${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
				<td>${b.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href = "${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage - 1}">이전</a>
		<a href = "${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage + 1}">다음</a>
	</div>
</body>
</html>