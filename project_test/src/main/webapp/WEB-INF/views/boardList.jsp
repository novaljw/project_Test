<%@page import="com.min.edu.dto.Answerboard_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체글조회</title>
<style type="text/css">
	.insert{
		border: 1px solid black;
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<script type="text/javascript">
	
</script>
<body>
	 <h1>boardList</h1>
	 <h1>전체글 보기</h1>
	 <div id=container>
	 <table border="1">
		<tr>
			<th>SEQ</th>
			<th>ID</th>
			<th>제 목</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach varStatus="vs" items="${lists}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.id}</td>
				<td><a href="./detailboard.do?seq=${dto.getSeq()}">${dto.title}</a></td>
				<td>${dto.readcount}</td>
				<td>${dto.regdate}</td>
				<td>${dto.delflag}</td>
				
			</tr>
		</c:forEach>
	</table>
	</div>
	<hr>
	<div>
		<input type="button" class="insert" value="글쓰기" onclick="location.href='./insertboard.do'"> 
	</div>
</body>
</html>