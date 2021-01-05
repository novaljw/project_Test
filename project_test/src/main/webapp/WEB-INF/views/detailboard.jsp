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
 #viewlist, #modify, #reply, #del{
 	font-size: large;
 	border: 1px solid black;
 }
</style>

</head>
<script type="text/javascript" src="./js/answerboard.js"></script>
<body>
<h1>detailboard</h1>
<br>
<br>
<h1>상세글 보기</h1>
	<button id="viewlist" type="button" onclick="location.href='./boardList.do'">글목록 보기</button>
	<hr>
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
	 <input type="hidden" name="seq" value="${detail.getSeq()}">
	 <input id="modify" type="submit" value="글 수정하기" >
	</form>
	
	<!-- onclick으로 자바스크립트 처리 -->
	<p>
	 <button id="del" onclick="delreal()">글 삭제하기</button>
	</p>
	
	<!-- 답글  -->
	<hr>
	<form action="./reply.do?seq=${detail.getSeq()}" method="post">
		<div >
            <label>작성자 ID : </label>
           	<p>${sessionScope.mem.id}</p>
        </div>
        <div >
            <label>제 목</label>
            <input type="text" name="title" placeholder="제 목" required>
        </div>
        <div >
            <label>내 용</label>
            <textarea style="resize: none;" name="content" rows="10" cols="60" placeholder="내용을 입력하세요" required></textarea>
        </div>
	 <input id="reply" type="submit" value="답글입력" >
	 </form>
	
</body>
</html>