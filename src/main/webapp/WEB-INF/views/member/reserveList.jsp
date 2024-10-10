<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
  </style>
</head>
<body>
  <section>
    <table width="900" align="center">
      <caption> <h3> ${name}님의 예약 현황 </h3> </caption>
      <tr align="center">
        <td> 입실일 </td>
        <td> 퇴실일 </td>
        <td> bbq </td>
        <td> 숯불 </td>
        <td> 결제금액 </td>
        <td> 예약일 </td>
        <td>상태</td>
      </tr>
     <c:forEach items="${rlist}" var="rdto">
     <c:if test="${rdto.chk==true}">
     	<tr align="center">
     </c:if>
      <c:if test="${rdto.chk==false}">
	  <tr align="center" style="background:#eeeeee">
     </c:if>
        <td> ${rdto.inday} </td>
        <td> ${rdto.outday} </td>
        <td> ${rdto.bbq} </td>
        <td> ${rdto.chacol} </td>
        <td> <fmt:formatNumber value="${rdto.chgprice}" pattern="#,###"/>원  </td>
        <td> ${rdto.writeday} 
        	<fmt:formatDate value="<%=new java.util.Date()%>" var="today" pattern="yyyy-MM-dd"/>
        	<fmt:parseDate  value="${rdto.outday}" var="xday" pattern="yyyy-MM-dd"/>
        	<fmt:formatDate value="${xday}" var="xday" pattern="yyyy-MM-dd"/>
        <c:if test="${today>=xday}">
        	<td>사용 완료</td>
        	<td>.....</td>
        </c:if>
        <c:if test="${today<xday}">
        	<td>사용 전</td>
        	<!-- 이 문서를 한 번 더 요청할 테니 스테이트값을 한 번 더 요청하겠다. -->
        	<c:if test="${rdto.state==2}">
        		<td>취소완료</td>
        	</c:if>
        	
        	<c:if test="${rdto.state==1}">
        		<td><input type="button" value="취소신청중"></td>
        	</c:if>
        	<c:if test="${rdto.state==0}">
        	<td><input type="button" value="취소신청" onclick="location='cancelRe?id=${rdto.id}&state=1'"></td>
        	</c:if>
        </c:if>
        </td>
        <!-- reserve테이블의 state 0:예약완료 1:취소 신청 2:취소완료 -->
      </tr>
     </c:forEach>
    </table>
  </section>
</body>
</html>