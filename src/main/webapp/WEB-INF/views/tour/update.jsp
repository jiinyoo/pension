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
	    font-family: 'Pretendard-Regular';
	    overflow: auto; /* 스크롤바 자동 */
	    resize: none; /* 사용자가 크기 조정할 수 없도록 설정, 필요 시 제거 */
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
		




	#yform{
		text-align:center;
	}

</style>
<script>

function opacity(my)
{
	   if (my.style.opacity == "" || my.style.opacity == 1) {
		 
	        my.style.opacity = 0.7;
	    } else {
	    	 
	        my.style.opacity = 1;
	    }
}





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
	   var rimg="${tdto.timg}"
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
<section>
<form method="post" action="updateOk" enctype="multipart/form-data" id="yform" onsubmit="return check()">
<input type="hidden" name="id" value="${tdto.id}">
<input type="hidden" name="delimg">
<input type="hidden" name="safeimg">
	<h3>여행 후기 등록</h3>
	<div><input type="text" name="title" value="${tdto.title}"></div>
	<div><textarea name="content">${tdto.content}</textarea></div>
	<div>
		<input type="button" value="파일 추가" onclick="add()">
		<input type="button" value="파일 삭제" onclick="del()">
	</div>
	<div>
		<c:forEach items="${tdto.timgs}" var="img">
		<c:if test="${img!=''}">
         		<img src="../resources/tour/${img}" width="50" height="30" class="imglist" onclick="opacity(this)">
        </c:if>
         </c:forEach>
	</div>
	<div id="outer2">
		<p id="one" class="one">
			<input type="file" name="fname0" class="file">
		</p>
	</div>
	<div><input type="submit" value="후기 수정"></div>
</form>
</section>
</body>
</html>