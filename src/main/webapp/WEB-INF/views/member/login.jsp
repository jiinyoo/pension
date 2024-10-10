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
	text-align:center;

}


section div{

	margin-top:10px;
	text-align:center;
}


section div input{

	border:1px solid #2088c5;
	background:white;
	outline:center;
}

section #txt{
	width:400px;
	height:40px;
}



section #sub{
	border:1px solid #d2eaf8;
	width:408px;
	height:44px;
	background:#d2eaf8;
	color:black;
	font-family:'Pretendard-Regular',"Noto Sans KR","Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	font-weight: bold;
	
}

</style>
<script>
	function check(my)
	{
		if(my.userid.value.trim().length==0)
			{
				alert("아이디를 입력하세요");
				return false;
			}
		else if(my.pwd.value.trim().length==0)
			{
				alert("비밀번호를 입력하세요");
				return false;
			}
		else{
			    return true;
			}
		
	}


	function useridSearch()
	{
		son=open("usForm","","width=400,height=300");
		son.moveTo(700,300);
	}
	
	function pwdSearch()
	{
		son=open("pwdForm","","width=400,height=400");
		son.moveTo(700,300);
	}
	
	//open("새창에 띄울문서", "target명","가로크기", "세로크기")
	
	

</script>
</head>
<body>
	<section>
	  <form method="post" action="loginOk" onsubmit="return check(this)">
	  <c:if test="${year!=null}">
	  	<input type="hidden" name="year" value="${year}">
	  	<input type="hidden" name="month" value="${month}">
	  	<input type="hidden" name="day" value="${day}">
	  	<input type="hidden" name="id" value="${id}">
	  </c:if>
		<h3>로 그 인</h3>
		<div><input type="text" name="userid"  placeholder="아 이 디" id="txt"></div>
		<div><input type="password" name="pwd"  placeholder="비밀번호" id="txt"></div>
		<div><input type="submit" value="로그인" id="sub"></div>
	    <c:if test="${err==1}">
	  	  <div style="font-size:12px; color:red"> 아이디 비밀번호가 일치하지 않습니다.</div>
	    </c:if>
	  </form>
	  <div>
	  	<span id="btn" onclick="useridSearch()">아이디 찾기 | </span>
	    <span id="btn" onclick="pwdSearch()">비밀번호 찾기</span>
	  </div>
	</section>

</body>
</html>