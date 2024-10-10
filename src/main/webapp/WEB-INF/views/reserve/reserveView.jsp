<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
		width:1000px;
		height:800px;
		margin:auto;
	}
	
	section table{
	
		border-spacing:0px;
	}
	
	section table td{
	
	
		height:40px;
	}



</style>
</head>
<body>
<section>
	<table width="800" align="center">
		<caption><h3>${name}님의 예약 내용</h3></caption>
		<tr>
			<td>예약객실</td>
			<td>${title}</td>
			<td>예약일</td>
			<td>${rdto.writeday}</td>		
		</tr>
		<tr>
			<td>입실일</td>
			<td>${rdto.inday}</td>
			<td>퇴실일</td>
			<td>${rdto.outday}</td>		
		</tr>
		<tr>
			<td>입실인원</td>
			<td>${rdto.inwon}명</td>
			<td>총결제금액</td>
			<td>${price2}원</td>
		</tr>
		<tr>
			<td>bbq세트</td>
			<td>${rdto.bbq}세트</td>
			<td>숯불패키지</td>
			<td>${rdto.chacol}회분</td>
		</tr>
	</table>
</section>
</body>
</html>