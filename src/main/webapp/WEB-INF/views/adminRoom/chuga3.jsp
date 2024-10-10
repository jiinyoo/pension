<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function srcview()
	{
		
		document.getElementById("src").innerText=document.getElementsByTagName("body")[0].innerHTML;
	}
	
	
	
	function add()
	{
		
		
		var len=document.getElementsByClassName("file").length;
		
		var new1=document.createElement("input");
		new1.setAttribute("type","file");
		new1.setAttribute("name","fname"+len);
		new1.setAttribute("class","file");
		document.getElementById("aa").appendChild(new1);
		
	}
	
	
	function del()
	{
		//클래스 파일의 길이를 가져온다.
		//class="file"의 길이
		var len=document.getElementsByClassName("file").length;
		
		document.getElementsByClassName("file")[len-1].remove();
		
	}
	
</script>
</head>
<body>


<input type="button" value="소스보기" onclick="srcview()">
<input type="button" value="추가" onclick="add()">
<input type="button" value="삭제" onclick="del()">
<hr style="border-color:red">
<div id="aa"><input type="file" name="fname0" class="file"></div>

<hr style="border-color:red">
<div id="src"></div>
</body>
</html>