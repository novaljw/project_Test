<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체글 보기</title>
</head>
<body>
<%-- <%@include file="./boardTopMenu.jsp" %> --%>

<div id='container' class="container">
	<table class="table table-hover">
		<thead>
			<tr class="danger">
				<th>연번</th>
				<th>아이디</th>
				<th>이름</th>
				<th>삭제여부</th>
				<th>권한</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${mList}" varStatus="vs">
			<tr>
				<td>${vs.count}</td>
				<td>${user.id}</td>
				<td>${user.name}</td>
				<td>${user.delflag}</td>
				<td>${user.auth == "U"?"사용자":"관리자"}</td>
				<td>
					<fmt:parseDate var="dateConvert" 
					value="${user.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${dateConvert}" pattern="yyyy/MM/dd"/>					
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<input class="btn btn-warning btn-block" type="button" value="돌아가기" onclick="history.back(-1)">
	</div>
</div>

</body>
</html>