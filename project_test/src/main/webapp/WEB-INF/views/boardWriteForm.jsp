<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글 작성 폼</title>
</head>
<body onbeforeunload="closeConfirm()">
<%-- <%@include file="./boardTopMenu.jsp" %> --%>
<div id="container" class="container">
	<div class="col-sm">
		<h2>게시글작성</h2>
			<form action="./write.do" method="post">
				<div class='form-group'>
					<label for='title'>작성자</label>
					<p class='form-control'>${sessionScope.mem.name}</p>
				</div>
				<div class='form-group'>
					<label for='title'>제목</label> 
					<input class='form-control'	type='text' id='title' name='title' required />
				</div>

				<div class='form-group'>
					<label for='content'>내용</label>
					<textarea class='form-control' rows='5' id='content' name='content'	required></textarea>
				</div>
				
				<div class="form-group">
					<input type="submit" value="글등록" class="btn btn-success">
					<input type="button" value="글목록이동" class="btn btn-success" onclick="listMove()">
				</div>
			</form>
		</div>
</div>
<script type="text/javascript">
	function listMove() {
		location.href="./boardList.do";
	}
	
	function closeConfirm(){
		event.returnValue="닫힘";
	}
</script>

</body>
</html>