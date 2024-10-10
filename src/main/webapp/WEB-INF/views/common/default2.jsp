<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
   body {
      margin:0px;
      font-family: 'Pretendard-Regular';
   }
  
   header {
      width:1000px;
      height:150px;
      line-height:60px;
      margin:auto;
      font-family: 'Pretendard-Regular';
    
   }
   header a {
      text-decoration:none;
      color:black;
   }
   header a:hover {
      text-decoration:none;
      color:black;
      
   }
   
   header #first{
   	height:150px;
	
   }
   header #left {
      width:200px;
      height:150px;
      display:inline-block;
      text-align:center;
   }
   header #right {
      width:790px;
      height:150px;
      display:inline-block;
      text-align:right;
   }
  
   section {
      font-family: 'Pretendard-Regular';
   }
 
 </style>
 
 <decorator:head/>
</head>
<body> 
  
   <header>
   <div id="first">
       <div id="left"> <a href="../adminRoom/index"> <img src="../resources/imgs/logo.jpg" width="70%" valign="middle"> </a> </div>
       <div id="right"> 
         <c:if test="${userid=='admin'}">
         	<a href="../tour/list">여행후기</a> |
         	<a href="../board/list">게시판</a> |
            <a href="../gongji/list">공지사항</a> |     
           <a href="../adminRoom/list"> 객실관리 </a> |
           <a href="../adminRoom/reserveList">예약관리</a> |
           <a href="../adminRoom/memberList">회원관리</a> |
           <a href="../adminRoom/inquiryList"> 문의관리 </a> |           
           ${name}님 </span> |
           <a href="../member/logout"> 로그아웃 </a> | 
         </c:if>  
       </div>
    </div> 
   </header>
   

   <decorator:body/>
  
  
</body>
</html>

