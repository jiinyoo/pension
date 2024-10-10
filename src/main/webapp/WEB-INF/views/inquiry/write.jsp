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
	text-align:center;
	margin-top:10px;
}


section select
{
	width:400px;
	height:30px;
	outline:none;
}


#submit
{
	width:404px;
	height:34px;
	background:black;
	color:white;
	border:none;
}

section textarea
{
	width:400px;
	height:200px;
	outline:none;
}



#nonmember
{
	width:404px;
	height:34px;
	background:#d2eaf8;
	color:black;
	border:none;

}
</style>
<script>
		function vform()
		{
			
			document.getElementById("vform").style.display="block";
		}


</script>

</head>
<body><!-- inquriy/write.jsp -->
	<section>
	
	<div>
	
	<form method="post" action="writeOk">
		<h3 align="center">관리자에게 문의하기</h3>
		<div>
			<select name="title">
				<option value="0">펜션 예약 관련 문의</option>
				<option value="1">입실 퇴실 관련 문의</option>
				<option value="2">주변 맛집 관련 문의</option>
				<option value="3">웹사이트 관련 문의</option>
				<option value="4">커뮤니티 관한 문의</option>			
			</select>
		</div>
		<div><textarea name="content" maxlength="200"></textarea></div>
		<div><input type="submit" id="submit" value="문의 등록"></div>
	</div>
	</form>
	
	<div text-align:center;>
	<c:if test="${userid==null}">	
	<span onclick="vform()">
		<input type="button" value="비회원 문의 확인하기" id="nonmember"></span>
		<c:if test="${err==1}">
			<div style="font-size:11px;">문의 번호가 일치하지 않습니다.</div>
		</c:if>
		
		
		<div style="display:none;" id="vform">
			<form method="post" action="nonMemberView">
				<input type="text" name="inqNumber">
				<input type="submit"  value="문의확인">
			</form>
		</div>
	</c:if>
	</div>
	</section>
</body>
</html>