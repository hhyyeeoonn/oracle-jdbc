<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<div>
	<a href = "${pageContext.request.contextPath}/board/boardList">
		<button type = "button">게시판</button>
	</a>
	<a href = "${pageContext.request.contextPath}/member/memberOne">
		<button type = "button">회원정보</button>
	</a>
	<a href = "${pageContext.request.contextPath}/member/logout">
		<button type = "button">logout</button>
	</a>
</div>
