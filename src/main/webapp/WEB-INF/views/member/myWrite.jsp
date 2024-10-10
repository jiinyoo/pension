<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  section {
      width:1000px;
      height:600px;
      margin:auto;
   }
   section hr {
      border:2px solid #d2eaf8;
   }
   section h3 {
      border-bottom:1px solid #d2eaf8;
   }
    section #inTxt {
      width:746px;
      overflow:auto;
   }
  </style>
</head>
<body>  <!-- member/myWrite -->
  <section>
    <h3> 게시판 </h3>
    <hr>
    <h3> 여행 후기 </h3>
    <hr>
    <h3> 문의 내용 </h3>
    <c:forEach items="${ilist}" var="idto" varStatus="sts">
    	<table width="1000" align="center">
    		<tr>	
    		  <td rowspan="2" width="140">
    		  <c:if test="${idto.state==1}">
    		  
    		  	<span onmouseover="view(${sts.index})" style="cursor:pointer">${idto.title2}</span><br>
    		  	
    		  	<span style="color:blue;font-size:11px;text-align:center;margin:auto;  align-items: center;justify-content: center;">답변 완료</span>
    		  	
    		  </c:if>
    		  	
    		  <c:if test="${idto.state==0}">
    		  
    		  	<span onclick="view(${sts.index})">${idto.title2}</span><br>
    		  	<span style="color:red;font-size:11px;text-align:center;">답변 대기</span>
    		  </c:if>
    		  	
    		  	
    		  </td>
    		  <td><div id="inTxt"><span onmouseover="view(${sts.index})" style="cursor:pointer">${idto.content}</span></div></td>
    		  <td rowspan="2" width="100">${idto.writeday}</td>
    		</tr>
    		<tr style="display:none" class="tr"> <!-- 답변 tr태그 -->
    			<td colspan="3">${idto.answer}</td>
    		</tr>
    	</table>
    </c:forEach>
    <hr>
  </section>
  <script>
  
  function view(n)
  {
	  var tr=document.getElementsByClassName("tr");
	  // 하나만 보이게 하기
	  for(i=0;i<tr.length;i++)
	  {
		  tr[i].style.display="none";
	  }	  
	  
	  tr[n].style.display="table-row";
  }
  
  
  </script>
  
  
  
  
  
</body>
</html>
    			