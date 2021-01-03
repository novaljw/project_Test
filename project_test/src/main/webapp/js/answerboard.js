window.onload = function(){
//	alert("온로드");
	var chs = document.getElementsByName("ch");
	var allCheck = document.getElementById("allCheck");
	for (var i = 0; i < chs.length; i++) {
		chs[i].onclick = function(){
			if(chs.length  == chsConfirm()){
				allCheck.checked = true;
			}else{
				allCheck.checked = false;
			}
		}
	}
	
	var resetBtn =  document.getElementById("replyReset");
	resetBtn.onclick=function(){
		document.getElementById("conTxt").innerHTML = "내용<br>(원본)";
	}
	
}

function chsConfirm(){
	var chs = document.getElementsByName("ch");
	var cnt = 0;
	for (var i = 0; i < chs.length; i++) {
		if(chs[i].checked){
			cnt++;
		}
	}
	return cnt;
}

function submitForm(){
	document.forms[0].submit();
}

function chsSubmit(){
	var isc = false;
	if(chsConfirm() <1){
		swal('', '선택된 글이 없습니다.');
	}else{
		swal({
			title : "다중삭제",
			text : "삭제 진행 하시겠습니까?",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : true,
			closeOnCancel : false
		},
		function(isConfirm) {
//			alert(isConfirm);
			if (isConfirm) {
				swal('', '삭제를 실행하였습니다.');
				submitForm();
			}else{
				swal('', '삭제를 취소하셨습니다..');
			}
		}
		);
	}
		return isc;
}


// boardList.jsp 전체 선택
function checkAll(bool){
	var chs = document.getElementsByName("ch");
	for (var i = 0; i < chs.length; i++) {
		chs[i].checked = bool;
	}
}

// detailBoard.jsp
// DB삭제 기능 delreal()
function delreal(){
	var con = confirm("선택된 글이 DB에서 삭제 됩니다.");
	if(con){
		var form = document.forms[0];
		form.action = "./board.do?command=deleteBoard";
		form.method = "post";
		form.submit();
	}else{
		alert("삭제가 취소 되었습니다.");
	}
}


// modifyForm.jsp
// 뒤로가기 backView()
function backView(){
	history.back(-1);
}


// replyForm.jsp
// contentCheck()
function contentCheck(){
	var obj1 = document.getElementById("hideContent").value;
	var obj2 = document.getElementById("txtArea").value;
	var obj3 = obj2.replace("원본글>","");
//	alert(obj3);
	if(obj1 == obj3){
		document.getElementById("txtArea").value="";
		document.getElementById("conTxt").innerHTML = "내용<br>작성중";
	}
}


















