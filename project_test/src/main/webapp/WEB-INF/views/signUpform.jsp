<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="./css/sweetalert.css">
<script type="text/javascript">
	function check(){
		
		//화면에서 입력하는 데이터
		var name = document.getElementById('name').value;
		var id = document.getElementById('id').value;
		var password = document.getElementById('password').value;
		var passOk = document.getElementById('passOk').value;
		var i_agree3 = document.getElementById('i_agree3').checked;
		var chkval = document.getElementById('chkval').value;
		
		var frm  = document.frm; 
		
		if(password != passOk){
			swal('회원가입 오류','비밀번호를 확인해 주세요');
			return false;
		}else if(chkval == '0'){
			swal('회원가입 오류','아이디를를 확인해 주세요');
			return false;
		}else if(i_agree3 == false){
			swal('회원가입 오류','개인정보 수입 동의(필수) 해주세요');
			return false;
		}else{
			return true;
		}
	}
	
	$(document).ready(function(){
		$('#id').keyup(function(){
			
			var idLength = $(this).val().length;
			var id = '';
			id = $(this).val();
// 			alert(id);
			
			if(id.indexOf(" ") != -1){
				$('#result').css("color","red");
				$('#result').html('공백이 포함된 아이디를 사용하실 수 없습니다.');
				$('#chkval').val('0');
			}else if(idLength <= 5 && idLength >= 20 ){
				$('#result').css("color","red");
				$('#result').html('아이디는 5~20자리만 입력해주세요');
				$('#chkval').val('0');
			}else if(idLength >5){
				
				//Ajax 처리
				jQuery.ajax({
					type : "post",
					url : "./idCheck.do",
					data : "id="+$(this).val(),
					async : true,
					success : function(msg){
					
						if(msg.isc == 'true'){
							$('#chkval').val('0');
							$('#result').html('사용 불가능한 아이디 입니다.');
							$('#result').css('color','red');
						}else{
							$('#chkval').val('1');
							$('#result').html('사용 가능한 아이디 입니다.');
							$('#result').css('color','green');
						}
					},
					error : function(){
						alert('잘못된 요청 값 입니다.');
					}
				});
			}else{
				$('#result').css('color','red');
				$('#result').html('6자리 이상만 사용 가능합니다.');
				$('#chkval').val('0');
			}
			
		});
		
	});

</script>

</head>
<body>
<div id="container">
	<h1>회원가입</h1>
	<!-- ID 유효성을 판단하는 값 -->
	<input type="hidden" id="chkval" value="1">
	
	<form action="./signUp.do" method="post" id="frm" name="frm" onsubmit="return check();">
		<div id="info">
			<div id="leftInfo">정보입력</div>
			<div id="centerInfo" >
				<input type="text" id="name" name="name" placeholder="이름" required ><br>
				<input type="text" id="id" 	 name="id"   placeholder="아이디" required maxlength="20"><br>
				<span id="result"></span>
				<input type="password" id="password" name="password" placeholder="비밀번호" required><br>
				<input type="password" id="passOk" placeholder="비밀번호 확인" required>
			</div>
			<div id="rightInfo">
			</div>
			<hr>
			<div id="bottomInfo">
				<div class="usm-agree">
					<input type="checkbox" id="i_agree3" name="i_agree3" >
					<label for="i_agree3">
						개인정보 제3자 제공 동의 (선택)
					</label>
				</div>

<!-- 					<div class="usm-join-box"> -->
<!-- 						<dl> -->
<!-- 							<dt> -->
<!-- 								<strong>개인정보보호법 제15조(개인정보의 수집·이용)에 의거 홈페이지 회원가입을 위한 -->
<!-- 									개인정보를 다음과 같이 수집·이용하고자 합니다.</strong> -->
<!-- 							</dt> -->
<!-- 							<br> -->
<!-- 							<dt> -->
<!-- 								<strong>[개인정보의 수집 및 이용 목적]</strong> -->
<!-- 							</dt> -->
<!-- 							<dd>충청북도학교통합홈페이지는 다음과 같은 목적을 위하여 개인정보를 수집, 이용합니다.</dd> -->
<!-- 							<dd>- 충청북도학교통합홈페이지 통합 회원관리</dd> -->
<!-- 							<dd>- 제한적 본인 확인제에 따른 본인확인, 비밀번호 분실 시 본인확인 등</dd> -->
<!-- 							<dd>- 개인식별, 부정이용 방지, 비인가 사용방지, 가입의사 확인</dd> -->
<!-- 							<dd>- 만14세 미만 회원의 법정 대리인 동의여부 확인</dd> -->
<!-- 							<dd>- 불만처리 등 민원처리, 공지사항 전달</dd> -->

<!-- 							<dt> -->
<!-- 								<strong>[개인정보 수집에 관한 사항]</strong> -->
<!-- 							</dt> -->
<!-- 							<dd>① 필수항목 : 이름, 아이디, 비밀번호, 학년반(학생), 본인확인인증정보, 14세미만 법정대리인 -->
<!-- 								인증정보</dd> -->
<!-- 							<dd>② 선택항목 : 생년월일, 졸업년도(졸업생)</dd> -->

<!-- 							<dt> -->
<!-- 								<strong>[개인정보 보유 및 이용기간]</strong> -->
<!-- 							</dt> -->
<!-- 							<dd class="usm-clr-blue">귀하께서 입력하신 개인정보는 2년간 보유되며, 가입 후 매 -->
<!-- 								2년이 되는 시점에 회원의 동의에 의해 그 기간은 연장되며, 회원 탈퇴시 개인정보는 그 즉시 삭제됩니다.</dd> -->
<!-- 							<dd class="usm-clr-blue">삭제 요청 및 홈페이지 탈퇴 시 까지의 개인정보는 회원으로 가입 -->
<!-- 								한 학교와 충청북도교육연구정보원 개인정보처리방침에 의거 보유 및 이용됩니다.</dd> -->
<!-- 							<dd class="usm-clr-blue">다만, 탈퇴자의 아이디는 동일한 아이디의 중복 가입을 방지하기 -->
<!-- 								위해 보존하며, 기타 관계법령의 규정에 의하여 보존할 필요가 있는 경우 관계법령에 따릅니다.</dd> -->

<!-- 							<dt> -->
<!-- 								<strong>[개인정보 수집·이용에 대한 동의를 거부할 권리]</strong> -->
<!-- 							</dt> -->
<!-- 							<dd>귀하께서는 상기의 개인정보 수집 및 이용에 대하여 동의를 거부할 수 있습니다.</dd> -->
<!-- 							<dd>필수항목의 경우 회원 가입 시 필요한 항목으로 동의 거부 시 회원가입이 제한되며, 선택 항목은 -->
<!-- 								동의하지 않아도 회원가입 및 서비스 거부를 하지 않습니다.(선택항목에 대하여 차후에 회원정보수정을 통하여 정보를 -->
<!-- 								입력할 수 있으며 입력된 항목은 동의를 한 것으로 간주 합니다.)</dd> -->
<!-- 						</dl> -->
<!-- 					</div> -->

				</div>
			
			<div id="button">
					<input class="btn btn-success"  type="submit" value="동의하고 회원가입">
					<input class="btn btn-primary" type="button" value="돌아가기" onclick="javascript:history.back(-1)">
			</div>
		</div>
	</form>
</div>
</body>
</html>









