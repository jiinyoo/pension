<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin-top:20px;
	}
</style>
<script>
function winClose()
{
	close();	
}

function loginMove()
{
	//부모창의 문서를 login
	opener.location="../member/login"
	close();
}

function pwdMove()
{
	//부모창의 문서를 login
	location="pwdForm";
	//resizeTo(400,400);
	resizeBy(0,50);
 	//open("pwdForm","","width=400,height=400");
	
}



</script>

</head>
<body><!-- member/useridSearch.jsp -->

	<div align="center">당신의 아이디 : ${userid}</div>
	<div align="center">
		<input type="button" onclick="winClose()" value="창닫기">
		<input type="button" onclick="loginMove()" value="로그인">
		<input type="button" onclick="pwdMove()" value="비밀번호찾기">
	</div>
</body>
</html>