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
 	margin:0px;
 	font-family: 'Pretendard-Regular',"Noto Sans KR","Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
}

section{
	  width:1000px;
      height:600px;
      margin:auto;
}

section table{
	border-spacing:0px;
}

section table td
{
	border-bottom:1px solid black;
	padding:5px;
	height:35px;
}

section table tr:first-child td {
	border-top:2px solid black;
}

section table input[type=text]
{
	width:300px;
	height:24px;
	border:1px solid black;
	outline:none;
}


section table select{
	width:304px;
	height:28px;
	border:1px solid black;
	outline:none;
}


section table textarea {
	width:300px;
    height:200px;
    border:1px solid black;
    outline:none;
    overflow:auto;
}

section table input[type=button] {
      width:60px;
      height:28px;
      background:#d2eaf8;
      color:black;
      border:1px solid #d2eaf8;
      border-radius:7px;
	
}

section table input[type=submit] {
      width:75px;
      height:28px;
      border-radius:7px;
      background:#d2eaf8;
      color:black;
      border:1px solid #d2eaf8;
	
}


section table .label {
      display:inline-block;
      font-size:12px;
      width:60px;
      height:24px;
      line-height:24px;
      border:1px solid black;
      color:black;
      background:white;
      text-align:center;
    }


</style>
<script>

function add()
{
	//var inner=document.getElementById("one").cloneNode(true);
	//document.getElementById("outer").appendChild(inner);
	var len=document.getElementsByClassName("file").length;
	
	if (len<10)
	{
		var one=document.getElementById("one");
		var inner=one.cloneNode(true);
		//p태그를 복사했다.
		outer.appendChild(inner);//td태그에 복사한 p태그를 추가
		
		//추가된 class="file"의 name을 지정
		//document.getElementsByClassName("file")[len].setAttribute("name","fname"+len);
		document.getElementsByClassName("file")[len].name="fname"+len; //name을 다르게 주기 위하여 만듦
		document.getElementsByClassName("file")[len].value="";//들어있는 파일이 있다면 걔는 없애주려고
		//새로 추가될 때 값이 추가될 경우
		document.getElementsByClassName("img")[len].innerHTML="";
		
		//class="label"의 for속성을 "fileup"+len으로 
		document.getElementsByClassName("label")[len].setAttribute("for","fileup"+len);
		//class="file"의 id속성도 "fileup"+len
		document.getElementsByClassName("file")[len].id="fileup"+len;
	}
}


function del()
{
	var len=document.getElementsByClassName("file").length;
	if(len>1){
		document.getElementsByClassName("one")[len-1].remove();
	}
	
}

function miniView(my)
{
	
	var n=parseInt(my.name.substring(5));
	for(var image of event.target.files)
	{
		var reader=new FileReader();
		reader.onload=function() //class="img인" 요소에 그림을 넣기
		{
			var new1=document.createElement("img");	
			new1.setAttribute("src",event.target.result);
			new1.setAttribute("width","40");
			new1.setAttribute("valign","middle");
			
			if(document.getElementsByClassName("img")[n].innerHTML!="")
			{
				document.getElementsByClassName("img")[n].innerHTML="";
			}
			document.getElementsByClassName("img")[n].appendChild(new1);
		};
		reader.readAsDataURL(image);
	}
}



</script>
</head>
<body>
<section>
  <form method="post" action="writeOk" enctype="multipart/form-data">
	<table width="600" align="center">
		<caption><h2>객실 등록</h2></caption>
		<tr>
			<td width="100">객실명</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
	         <td> 최소인원 </td>
	         <td>
		         <select name="min">
		         	<option value="1">1명</option>
		         	<option value="2">2명</option>
		         	<option value="3">3명</option>
		         	<option value="4">4명</option>
		         	<option value="5">5명</option>
		         	<option value="6">6명</option>
		         	<option value="7">7명</option>
		         	<option value="8">8명</option>
		         </select>  
	         
	         </td>
       </tr>	
	   <tr>
         <td> 최대인원 </td>
         <td> 
       	     <select name="max">
	         	<option value="1">1명</option>
	         	<option value="2">2명</option>
	         	<option value="3">3명</option>
	         	<option value="4">4명</option>
	         	<option value="5">5명</option>
	         	<option value="6">6명</option>
	         	<option value="7">7명</option>
	         	<option value="8">8명</option>
	         </select>  
         </td>
       </tr>
		<tr>
         <td> 객실가격 </td>
         <td> <input type="text" name="price"> </td>
       </tr>
       <tr>
         <td> 객실요약 </td>
         <td> <textarea name="content"></textarea> </td>
       </tr>
       <tr>
         <td > 객실사진 </td>
         <td>	
         	<input type="button" value="추가" onclick="add()">
         	<input type="button" value="삭제" onclick="del()">
         </td>
       </tr>
       <tr>
       <td></td>
         <td id="outer">
            <p class="one" id="one">
            	<label for="fileup0" class="label">클릭</label>
            	<input id="fileup0" style="width:0px;" type="file" name="fname0" class="file" onchange="miniView(this)">
            	<span class="img"></span>
            </p> 
         </td>
       </tr>
       <tr align="center">
         <td colspan="2"> <input type="submit" value="객실등록">
       </tr>
	</table>
  </form>
  
</section>
<!-- input 아이디와 label 아이디를 연동하면 글씨를 클릭해도 인풋을 클릭하게 됨 -->
<!--  <input id="abc" type="checkbox"><label for="abc">여기를 클릭하세요</label>-->
</body>
</html>