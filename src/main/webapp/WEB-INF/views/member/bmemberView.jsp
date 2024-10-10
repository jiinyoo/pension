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

input[type="submit"]
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
<form method="post" action="bmemberOk">
	<table align="center"  width="370" id="memberViewtable">
	<caption><h3>비밀번호 재확인</h3></caption>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr style="text-align:center;font-size:12px;">
			<td colspan="2">계정 비밀번호를 입력하세요.</td> 
			<td></td>
		</tr>
		<tr style="text-align:center;">
			<td colspan="2"><input type="password" name="pwd"></td> 
		</tr>
		<tr style="text-align:center;">
			<td colspan="2">
			<c:if test="${err==1}">
				<span style="color:red; font-size:10px;">
				  비밀번호가 틀립니다.
				</span>
			</c:if>
			
			</td> 
		</tr>
		<tr style="text-align:center;">
			<td colspan="2"><input type="submit" value="확인"></td>
		</tr>
	</table>
</form>
</section>
</body>
</html>