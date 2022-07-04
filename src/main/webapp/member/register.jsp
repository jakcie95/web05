<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h1>회원가입</h1>
<form id="fo" action="save.jsp" method='post'>
<input type="text" name="id" id="id" placeholder="아이디">(*필 수 항 목)<br>
<input type="text" name="pwd" id="pwd1" placeholder="비밀번호">(*필 수 항 목)<br>
<input type="text" id="pwd2"  onchange="pwdChk()" 
			placeholder="비밀번호 확인">
<label id="label">비밀번호 확인</label><br>
<input type="text" name="name" placeholder="이름"><br>
<input type="text" name="addr" placeholder="주소"><br>
<input type="text" name="tel" placeholder="전화번호"><br>
<input type="button" onclick="chk()" value="회원가입">
</form>

<script type="text/javascript">
let pwd1 = document.getElementById("pwd1")
let pwd2 = document.getElementById("pwd2")
function pwdChk(){
	let label = document.getElementById("label")
	if(pwd1.value == pwd2.value){
		label.innerHTML = "<b>일치합니다</b>"
	}else{
		label.innerHTML = "<b style='color:red;'>불 일치 합니다</b>"
		pwd1.value=""
		pwd2.value=""
		pwd1.focus()
	}
}
function chk(){
	//alert("chk호출")
	let id = document.getElementById("id")
	//let pwd1 = document.getElementById("pwd1")
	//let pwd2 = document.getElementById("pwd2")
	
	if(id.value ==""){
		alert("아이디는 필수 항목입니다.")
		id.focus()
		return;
	}else if(pwd1.value ==""){
		alert("비밀번호는 필수항목입니다.")
		pwd1.focus()
	}else if(pwd2.value ==""){
		alert("비밀번호 확인은 필수항목입니다.")
		pwd2.focus()
	}else{
		fo.submit()
	}
}
</script>
</body>
</html>