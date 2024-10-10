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

section div{
	width:600px;
	height:40px;
	line-height:40px;
	text-align:center;
	margin:auto;
	
}



section #con{
	height:200px;
	overflow:auto;
}


#writeday{

	text-align:left;
	font-size:11px;

}

#title{
	
	text-align:center;
	font-size:20px;
	background:black;
	color:white;
	width:600px;
	height:50px;
}
#info {
    display: flex;
    justify-content: space-between;
    width: 600px;
    margin: auto;
}


#content{
	overflow:auto;
	height:270px;

}

#buttons{
 	margin-top:20px;
 	
}

input[type="button"]
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
<div id="writeday">작성일 : ${tdto.writeday}</div>
<hr style="width:600px;">
<div id="title">${tdto.title}</div>
<div id="info">
    <span>작성자 : ${tdto.userid}</span>
    <span>조회수 ${tdto.readnum}</span>
</div>
<div id="content">


<c:forEach items="${tdto.timgs}" var="timg">
<c:if test="${timg!=''}">
	<img src="../resources/tour/${timg}" width="200">
</c:if>
</c:forEach>

<p>
	${tdto.content}

</div>


<div id="buttons">
		<span id="btn"><a href="list"><input type="button" value="목록"></a></span>
		<c:if test="${userid==tdto.userid}">
	 	<span id="btn"><a href="update?id=${tdto.id}"><input type="button" value="수정"></a></span>
	 	<span id="btn"><a href="delete?id=${tdto.id}"><input type="button" value="삭제"></a></span>
		</c:if>
		<c:if test="${userid=='admin'}">
		<span id="btn"><a href="delete?id=${tdto.id}"><input type="button" value="삭제"></a></span>
		</c:if>

</div>


</section>
</body>
</html>