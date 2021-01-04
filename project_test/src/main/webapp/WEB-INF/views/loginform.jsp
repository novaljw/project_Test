<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" type="text/css" href="./css/Login.css">
<link rel="stylesheet" type="text/css" href="./css/sweetalert.css">

<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
<script type="text/javascript">

	window.onload = function(){
		document.getElementById('SignUp').onclick =function(){
			location.href="./signUpform.do";
		}
	};


	function loginCheck(){
		var id = document.getElementById("InputId").value; // $("#InputId").val()
		var pw = document.getElementById("InputPw").value;
		var frm = document.frm;
		
		frm.action ="./login.do"; // ajax에서 이동할 주소
		
		var result = "";
		
		if(id == "" || id.trim()==""){
			document.getElementById("InputId").focus();
			$("InputId").val("");
			swal("로그인","아이디를 입력해 주세요");
		}else if(pw == "" || pw.trim()==""){
			document.getElementById("InputPw").focus();
			$("InputPw").val("");
			swal("로그인","비밀번호를 입력해 주세요");
		}else{
			$.ajax({
				type:"post",
// 				url:"./loginCheckText.do",
				url:"./loginCheckMap.do", // Jackson mapper 처리 하는 Controller
				data:"id="+id+"&pw="+pw,
				success: function(msg){ //  Map으로 반환해줌 ["isc","성공"]
// 					alert(msg.isc);
					if(msg.isc == "성공"){
						frm.submit();
					}else{
						swal("로그인","해당 사용자는 존재하지 않습니다.");
					}
				},
				error:function(){
					swal("로그인","로그인에 문제가 발생 했습니다");
				}
			});
		}
		
		
	}
</script>
</head>
<body>


<!-- Ajax를 통신을 통해서 로그인처리 할것임 -->
<div id="container">
	<div id="title">Together Login</div>
	<div id="id">아이디</div>
	<form method="post" name="frm">
		<input type="hidden" id="loginChk" name="auth" value="0">
		<input type="text" name="id" id="InputId" value="ADMIN01" placeholder="아이디입력"><br>
		<div id="pw">비밀번호</div>
		
		<input type="password" name="pw" id="InputPw" value="ADMIN01" onkeyup="enterKey()"><br>
		
		<input type="button" id="login" name="login" value="로그인"
		 onclick="loginCheck()"><br>
		
		<div id="bottom">
<!-- 			<a href="#" onclick="signUp()"> -->
				<input type="button" id="SignUp" name="signup" value="회원가입">
<!-- 			</a> -->
			<input type="button" id="SearchId" name="SearchId" value="아이디찾기" onclick="idSearch()"> 
			<input type="button" id="SearchPw" name="SearchPw" value="비밀번호 찾기" onclick="pwSearch()">
		</div>
	</form>
</div>

<script type="text/javascript">
	function enterKey(){
		if(window.event.keyCode == 13){
			loginCheck();
		}
	}
</script>

</body>
</html>









