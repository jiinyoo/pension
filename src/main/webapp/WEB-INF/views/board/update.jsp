<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 	section {
 	  width:1000px;
      height:600px;
      margin:auto;
      text-align:center;
 	
 	}
	
	
	section input[type=text]
	{
		width:400px;
		height:33px;
		border:1px solid black; 
		outline:none;
	} 
	
	section textarea
	{
	
		width:400px;
		height:200px;
		border:1px solid black;
		outline: none;'
	}
	
	section input[type=submit]
	{
		width:60px;
		height:30px;
		border:1px solid #d2eaf8;
		border-radius:7px;
		outline:none;
		background:#d2eaf8;
		color:black;
	
	}

	
	section div {
     margin-top:8px;
   }
	


</style>
<title>Insert title here</title>
</head>
<body>
	<section>
	  <form method="post" action="updateOk">
	  <input type="hidden" name="id" value="${bdto.id}">
	  
	  <input type="hidden" name="name" value="${bdto.name}">
	  <input type="hidden" name="userid" value="${bdto.userid}">
		<h3>회원게시판 수정</h3>
		<div>작성자 아이디 : ${bdto.userid} | 이름 : ${bdto.name}</div>
		<div><input type="text" name="title" value="${bdto.title}" placeholder="제 목" style="font-family:'Pretendard-Regular'"></div>
		<div><textarea name="content" placeholder="내용" style="font-family:'Pretendard-Regular'">${bdto.content}</textarea></div>
		<div><input type="submit" value="글 수정"> </div>
	  </form>
	</section>

</body>
</html>