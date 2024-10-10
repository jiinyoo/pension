<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

function idSearchMove()
{
	//부모창의 문서를 login
	location="usForm";
	//resizeTo(400,400);
	resizeBy(0,-50);
 	//open("pwdForm","","width=400,height=400");
	
}






</script>
</head>
<body><!-- pwdSearch-->

	<c:if test="${pwd!=null}">
		당신의 새 비밀번호 생성 링크가 전달 되었습니다.
	</c:if>
	
	<div align="center">
		<input type="button" onclick="winClose()" value="창닫기">
		<input type="button" onclick="loginMove()" value="로그인">
		<input type="button" onclick="idSearchMove()" value="아이디 찾기">
	</div>
	
</body>
</html>