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
	<caption><h3>회원 게시판</h3></caption>
		<tr align="center">
			<td>제목</td>
			<td>작성자 아이디</td>
			<td>작성자 이름</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		
		<c:forEach items="${blist}" var="bdto">
		<tr align="center">
		<td>	
			<%-- <c:if test="${userid!=bdto.userid}"> --%>
				<a href="readnum?id=${bdto.id}">${bdto.title}</a> 
			<%-- </c:if> --%>
			<%-- <c:if test="${userid==bdto.userid}">
				<a href="content?id=${bdto.id}">${bdto.title}</a> 
			</c:if> --%>
		</td>
			<td> ${bdto.userid} </td>
			<td>${bdto.name}</td>	
       		<td> ${bdto.readnum} </td>
       		<td> ${gdto.writeday} </td>
		</tr>
		</c:forEach>
		<c:if test="${userid!=null}">
		<tr>
	       <td colspan="5" align="right"> <a href="write"><input type="button" value="글쓰기"> </a> </td>
	    </tr>
	    </c:if>
	</table>
</section>
</body>
</html>