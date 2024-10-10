<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

window.onload=function()
{
	document.uform.min.value=${rdto.min};	
	document.uform.max.value=${rdto.max};	
	
	
}



function opacity(my)
{
	   if (my.style.opacity == "" || my.style.opacity == 1) {
		 
	        my.style.opacity = 0.7;
	    } else {
	    	 
	        my.style.opacity = 1;
	    }
}


//기존에 있던 이미지들을 가져옵니다.
//opacity가 0.7인 이미지들을 뺍니다.
//파일들을 다 가져옵니다.
//기존의 것들을 더해줍니다.


function check()
   {
	// 삭제할 이미지
	   var safeimg=""; // 보존할 이미지
/* 	   var len=document.getElementsByClassName("file").length;
	   for(i=0; i<len; i++)
	   {
		  
		        let filePath = document.getElementsByClassName("file")[i].value;
		        // Remove "C:\fakepath\" from the beginning of the file path if present
		        
		        if(filePath!=""){
			        filePath = filePath.replace("C:\\fakepath\\", "");
			        safeimg += filePath + "/";
		        	
		        }
		 	
	   } */
	   var rimg="${rimg}"
	   var rimglist=rimg.split("/");
	   var rimglistlen=rimglist.length;
	   var delimg=""; 
	    var imgElements = document.getElementsByClassName("imglist");

	    for (var i = 0; i < rimglist.length; i++) {
	        if (imgElements[i]) {
	            const computedStyle = window.getComputedStyle(imgElements[i]);
	            if (computedStyle.opacity == "0.7") {
	                delimg += rimglist[i] + "/";
	            }
	            if (computedStyle.opacity == "1") {
	                safeimg += rimglist[i] + "/";
	            }
	        }
	    }
	    
	    alert(safeimg+"\n"+delimg);
	    document.uform.delimg.value=delimg;
	    document.uform.safeimg.value=safeimg;
	    return true;

   }

	//ajax로 하면 안되냐고 하심 고수!!! 나는 오늘 고수를 먹었고 저분은 고수다


</script>
</head>
<body>
<section>
  <form  name="uform" method="post" action="updateOk" enctype="multipart/form-data" onsubmit="return check()">
  <input type="hidden" name="id" value="${rdto.id}">
  <input type="hidden" name="delimg">
  <input type="hidden" name="safeimg">
	<table width="600" align="center">
		<caption><h2>객실 등록</h2></caption>
		<tr>
			<td width="100">객실명</td>
			<td><input type="text" name="title" value="${rdto.title}"></td>
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
         <td> <input type="text" name="price" value="${rdto.price}"> </td>
       </tr>
       <tr>
         <td> 객실요약 </td>
         <td> <textarea name="content">${rdto.content}</textarea> </td>
       </tr>
       <tr>
         <td rospan="3"> 객실사진 </td>
         <td>
         	<c:forEach items="${imgs}" var="img">
         		<img src="../resources/room/${img}" width="50" height="30" class="imglist" onclick="opacity(this)">
         	</c:forEach>
         </td>
       </tr>
        
        <tr align="center">
         
         <td colspan="2">	
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