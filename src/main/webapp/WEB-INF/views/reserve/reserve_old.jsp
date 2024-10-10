<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

section{
	width:1000px;
	margin:auto;
}


section table {
	margin-top:30px;
	border-spacing:0px;
	margin-bottom:30px;
}



section table td{
	width:130px;
	height:200px;
}

section table tr:first-child td{
	height:28px;
	text-align:center;

}

#head
{

	font-size:35px;

}

@font-face {
    font-family: 'KimjungchulMyungjo-Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulMyungjo-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}




</style>
</head>
<body>
<section>
	<table width="900" align="center" border="1px solid grey">
	<caption>
				<a href="reserve?year=${year}&month=${month-1}"><span class="material-symbols-outlined">
		arrow_back_ios
		</span></a>
					&nbsp;&nbsp;<span id="head">${year}년 ${month}월</span>&nbsp;&nbsp;
				<a href="reserve?year=${year}&month=${month+1}"><span class="material-symbols-outlined">
		arrow_forward_ios
		</span></a>
	</caption>
		<tr style="background:#d2eaf8 ">
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	    <c:set var="day" value="1"/> <!-- pageContext -->
     	<c:forEach begin="1" end="${ju}" var="i">
      	<tr> <!-- ${i} -->
	        <c:forEach begin="0" end="6" var="j">
		         <c:if test="${ (i==1 && j<yoil) || day>chong }">
		          <td> </td>
		         </c:if>
		         <c:if test="${ !((i==1 && j<yoil) || day>chong) }">
			          <td valign="top"> ${day} 
			          <c:set var="date" value="${year}-${month}-${day}"/>
			          <%
			          	String date=(String)pageContext.getAttribute("date");
			          //c:set var의 date값을 받아오기 위한 방법
			           if(Utils.dayBefore(date)) //년월일 메소드에 넘겨서 오늘이전인지 아닌지 Utils.dayBefore(date)
			           {  
			          %>
			          	<c:forEach items="${rlist}" var="rdto">
			          	<c:set var="rid" value="${rdto.id}"/>
			          	
			          	<%@page import ="kr.co.pension.util.Utils" %>
			          	<%
			          	
			          		//객체 영역의 값을 스크립트릿에서 사용할 수 있게 변형
			          		int rid=Integer.parseInt(pageContext.getAttribute("rid").toString());
			          		//년,월,일 rdto.rid =>예약 여부를 체크한다.
			          		//함수를 호출해야하기 때문에 스크립트릿을 씀 
			          		if(Utils.isCheck(date,rid))
			          		{
			          	%>		
			          			<div align="right" style="color:red;">${rdto.title}</div>
			          	<% 		
			          		}else{
			          	%>	
			          			
			          		<div align="right"><a href="reserveNext?year=${year}&month=${month}&day=${day}&id=${rdto.id}">${rdto.title}</a></div>
			          			
			          	<%		
			          		}
			          	%>
			          	</c:forEach>
			          	
			          	<% } %>
			          </td>
		          <c:set var="day" value="${day+1}"/> 
		         </c:if> 
		        </c:forEach>
      </tr> 
     </c:forEach>
	</table>	
</section>
</body>
</html>