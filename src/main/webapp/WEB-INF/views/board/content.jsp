<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section
	{
	
	  width:1000px;
      height:600px;
      margin:auto;
      text-align:center;
	}
	
	section table {
	
		width:500px;
		height:500px;
		margin:auto;
		border-spacing:0px;
		
	}
	
	section table tr td
	{
		border-spacing:0px;
		border-top:1px solid black;
	
	}
	
	section table tr:first-child td
	{
		
	
	}
	
	
	#title
	{
		background:black;		
		color:white;
	}
	
	
	#content
	{
		height:300px;
		overflow:auto;
	
	}
	
	section input[type=button]
	{
		width:60px;
		height:30px;
		border:1px solid #d2eaf8;
		border-radius:7px;
		outline:none;
		background:#d2eaf8;
		color:black;
	}



</style>
</head>
<body>
<section>
	<h3>회원게시판 내용</h3>
	<table align="center">
		<tr>
			<td>작성자</td>
			<td>${writer}</td>
		</tr>
		<tr id="title">
			<td>제 목</td> 
			<td> ${bdto.title}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${bdto.readnum}<td>
		</tr>
		<tr id="content">
			
			<td colspan="2">${bdto.content}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="list"><input type="button" value="목록"></a>
				
				<c:if test="${(userid==bdto.userid)&&(userid!='admin')}">
					<a href="update?id=${bdto.id}"><input type="button" value="수정"></a>
					<a href="delete?id=${bdto.id}"><input type="button" value="삭제"></a>
				</c:if>
				<c:if test="${userid=='admin'}">
		<span id="btn"><a href="delete?id=${bdto.id}"><input type="button" value="삭제"></a></span>
		</c:if>
			</td>
		</tr>
	</table>
</section>




</body>
</html>