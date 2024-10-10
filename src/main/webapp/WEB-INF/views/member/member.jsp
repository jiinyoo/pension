<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}




section{
	width:1000px;
	height:600px;
	margin:auto;
	text-align:center;
}




section div{

	margin-top:10px;
	text-align:center;
}


section div input{

	border:1px solid #2088c5;
	background:white;
	outline:center;
}

section #txt{
	width:400px;
	height:40px;
}


section #pwdx{
	width:400px;
	height:40px;
}

section #sub{
	border:1px solid #d2eaf8;
	width:408px;
	height:44px;
	background:#d2eaf8;
	color:black;
	font-family:'Pretendard-Regular',"Noto Sans KR","Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	font-weight: bold;
	
}

section #userid #umsg
{
	font-size:11px;
}


section #pwd2 #pmsg
{
	font-size:11px;
}

</style>
<script>
var uchk=0;
function dupCheck(userid)
{
		if(userid.trim().length>=4)
		{
			var chk=new XMLHttpRequest();
			chk.onload=function()
			{
				if(chk.responseText=="0"){
					document.getElementById("umsg").innerText="사용이 가능한 아이디 입니다.";
					document.getElementById("umsg").style.color="blue";
					uchk=1;
				}else{
					document.getElementById("umsg").innerText="이미 사용 중인 아이디 입니다.";
					document.getElementById("umsg").style.color="red";
					uchk=0;
				}
				
			}
			chk.open("get","dupCheck?userid="+userid);
			chk.send();
		}else
		{
			document.getElementById("umsg").innerText="아이디는 길이가 4자 이상입니다.";
			document.getElementById("umsg").style.color="red";
			uchk=0;
			
		}
	
}


var pchk=0;
function pwdCheck()
{
	var pwd=document.mform.pwd.value;
	var pwd2=document.mform.pwd2.value;
	if(pwd==pwd2)
	{
		document.getElementById("pmsg").innerText="비밀번호 확인이 일치합니다.";
		document.getElementById("pmsg").style.color="blue";	
		pchk=1;
	}
	else
	{
		document.getElementById("pmsg").innerText="비밀번호 확인이 일치하지 않습니다.";
		document.getElementById("pmsg").style.color="red";
		pchk=0;
	}
	
}

function check()
{
	if(uchk==0)
	{
		alert("아이디 중복체크를 완료해주세요.");
		return false;
	}
		else if(pchk==0)
		{
			alert("비밀번호 체크를 하세요");
			return false;
		}
			else if(document.mform.email.value.trim().length==0)
			{
				alert("이메일을 입력하세요");
				return false;
			}
			else{
					return true;
				}
	
}

</script>
</head>
<body>
	<section>
      <form method="post" name="mform" action="memberOk" onsubmit="return check()">
		<h3>회원 가입</h3>
		<div id="userid">
			<input type="text" name="userid" placeholder="아 이 디" onblur="dupCheck(this.value)" id="txt">
			<br><span id="umsg"></span>
		</div>
		<div id="name"><input type="text" name="name" placeholder="이 름" id="txt"></div>
		<div id="pwd1"><input type="password" name="pwd" placeholder="비밀번호" id="pwdx"></div>
		<div id="pwd2">
			<input type="password" name="pwd2" onkeyup="pwdCheck()" placeholder="비밀번호 확인" id="pwdx">
			<br><span id="pmsg"></span>
		</div>
		<div id="email"><input type="text" name="email" placeholder="이메일" id="txt"></div>
		<div id="phone"><input type="text" name="phone" placeholder="전 화 번 호" id="txt"></div>
		<div id="submit"><input type="submit" value="회원가입" id="sub" ></div>
	  </form>
	</section>
</body>
</html>