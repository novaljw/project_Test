<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세글 보기</title>
<style>
.center{
margin: 5px 25px; padding: 20px
}
 #viewlist, #modify{
 	font-size: large;
 	border: 1px solid black;
 }
</style>
</head>
<body>
<h1>detailboad</h1>
<br>
<br>
<h1>상세글 보기</h1>
<table border="1">
		<tr>
			<th>SEQ</th>
			<th>ID</th>
			<th>제 목</th>
			<th>내 용</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
			<tr>
				<td>${detail.seq}</td>
				<td>${detail.id}</td>
				<td>${detail.title}</td>
				<td>${detail.content}</td>
				<td>${detail.readcount}</td>
				<td>${detail.regdate}</td>
				<td>${detail.delflag}</td>
				
			</tr>
	</table>
	<hr>
	<form action="./modifyBoard.do?seq=${detail.getSeq()}&content=${detail.getContent()}&id=${detail.getId()}&title=${detail.getTitle()}" method="post">
	 <input id="modify" type="submit" value="글 수정하기" >
	</form>
	<hr>
	<button id="viewlist" type="button" onclick="location.href='./boardList.do'">글목록 보기</button>
</body>
</html>