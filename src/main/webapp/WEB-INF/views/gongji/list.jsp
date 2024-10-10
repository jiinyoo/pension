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


table {
    width: 800px;
    margin: auto;
    border-spacing:0px;
   /*  border-collapse: collapse; */ /* Ensure borders do not double up */
}

table tr {
    border: 1px solid black;
    height:36px;
}

section table tr td{
	border-bottom:1px solid black;

}

 section table tr:first-child td {
     border-top:2px solid black;
     border-bottom:2px solid black;
     border-left:none;
     border-right:none;
   }
 section table tr:last-child td {
     border-bottom:2px solid black;
   }


section #s2{
	background:#d2eaf8;
	padding:3px;
	font-size:11px;
}

section #s1 {
	background:#d2eaf8;
	padding:3px;
	font-size:11px;
}

section input[type=button]
{
	width:50px;
	height:36px;
	background:#d2eaf8;
	border:1px solid #d2eaf8;
	border-radius:15px;
	outline:none;
	padding:5px;
	margin-bottom:10px;
	margin-top:10px;
} 


</style>
</head>



<body>


<section>
	<table width="800" align="center" id="gongitable">
	<caption><h3>공지사항</h3></caption>
		<tr align="center">
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		
		<c:forEach items="${glist}" var="gdto">
		<tr align="center">
		<td>
		<c:if test="${gdto.state==2}">
			<span id="s2">필독</span>		
		</c:if>
		<c:if test="${gdto.state==1}">
			<span id="s1">공지</span>	
		</c:if>
			
			<a href="readnum?id=${gdto.id}">${gdto.title}</a> </td>
			<td> 관리자 </td>
       		<td> ${gdto.readnum} </td>
       		<td> ${gdto.writeday} </td>
		</tr>
		</c:forEach>
		<c:if test="${userid=='admin'}"><!-- 관리자 아이디인 경우에만 나오게 -->
		<tr>
	       <td colspan="4" align="right"> <a href="write"><input type="button" value="글쓰기"> </a> </td>
	    </tr>
	    </c:if>
	</table>
</section>
</body>
</html>