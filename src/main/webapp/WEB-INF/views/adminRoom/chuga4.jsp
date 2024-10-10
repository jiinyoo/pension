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
		//var inner=document.getElementById("one").cloneNode(true);
		//document.getElementById("outer").appendChild(inner);
		var len=document.getElementsByClassName("file").length;
		
		var one=document.getElementById("one");
		var inner=one.cloneNode(true);
		outer.appendChild(inner);
		
		//추가된 class="file"의 name을 지정
		//document.getElementsByClassName("file")[len].setAttribute("name","fname"+len);
		document.getElementsByClassName("file")[len].name="fname"+len;
		document.getElementsByClassName("file")[len].value="";
	}
	
	
	function del()
	{
		var len=document.getElementsByClassName("file").length;
		document.getElementsByClassName("one")[len-1].remove();
		
	}
</script>
</head>
<body>

<input type="button" value="소스보기" onclick="srcview()">
<input type="button" value="추가" onclick="add()">
<input type="button" value="삭제" onclick="del()">
<hr style="border-color:red">
  <div id="outer">
	<p class="one" id="one"><input type="file" name="fname0" class="file"></p>
  </div>

<hr style="border-color:red">
<div id="src"></div>

</body>
</html>