<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

input:disabled {
    color: white;
}


</style>
</head>
<body>
<section>
<table align="center" width="900">
	<caption><h2>회원 리스트</h2></caption>
	<tr>
		<td>이름</td>
		<td>아이디</td>
		<td>전화번호</td>
		<td>이메일</td>
		<td>등록일</td>
		<td>회원상태</td>
		<td width="300">상태 선택 버튼</td>
	</tr>
	<c:forEach items="${mapAll}" var="map">
		<tr>
			<td>${map.name}</td>			
			<td>${map.userid}</td>
			<td>${map.phone}</td>
			<td>${map.email}</td>
			<td>${map.writeday}</td>
			<td>
			<c:if test="${map.state==0}">
			 <a href="../adminRoom/memberUp?id=${map.id}&state=3">정상회원</a>
			</c:if>
			<c:if test="${map.state==1}">
			 <a href="../adminRoom/memberUp?id=${map.id}&state=2">탈퇴신청중</a>
			</c:if>
			<c:if test="${map.state==2}">
			 탈퇴회원
			</c:if>
			<c:if test="${map.state==3}">
			 불량회원
			</c:if>
			</td>
			<td>
				<c:set var="aa" value=""/>
				<c:set var="bb"	value=""/>
				<c:set var="cc" value=""/>
				<c:if test="${map.state==0}">
					<c:set var="aa" value="disabled style='color:white;'"/>
				</c:if>	
				<c:if test="${map.state==1}">
					<c:set var="bb" value="disabled style='color:white;'"/>
				</c:if>
				<c:if test="${map.state==2}">
					<c:set var="cc" value="disabled style='color:white;'"/>
				</c:if>
				<input type="button" value="정상회원" ${aa} onclick="location='chgState?state=0&id=${map.id}'">
				<input type="button" value="탈퇴신청" ${bb} onclick="location='chgState?state=1&id=${map.id}'">
				<input type="button" value="탈퇴완료" ${cc} onclick="location='chgState?state=2&id=${map.id}'">
			</td>
		</tr>
	</c:forEach>
</table>
</section>
</body>
</html>