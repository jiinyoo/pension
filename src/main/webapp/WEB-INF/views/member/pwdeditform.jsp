<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.pwdedit
{
 	height:47px;
 	margin:auto;
 	text-align:center;
}
.pwdedit input[type="password"]
{
	height:25px;
	width:200px;
	outline:none;
	text-align:center;
	margin:auto;
}

.pwdedit input[type="submit"]
{
	border:1px solid #d2eaf8;
	width:200px;
	height:30px;
	background:#d2eaf8;
	color:black;

}

#toptext
{

	text-align:center;
}

hr
{
	border:1px solid black;
	

}

</style>
<title>Insert title here</title>
</head>
<body>
<div id="pwdeditdiv">
		<form method="post" action="pwdEdit">
			<span id="toptext"><h3>비밀번호 변경</h3></span>
			<hr>
			<div class="pwdedit"><input type="password" placeholder="현재 비밀번호" name="pwd"></div>
			<div class="pwdedit"><input type="password" placeholder="새 비밀번호" name="newpwd1"></div>
			<div class="pwdedit"><input type="password" placeholder="새 비밀번호 확인" name="newpwd2"></div>
			<div class="pwdedit"><input type="submit" value="수정"></div>
		</form>
		<c:if test="${err==1}">
			<div style="color:red;font-size:11px;text-align:center">기존비밀번호가 틀립니다.</div>
		</c:if>
</div>
</body>
</html>