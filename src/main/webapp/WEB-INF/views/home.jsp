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
    <fmt:formatNumber value="13456789" type="number"/> 
    <hr>
    <fmt:formatNumber value="13456789" type="number" var="one"/> 
    가격 : ${one}
    <hr>
    <fmt:formatNumber value="13456789" type="number" pattern="#,###"/>
    <hr>
    <fmt:formatNumber value="13456789" type="number" pattern="0,000"/>
    <hr>
    <fmt:formatNumber value="123.53794" pattern="00000.0000"/>
    <hr>
    <fmt:formatNumber value="123.53794" pattern="#####.####"/>
    <hr>
    <fmt:formatNumber value="123.53794" pattern=".########"/>
    <hr>
    <fmt:formatNumber value="123.53794" pattern=".00000000"/>
    <hr>
    <fmt:formatNumber value="0.34" type="percent"/>
    <hr>
    <hr>
    <fmt:formatNumber value="123456789" type="currency"/>
    <hr>
    <fmt:formatNumber value="123456789" type="currency"  currencySymbol="$"/>
    <hr>
    <fmt:formatNumber value="123.53794" type="currency"/>
    <hr>
    
    
  </section>
</body>
</html>