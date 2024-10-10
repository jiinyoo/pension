<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
    <table width="900" align="center">
      <caption> <h3> 예약 현황 </h3> </caption>
      <tr>
        <td> 예약자 </td>
        <td> 입실일 </td>
        <td> 퇴실일 </td>
        <td> bbq </td>
        <td> 숯불 </td>
        <td> 결제금액 </td>
        <td> 예약일 </td>
        <td> 상태 </td>
      </tr>
     <c:forEach items="${rlist}" var="rdto">
      <tr>
        <td> ${rdto.userid} </td>
        <td> ${rdto.inday} </td>
        <td> ${rdto.outday} </td>
        <td> ${rdto.bbq} </td>
        <td> ${rdto.chacol} </td>
        <td><fmt:formatNumber value="${rdto.chgprice}" pattern="#,###"/> 원 </td>
        <td> ${rdto.writeday} </td>
        <td> 
        	<c:if test="${rdto.state==0}">
        		예약완료
        	</c:if>
        	<c:if test="${rdto.state==1}">
        		<input type="button" onclick="location='cancelRe?id=${rdto.id}&state=2'" value="취소신청중">
        	</c:if>
        	<c:if test="${rdto.state==2}">
        		취소완료
        	</c:if>
        
        </td>
      </tr>
     </c:forEach>
    </table>
  </section>
</body>
</html>