<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
.center{
margin: 5px 25px; padding: 20px
}
 #viewlist, #sub{
 	font-size: large;
 	border: 1px solid black;
 }
</style>
</head>
<body>
insertboard
<h1>글쓰기</h1>
    <button id="viewlist" type="button" onclick="location.href='./boardList.do'">글목록 보기</button>
<hr>
		<form action="./postWrite.do" method="post">
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
        <hr>
    <input id="sub" type="submit" value="글등록" >
    
    </form>
    
    
</body>
</html>