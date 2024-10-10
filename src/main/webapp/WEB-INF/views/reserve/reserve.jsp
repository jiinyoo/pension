<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
	    <c:set var="day" value="1"/> <!-- day라는 변수를 1으로 설정한다. -->
     	<c:forEach begin="1" end="${ju}" var="i"><!-- ju를 출력하기 위한 c:forEach문 시작 -->
      	<tr> <!-- ${i} --><!-- tr로 한 칸 띄워주고 -->
	        <c:forEach begin="0" end="6" var="j"><!-- 요일을 출력하기 위한 c:forEach문 시작 -->
		         <c:if test="${ (i==1 && j<yoil) || day>chong }"><!-- 만약에 첫주이고 요일보다 작거나 day가 chong보다 크면(day는 모든 달력에서 다 생성 -->
		          <td> </td>
		         </c:if>
		         <c:if test="${ !((i==1 && j<yoil) || day>chong) }">
			          <td valign="top"> ${day} 
			        	<%-- ${map.get("6-1")} --%>
			        
			        
			        	<!-- 달력에 출력되는 날짜객체 생성 -->
			        	<c:set var="xday" value="${year}-${month}-${day}"/>
			        	<!-- 현재 문자열이므로 xday를 파싱함 -->
			        	<!--  fmt:formatDate 태그는 Date 객체를 특정 형식의 문자열로 포맷팅-->
			        	<!--  fmt:parseDate 태그는 문자열을 특정 형식으로 해석하여 Date 객체로 변환합니다.-->
			        	<fmt:parseDate value="${xday}" var="day1" pattern="yyyy-MM-dd"/>
			        	
			        	<!-- 오늘 날짜 객체 -->
			        	<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
			        	<fmt:parseDate value="${today}" pattern="yyyy-MM-dd" var="day2"/>
			        	
			        	
			        	
			        	
			        	<c:if test="${day1>=day2}"><!-- 오늘 이전이면 객실목록 출력 안하기 -->
			        
			        
			          	<c:forEach items="${rlist}" var="rdto"><!-- 객실명 출력 시작 -->
				          	<c:set var="key" value="${day}-${rdto.id}"/><!-- 키를 생성 -->
				          	<c:if test="${map.get(key)==0}"><!-- 예약이 되지 않은 객실 -->
				          		<div align="right"><a href="reserveNext?year=${year}&month=${month}&day=${day}&id=${rdto.id}">${rdto.title}</a></div>
				          	</c:if>
				          	<c:if test="${map.get(key)==1}"><!-- 예약이 된 객실 -->
				          		<div align="right" style="color:red;">${rdto.title}</div>
				          	</c:if>
				          	</c:forEach>
							
						</c:if>				          	
			        
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