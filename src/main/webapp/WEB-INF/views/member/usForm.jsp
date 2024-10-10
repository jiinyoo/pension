<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#outer{

	margin:auto;
 	text-align:center;

}
.inner
{
 	height:47px;
 	margin:auto;
 	text-align:center;
}
.inner input[type="text"]
{
	height:25px;
	width:200px;
	outline:none;
	text-align:center;
	margin:auto;
}

.inner input[type="submit"]
{
	border:1px solid #d2eaf8;
	width:200px;
	height:30px;
	background:#d2eaf8;
	color:black;

}


.inner input[type="password"]
{
	border:1px solid green;
	border-radius:20px;
	width:200px;
	height:15px;
	text-align:center;
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
</head>
<body><!-- member/usForm -->
	<div id="outer">
	<form method="post" action="useridSearch">
		<h3>아이디 찾기</h3>	
		<div class="inner"><input type="text" name="name" placeholder="이름"></div>
		<div class="inner"><input type="text" name="email"  placeholder="이메일"></div>
		<div class="inner"><input type="submit" value="아이디 찾기"></div>
		<c:if test="${err!=null}">
		<div style="font-size:9px">입력하신 정보가 일치하지 않습니다.</div>
		</c:if>
	</form>
	</div>
</body>
</html>