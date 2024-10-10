<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
body {
 	margin:0px;
 	font-family: 'Pretendard-Regular',"Noto Sans KR","Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
}
section{
	  width:1000px;
      height:600px;
      margin:auto;
}

table{
	border-spacing:0px;
	text-align:center;

}

table tr:first-child
{
	color:white;
	background:black;

}

table tr td{
	border-top:1px solid black;
	height:60px;

}

section table input[type=button] {
      width:70px;
      height:28px;
      background:#d2eaf8;
      color:black;
      border:1px solid #d2eaf8;
      border-radius:7px;
	
}


a{
	color:inherit;
	text-decoration:none;

}

a:visited{

	color:inherit;
}



</style>
</head>
<body>
<section>
	<table width="700" align="center">
	<caption><h2>객실관리 현황</h2></caption>
		<tr id="tfirst">
			<td>객실명</td>
			<td>최소인원</td>
			<td>최대인원</td>	
			<td>가 격</td>
			<td>등록일</td>
		</tr>
		<c:forEach items="${rlist}" var="rdto">	
			<tr>
				<td><a href="content?id=${rdto.id}">${rdto.title}</a></td>
				<td>${rdto.min} 명</td>
				<td>${rdto.max} 명</td>	
				<td>${rdto.price2} 원</td>
				<td>${rdto.writeday}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="center">
				<a href="write"><input type="button" value="객실 추가"></a>
			</td>
 		</tr>
	</table>
	
</section>
</body>
</html>