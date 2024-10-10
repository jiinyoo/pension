<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function srcview()
	{
		
		document.getElementById("src").innerText=document.getElementsByTagName("body")[0].innerHTML;
	}
	function chuga()
	{
		//id="aa"인 요소에 "<b> 오늘은 월요일 </b>" 를 추가
		//innerHTML이용
		//document.getElementById("aa").innerHTML="<b> 오늘은 월요일 </b>";
		//createElement를 이용
		var new1=document.createElement("b"); //원하는 태그를 생성
		//생성된 태그에 innerText 텍스트 넣기
		//new1.innerText="오늘은 월요일";
		//createTextNode를 이용하여  텍스트 넣기
		new1.appendChild(document.createTextNode("즐거운 월요일"))
		document.getElementById("aa").appendChild(new1);
	}

	function chuga2()
	{
		//input 태그 만들기
		var new1=document.createElement("input");
		//속성 추가
		new1.setAttribute("type","text");
		new1.setAttribute("value","홍길동");
		new1.setAttribute("name", "name");
		//id="aa인 요소에 태그를 추가"
		document.getElementById("aa").appendChild(new1);
		
		var new2=document.createElement("img");
		new2.setAttribute("src","../resources/imgs/logo.jpg");
		new2.setAttribute("width","100");
		new2.setAttribute("height","100");
		//appendChild는 뒤에 추가된다.
		document.getElementById("aa").appendChild(new2);
	}

</script>
<body><!-- adminRoom/chuga1.jsp -->
	<input type="button" onclick="srcview()" value="소스 보기">
	<input type="button" onclick="chuga()" value="태그 추가">
	<input type="button" onclick="chuga2()" value="속성을 가진태그 추가">
	<div id="aa"></div>
	
	<hr style="border-color:red">
	<div id="src"></div>
</body>
</html>