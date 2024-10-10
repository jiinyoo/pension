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
		height:36px;
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
<script>
window.onload=function()
{	
	document.uform.state[${gdto.state}].checked=true;
}



</script>

<title>Insert title here</title>
</head>
<body>
	<section>
	  <form method="post" action="updateOk" name="uform">
		<input type="hidden" name="id" value="${gdto.id}">		
		<h3>공지사항 글쓰기</h3>
		<div><input type="text" value="${gdto.title}" name="title" placeholder="제 목" style="font-family:'Pretendard-Regular'"></div>
		<div><textarea name="content"  placeholder="공지사항 내용" style="font-family:'Pretendard-Regular'">${gdto.content}</textarea></div>
		<div>
			<input type="radio" name="state" value="0">일반공지
			<input type="radio" name="state" value="1">상시공지
			<input type="radio" name="state" value="2">필수공지 
		</div>
		<div><input type="submit" value="수정"> </div>
	  </form>
	</section>

</body>
</html>