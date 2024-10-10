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
	  <form method="post" action="writeOk">
		<h3>회원게시판 글쓰기</h3>
		<div><input type="text" name="title" placeholder="제 목" style="font-family:'Pretendard-Regular'"></div>
		<div><textarea name="content" placeholder="내용" style="font-family:'Pretendard-Regular'"></textarea></div>
		<div><input type="submit" value="글 등록"> </div>
	  </form>
	</section>

</body>
</html>