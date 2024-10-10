<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
section table input[type=submit] {
      width:70px;
      height:28px;
      background:#d2eaf8;
      color:black;
      border:1px solid #d2eaf8;
      border-radius:7px;
	
}

#update {
      width:70px;
      height:28px;
      background:black;
      color:white;
      border:1px solid black;
      border-radius:7px;
	
}


#answer {
	width:740px;
    border-radius: 0; /* Ensures sharp corners */
    border:1px solid black;
}


#background
{
	background:#e9eeef;
	
}



</style>

<title>Insert title here</title>





</head>
<body>
	<section>
		<c:forEach items="${ilist}" var="idto">
		<form method="post" action="inquiryOk">
		<input type="hidden" name="id" value="${idto.id}">
		    	<table width="1000" align="center">
		    		<tr>	
		    		  <td rowspan="2" width="140"><span style="color:#1bbdcd;">Q.</span>${idto.title2}</td>
		    		  <td id="background"><div id="inTxt">${idto.content}</div></td>
		    		  <td rowspan="2" width="100">${idto.writeday}
		    		  
		    		   
		     			<c:if test="${idto.state==0}">
		    		  	<input type="submit" value="답글달기">
		    		  	</c:if>
		    		  	
		    		  	<c:if test="${idto.state==1}">
		    		  	<input type="submit" value="답변수정" id="update">
		    		  	</c:if>
		    		  	
		    		  </td>
		    		</tr>
		    		<tr>
		    			<td colspan="3"><textarea name="answer" id="answer" placeholder="답변대기중">${idto.answer}</textarea></td>
		    		</tr>
		    	</table>
		 </form>
		</c:forEach>
	
	</section>

</body>
</html>