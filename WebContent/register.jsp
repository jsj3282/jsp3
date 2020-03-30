<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	function register(){
		let id = document.getElementsById("id")
		let pwchk = document.getElementById("pwchk")
		if(id==null){
			alert("아이디는 필수 입력 사항입니다.")
		}
		if(pwchk==null){
			alert("비밀번호는 필수 입력 사항입니다.")
		}
	}
	function register2(){
		let pw = document.getElementById("pw")
		let pwchk = document.getElementById("pwchk")
		if(pw!=pwchk){
			document.getElementById("lbl").text = "불일치!!!"
		}
	}
	</script>
	<form action="chkRegister" method="post">
	<input type="text" id = "id" name="id" placeholder="아이디"><label>(*필수 항목)</label><br>
	<input type="text" id = "pw" name="pw" placeholder="비밀번호"><br>
	<input type="text" id = "pwchk" name="pwchk" placeholder="비밀번호 확인" onchange="register2()"><label id="lbl">(*필수 항목)</label><br>
	<input type="text" name="name" placeholder="이름"><br>
	<input type="text" name="addr" placeholder="주소"><br>
	<input type="text" name="tel" placeholder="전화번호"><br>
	<input type="submit" value="회원가입" onclick="register()">
	</form>
</body>
</html>