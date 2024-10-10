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
section{
	  width:1000px;
      height:600px;
      margin:auto;
}

section div{
	width:500px;
	height:40px;
	line-height:40px;
	text-align:center;
	margin:auto;
	border:1px solid black;
}

#imgs
{

	height:150px;


}

section #con{

	height:200px;
	overflow:auto;
	

}


#imgs {
    height: 180px;
    overflow-x: auto; /* 수평 스크롤 생성 */
    white-space: nowrap; /* 이미지가 한 줄에 표시되도록 설정 */
}

#imgs img {
    display: inline-block; /* 이미지를 인라인 블록 요소로 설정 */
}

input[type="button"]
{
		width:60px;
		height:30px;
		border:1px solid #d2eaf8;
		border-radius:7px;
		outline:none;
		background:#d2eaf8;
		color:black;

}




</style>
</head>
<body>
<section>
	<h3 style="text-align:center;">${rdto.title}객실 내용</h3>
	<div>최소 : ${rdto.min} 명, 최대 : ${rdto.max} 명</div>
	<div>${rdto.price2} 원</div>
	<%-- <div>1박 가격 <fmt:formatNumber value="${rdto.price}" type="number" pattern="#,###"/> 원</div> --%>
	<div id="imgs">
	<c:forEach items="${rdto.imgs}" var="img">
		<img src="../resources/room/${img}"  height="150"  valign="middle">
		<!-- 뷰즈 안에 있을 때는 그냥 resources 아니면 ..필요 -->
	</c:forEach>
	</div>
<%-- 	<c:forEach items="${imgs}" var="img">
		<img src="../resources/room/${img}"  width="60" height="30" valign="middle">
		<!-- 뷰즈 안에 있을 때는 그냥 resources 아니면 ..필요 -->
	</c:forEach>
	 --%>
	<div id="con">${rdto.content}</div>
	<div>
	 	<span id="btn"><a href="list"><input type="button" value="목록"></a></span>
	 	<span id="btn"><a href="update?id=${rdto.id}"><input type="button" value="수정"></a></span>
	 	<span id="btn"><a href="delete?id=${rdto.id}"><input type="button" value="삭제"></a></span>
	 </div>
</section>
</body>
</html>