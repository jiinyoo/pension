<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:1000px;
	height:600px;
	margin:auto;
}
</style>
</head>
<body>
<section>
	<table width="500" align="center">
	<caption><h3>${idto.inqNumber}번 문의</h3></caption>
		<tr>
			<td width="100">문의 영역</td>
			<td>${idto.title2}</td>
		</tr>
		<tr>
			<td>문의 내용</td>
			<td>${idto.content}</td>
		</tr>
		<tr>
			<td>답변 내용</td>
			<td>${idto.answer}</td>
		</tr>
		<tr>
			<td>작성 일자</td>
			<td>${idto.writeday}</td>
		</tr>
	
	</table>
</section>
</body>
</html>