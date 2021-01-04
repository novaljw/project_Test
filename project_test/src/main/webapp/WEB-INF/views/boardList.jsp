<%@page import="com.min.edu.dto.Answerboard_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체글조회</title>
<style type="text/css">
	.insert, .del{
		border: 1px solid black;
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<script type="text/javascript" src="./js/answerboard.js"></script>
<body>
<jsp:useBean id="pho" class="com.min.edu.usebean.ReplyPhoto" scope="page"/>
	 boardList
	 <p><h1>전체글 보기</h1><p>
	 
	<a href="./memberListMAV.do"><button>회원리스트</button></a>
	<a href="./logout.do"><button>로그아웃</button></a>
	
	 <div id=container>
	 <form action="./multiDel.do" method="post" onsubmit="return chsSubmit()">
	 
	 <table border="1">
		<tr>
			<th><input type="checkbox"  id="allCheck" onclick="checkAll(this.checked)"> </th>
			<th>SEQ</th>
			<th>ID</th>
			<th>제 목</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach varStatus="vs" items="${lists}" var="dto">
			<tr>
				<td><input type="checkbox" name="ch" value="${dto.getSeq()}"> </td>
				<td>${dto.seq}</td>
				<td>${dto.id}</td>
				<td>
						<c:choose>
							<c:when test="${dto.delflag eq 'Y' }">
								관리자에의해 삭제되었습니다.
							</c:when>
							<c:otherwise>
							<!-- 답글이라면 이미지처리 -->
<%-- 							<%=photo(${dto.depth}) %> --%>
							<jsp:setProperty property="depth" name="pho" value="${dto.depth}"/>
							<jsp:getProperty property="photo" name="pho"/>
							
							<a title="${dto.title}" href="./detailboard.do?seq=${dto.seq}">
								<c:choose>
									<c:when test="${fn:length(dto.title) >12}">
										${fn:substring(dto.title,0,8)}...
									</c:when>
									<c:otherwise>
										${dto.title}
									</c:otherwise>
								</c:choose>
							</a>	
							</c:otherwise>
						</c:choose> 
					</td>
							
				<td>${dto.readcount}</td>
				<td>${dto.regdate}</td>
				<td>${dto.delflag}</td>
				
			</tr>
		</c:forEach>
	</table>
	<hr>
	<div>
		<input type="button" class="insert" value="글쓰기" onclick="location.href='./insertboard.do'"> 
		<input class="del" type="submit" value="다중삭제">
	</div>
	</form>
	</div>
	
</body>
</html>