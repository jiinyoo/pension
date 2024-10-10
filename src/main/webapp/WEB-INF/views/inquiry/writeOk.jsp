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
    width: 1000px;
    height: 600px;
    margin: auto;
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
}

#text {
    text-align: center;
    font-size: 20px;
    margin-top: 100px; /* 상단에서 100px 떨어진 위치 */
}
</style>

</head>
<body>
	<section>
		<div id="text">
			<c:if test="${InqNumber!=''}">문의 번호 <span style="color:red;">${InqNumber}</span>로</c:if> 문의하기가 정상적으로 등록되었습니다.
		</div>
	</section>

</body>
</html>