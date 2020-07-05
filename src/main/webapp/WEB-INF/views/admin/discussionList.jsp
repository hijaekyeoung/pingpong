<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${empty dlist}">
			등록된 토론 게시글이 없습니다.
		</c:when>
		<c:otherwise>
			<c:forEach var="dlist" items="${dlist}">
				${dlist.seq} : 
				<a href="/admin/discussionView?seq=${dlist.seq}">${dlist.writer}</a>
				 : ${dlist.title} : ${dlist.caution} : 
				${dlist.language} : ${dlist.dateString}<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>