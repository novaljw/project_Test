<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<style>
.center{
margin: 5px 25px; padding: 20px
}
 #viewlist, #sub, #back{
 	font-size: large;
 	border: 1px solid black;
 }
</style>
</head>
<body>
modifyBoard<br>
seq = ${seq}
<h1>글 수정하기</h1>
		<button id="viewlist" type="button" onclick="location.href='./boardList.do'">글목록 보기</button>
	<hr>
		<form action="./modifyRegist.do" 
		method="post">
		 <div>
		 	<input type="hidden" name="seq" value="${seq}">
		 </div>
        <div >
             <label>작성자 ID : </label>
              <p>${sessionScope.mem.id}</p>
        </div>
        <div >
            <label>제 목</label>
            <input type="text" name="title" placeholder="${title}" readonly>
        </div>
        <div >
            <label>내 용</label>
            <textarea style="resize: none;" name="content" rows="10" cols="60" placeholder="${content}" required></textarea>
        </div>
   
    <input id="sub" type="submit" value="수정글 등록" >
    
    </form>
    
    <hr>
    
	<button id="back" onclick="history.back(-1)">뒤로 가기</button>

</body>
</html>