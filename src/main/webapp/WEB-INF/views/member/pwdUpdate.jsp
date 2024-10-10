<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="pwdUpdateOk">
	<table align="center" value="700">
	<input type="hidden" name="userid" value="${userid}">
	<caption>비밀번호 변경</caption>
		<tr><td><input type="password" name="pwd" placeholder="새 비밀번호"></td></tr>
		<tr><td><input type="password" name="pwd2" placeholder="새 비밀번호 확인"></td></tr>
		<tr><td><input type="submit" value="확인"></td></tr>
	</table>
</form>
</body>
</html>