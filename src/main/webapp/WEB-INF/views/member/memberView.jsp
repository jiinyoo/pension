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

#memberViewtable{

	border-spacing:0px;
	font-size:14px;
	
}
#memberViewtable tr:first-child td{
	
	border-top:2px solid black;
}
#memberViewtable tr:last-child td{
	
	border-top:1px solid gray;
	border-bottom:1px solid gray;
	height:30px;
}
#memberViewtable td{
	
	height:30px;
}

section #emailTwo
{
	display:none;
}

#pwdeditdiv
{
	top:10px;
	width:250px;
	display:none;
	margin:auto;
	text-align:center;
	border:1px solid black;
  	<c:if test="${err==null}">
     display:none;
    </c:if>
    <c:if test="${err==1}">
     display:block;
    </c:if>
    margin-top: 10px;
}


#emailOne input[type="button"]
{

	border:1px solid #d2eaf8;
	width:60px;
	height:25px;
	border-radius:7px;
	background:#d2eaf8;
	color:black;

}



#emailTwo input[type="submit"]
{
	border:1px solid #d2eaf8;
	width:60px;
	height:25px;
	border-radius:7px;
	background:#d2eaf8;
	color:black;

}

#emailTwo input[type="button"]
{

	border:1px solid #d2eaf8;
	width:60px;
	height:25px;
	border-radius:7px;
	background:#d2eaf8;
	color:black;

}

#phoneEdit input[type="submit"]
{

	border:1px solid #d2eaf8;
	width:60px;
	height:25px;
	border-radius:7px;
	background:#d2eaf8;
	color:black;

}

#pwdchg
{
	border:1px solid #d2eaf8;
	width:90px;
	height:25px;
	border-radius:7px;
	background:#d2eaf8;
	color:black;
	font-family:'Pretendard-Regular',"Noto Sans KR","Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
	color:black;


}

</style>
<script>
	function viewForm()
	{
		document.getElementById("emailOne").style.display="none";
		document.getElementById("emailTwo").style.display="block";
	}
	
	function cancelForm()
	{
		document.getElementById("emailOne").style.display="block";
		document.getElementById("emailTwo").style.display="none";
	}

/*	function pwdView()
	{
		document.getElementById("pwdeditdiv").style.display="block";	
		
	}
*/

	function pwdView()
	{
		son=open("pwdeditform","","width=400,height=500");
		son.moveTo(1200,300);
	}
	
	
	


</script>
</head>
<body>
<section>
	<table align="center"  width="370" id="memberViewtable">
	<caption><h3>회원님의 정보</h3></caption>
		<tr>
			<td>아이디</td>
			<td>${mdto.userid}</td>
		</tr>
		<tr>
			<td>이름</td> 
			<td>${mdto.name} </td>
		</tr>
		<tr>
			<td>이메일</td> 
			<td>
				<div id="emailOne">${mdto.email}   <input type="button" value="수정" onclick="viewForm()"></div>
				<div id="emailTwo">
					<form method="post" action="emailEdit">
						<input type="text" name="email" value="${mdto.email}">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="cancelForm()">
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td>전화번호</td> 
			<td>
			<form method="post" action="phoneEdit" id="phoneEdit">
				<input type="text" name="phone" value="${mdto.phone}">
				<input type="submit" value="수정">
			</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;cursor:pointer;" onclick="pwdView()"><input type="button" value="비밀번호 변경" id="pwdchg"></td>
		</tr>
	</table>
	
	
	
	
	
	
	
	
	<div id="pwdeditdiv">
		<form method="post" action="pwdEdit">
			<h3>비밀번호 변경</h3>
			<input type="password" placeholder="현재 비밀번호" name="pwd"><p>
			<input type="password" placeholder="새 비밀번호" name="newpwd1"><p>
			<input type="password" placeholder="새 비밀번호 확인" name="newpwd2"><p>
			<input type="submit" value="수정">
		</form>
		<c:if test="${err==1}">
			<div style="color:red;font-size:11px">기존비밀번호가 틀립니다.</div>
		</c:if>
	</div>
	

</section>
</body>
</html>