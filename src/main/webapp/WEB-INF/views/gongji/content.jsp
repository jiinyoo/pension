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
	
	section div {
	
		width:500px;
		height:30px;
		line-height:30px;
		border:1px solid black;
		margin:auto;
		
	}
	
	section #content
	{
		height:300px;
		margin:auto;
		margin-top:8px;
		overflow: auto; 
	}
	
	
	section #rnum {
		font-size:11px;
		color:#2088c5;
	}
	
	section #btn {
		border:none;
		margin-top:8px;
	
	}

	section div
	{
		margin-top:8px;
		
	
	}
	
	section input[type="button"]
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
	
	
	#title {
		background:black;
		border:none;
		color:white;
	
	
	}



</style>
</head>
<body>
<section>
	<h3>공지사항 내용</h3>
	<div id="title">제 목 : ${gdto.title}</div>
	<div>${gdto.readnum}<span id="rnum">(조회수)</span></div>
	<div id="content">${gdto.content}</div>
	<div id="btn">
		<a href="list"><input type="button" value="목록"></a>
		
		<c:if test="${userid=='admin'}">
			<a href="update?id=${gdto.id}"><input type="button" value="수정"></a>
			<a href="delete?id=${gdto.id}"><input type="button" value="삭제"></a>
		</c:if>
	</div>
</section>




</body>
</html>