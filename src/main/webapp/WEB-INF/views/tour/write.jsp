<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    font-family: 'Pretendard-Regular';
}

section {
    width: 1000px;
    height: 600px;
    margin: auto;
    text-align: center;
}

section input[type=text] {
    width: 400px;
    height: 33px;
    border: 1px solid black; 
    outline: none;
    font-family: 'Pretendard-Regular'; /* 폰트 패밀리 추가 */
} 

section textarea {
    width: 400px;
    height: 200px;
    border: 1px solid black;
    outline: none;
    font-family: 'Pretendard-Regular'; /* 폰트 패밀리 추가 */
}

section input[type=submit] {
    width: 80px;
    height: 30px;
    border: 1px solid #d2eaf8;
    border-radius: 7px;
    outline: none;
    background: #d2eaf8;
    color: black;
    font-family: 'Pretendard-Regular'; /* 폰트 패밀리 추가 */
}

section input[type=button] {
    width: 80px;
    height: 30px;
    border: 1px solid #d2eaf8;
    border-radius: 7px;
    outline: none;
    background: #d2eaf8;
    color: black;
    font-family: 'Pretendard-Regular'; /* 폰트 패밀리 추가 */
}





section div {
    margin-top: 8px;
}
</style>
<script>
	function srcView()
	{
		
		document.getElementById("src").innerText=document.getElementById("outer2").innerHTML;		
		
	}

	var chk=0;
	function add()
	{
		chk++;
		var len=document.getElementsByClassName("file").length;
		var one=document.getElementById("one"); //p태그
		var inner=one.cloneNode(true);
		
		var outer=document.getElementById("outer2");
		outer.appendChild(inner);
	
		document.getElementsByClassName("file")[len].name="fname"+len;
		document.getElementsByClassName("file")[len].value="";
		
	}
	
	
	function del()
	{
		//class="one"인 요소의 마지막 인덱스를 지운다.
		var len=document.getElementsByClassName("one").length;
		if(len>1)//최소한 1개를 업로드 할 수 있게 하나일 땐느 삭제 안함
		document.getElementsByClassName("one")[len-1].remove();
	}
</script>
</head>
<body>
<!-- 	<span id="src" ></span>
	<input type="button" value="소스보기" onclick="srcView()"> -->
	
<section>
<form method="post" action="writeOk" enctype="multipart/form-data">
	<h3>여행 후기 등록</h3>
	<div><input type="text" name="title" placeholder="제 목"></div>
	<div><textarea name="content" placeholder="후기 내용"></textarea></div>
	<div>
		<input type="button" value="파일 추가" onclick="add()">
		<input type="button" value="파일 삭제" onclick="del()">
	</div>
	<div id="outer2">
		<p id="one" class="one">
			<input type="file" name="fname0" class="file">
		</p>
	</div>
	<div><input type="submit" value="후기 등록"></div>
</form>
</section>
</body>
</html>