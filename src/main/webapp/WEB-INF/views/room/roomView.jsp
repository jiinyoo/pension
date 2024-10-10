<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

section div{
	width:600px;
	margin:auto;
	height:40px;

}

section #con{
	height:200px;
	overflow:auto;
}


h3{
	text-align:center;
}


section table{

	border-spacing:0px;
	text-align:center;

}


section table tr td{
	
	border-top:1px solid black;
    
}

</style>

<script>
var imgs=[${imsi}]
var len=imgs.length;
	var n=0;
	function prev(){	
		n--;
		if(n<0)
			n=imgs.length-1;
		document.getElementById("imgview").src="../resources/room/"+imgs[n]
	}
	function next(){
		n++;
		if(n>=imgs.length)
		n=0;
		document.getElementById("imgview").src="../resources/room/"+imgs[n]
}

function move(m)
{
	/* if(m==0)	
		n--;
	else
		n++; */
	n=n+m;
	if(n<0)
		n=imgs.length-1;
	if(n>=imgs.length)
		n=0;
	document.getElementById("imgview").src="../resources/room/"+imgs[n]
	
}
	
</script>
</head>
<body>
<section>
	<table align="center" width="700" height="300" border="1">
		<h3>${rdto.title} 객실 현황</h3>
	<tr>
		<td width="350px">최소인원 : ${rdto.min} 명 | 최대인원 : ${rdto.max}</td>
		<td rowspan="4"><!-- <span id="arrow1" onclick="prev()"> --><span onclick="move(-1)">◀ </span><img src="../resources/room/${rdto.rimg}" width="300px" valign="middle" id="imgview"><!-- <span id="arrow2" onclick="next()"> --><span onclick="move(1)"> ▶</span></td>
	</tr>
	<tr style="background:black; color:white;">
		<td>1박 가격 : ${rdto.price2} 원</td>
	</tr>
	<tr>
		<td>${rdto.content}</td>
	</tr>
	<tr>
		<td>
			<c:forEach items="${rdto.imgs}" var="img">
				<img src="../resources/room/${img}" width="50px">
			</c:forEach>
		</td>
	</tr>
	</table>
</section>
</body>
</html>