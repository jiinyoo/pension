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

section #image{
	width:1000px;
	height:300px;
	margin:auto;
	background:red;
	overflow: hidden;
}

#backimage{
	width:1000px;
	margin:auto;

}

section #community{
	width:1000px;
	height:300px;
	margin:auto;
	display: flex;
    justify-content: center; /* 수평 중앙 정렬 */
   /* 수직 중앙 정렬 */

	
}


.tapmenu
{
	display:inline-block;
	width:260px;
	height:240px;
	margin:auto;
	margin-top:20px;
	margin-left:20px;
	border:2px solid #d2eaf8;
	border-radius:20px;

}


</style>
</head>
<body>
	<script>
	
	
	</script>
	<section>
		<div id="image"><img src="../resources/imgs/pension3.jpg" id="backimage"></div>
		<div id="community">
			<div class="tapmenu">
			<table align="center" width="200px">
			<caption><h1>공지사항</h1></caption>
			 
				<c:forEach items="${glist}" var="gdto">
				<tr>
					<td>관리자</td> <td><a href="../gongji/readnum?id=${gdto.id}">${gdto.title}</a></td>	
				<tr>							
				</c:forEach>
			
			</table>
			</div>
			
			
			<div class="tapmenu">
			<table align="center" width="200px">
			<caption><h1>여행후기</h1></caption>
				<c:forEach items="${tlist}" var="tdto">
				<tr>
					<td>${tdto.userid}</td><td><a href="../tour/readnum?id=${tdto.id}">${tdto.title}</a></td>
				</tr>								
				</c:forEach>
			</table>
			 </div>
			 
			 
			<div class="tapmenu">
			<table align="center" width="200px">
			<caption><h1>게시판</h1></caption>
				<c:forEach items="${blist}" var="bdto">
				<tr>
					<td>${bdto.userid}</td><td><a href="../board/readnum?id=${bdto.id}">${bdto.title}</a></td>
				</tr>								
				</c:forEach>
			</table>
			
			</div>
		</div>
	</section>
	

</body>
</html>