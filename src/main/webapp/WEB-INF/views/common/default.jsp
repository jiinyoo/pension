<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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


#adouter{
	width:100%;
	height:40px;
	background:black;
}


#adouter #first{
	width:1000px;
	height:40px;
	line-height:40px;
	margin:auto;
	background:black;
	text-align:center;
	color:white;
}

#adouter #first #left
{
	width:960px;
	float:left;
}

#adouter #first #right
{
	width:40px;
	float:right;

}

header{
	width:1000px;
	height:80px;
	line-height:60px;
	margin:auto;
	position:relative;
}

header #left
{
	width:100px;
	height:80px;
	display:inline-block;
	text-algin:center;
	position:relative;
	
}

header #fright
{
	width:890px;
	height:80px;
	display:inline-block;
	text-align:right;
}


 header #fright #myInfo{
 
 	position:relative;
 
 }
 
 
 
 header #fright #myInfo #myMenu{
 
 	position:absolute;
 	padding-left:5px;
 	left:-5px;
 	top:2px;
 	margin-left:0px;
 	background:white;
 	width:60px;
 	height:100px;
 	border:1px solid #d2eaf8;
 	visibility:hidden;
 	z-index:100;
 	
 
 
 }
 
  header #fright #myInfo #myMenu li{
  
  	list-style-type:none;
  	width:60px;
  	height:26px;
  	line-height:26px;
	margin-left:0px;
	text-align:left;
  
  }
 
 
 
 

#logo
{
	margin-top:5px;
	position:absolute

}


nav {
	width:1000px;
	height:50px;
	line-height:50px;
	margin:auto;
	background:#d2eaf8;
}

nav #main 
{
      padding-left:0px;
      margin-left:30px;
}

nav #main > li
{
	display:inline-block;
	list-style-type:none;
	width:150px;
	height:50px;
	line-height:50px;
	text-align:center;
	position : relative; /*보조 메뉴를 위하여 준다 */
}

 nav #main > li > .menu /*하위메뉴 ul태그*/
{

	padding-left:0px;
	position:absolute;
	left:0px;
	top:50px;
	background:white;
	visibility:hidden;
	border:1px solid #d2eaf8;

} 

nav #main > li > .menu > li /*하위메뉴 ul태그*/
{

	list-style-type:none;
	width:150px;
	height:35px;
	line-height:35px;
	
} 


footer 
{
	width:100%;
	height:180px;
	margin:auto;
	background:white;
}


#footerdiv
{
	width:100%;
	height:180px;
	margin:auto;
	background:black;
	position:relative;

}


#footerfirst
{
	position:absolute;
	left:10%;
	top:20px;;
	display:inline-block;

}


#footermiddle
{
	position:absolute;
	top:22px;
	left:40%;
	display:inline-block;
}

#footerlast
{
	position:absolute;
	top:80px;
	left:80%;
	display:inline-block;
	color:white;
	font-size:20px;
}

a 
{
    text-decoration: none;
    color: inherit; /* 링크의 색상을 부모 요소의 색상과 동일하게 설정 */
}

a:visited 
{
   color: inherit; /* 방문한 링크의 색상을 부모 요소의 색상과 동일하게 설정 */
}





</style>
<script>

function outCheck()
{
	if(confirm("정말 회원 탈퇴 신청을 하시겠습니까?"))
	{
		location="../member/outMember";
	}
	
}






function viewMenu(index)
{
	
	if(index==3 && document.getElementById("roomMenu").innerHTML.trim() =="")//&& document.getElementById("roomMenu").innerHTML.trim()==""
	{
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			
			
			var rlist=JSON.parse(chk.responseText)
			for (rdto of rlist)
				{
					//alert(rdto.id+" "+rdto.title);
					var new1=document.createElement("li");
					var a=document.createElement("a")
					a.setAttribute("href", "../room/roomView?id="+rdto.id);
					a.innerText=rdto.title;
					new1.appendChild(a);
					//new1.innerHTML="<a href='roomView?id="+rdto.id+"'>"+rdto.title+"</a>"
					document.getElementById("roomMenu").appendChild(new1);
				
				}
		}
		chk.open("get","../virtual/getRooms")
		chk.send();
	}
	document.getElementsByClassName("menu")[index].style.visibility="visible";
}
function hideMenu(index)
{
	document.getElementsByClassName("menu")[index].style.visibility="hidden";
}

var h=40;
function hideX()
{
	ss=setInterval(function(){
		h--;
		document.getElementById("logo").style.transform = "translateY(" + (h-40) + "px)";
		document.getElementById("fright").style.transform = "translateY(" + (h-40) + "px)";
		document.getElementById("first").style.height=h+"px";
		document.getElementById("adouter").style.height=h+"px";
		if(h==0)
		{
			document.getElementById("adouter").style.display="none";
			document.getElementById("logo").style.transform="translateY(" + 0 + "px)";
			document.getElementById("fright").style.transform="translateY(" + 0 + "px)";
			clearInterval(ss);
		}
	
	},40);
}



function viewMy()
{
	
	document.getElementById("myMenu").style.visibility="visible";
}

function hideMy()
{
	document.getElementById("myMenu").style.visibility="hidden";	
}



</script>





	<decorator:head/>
</head>
<body>
	<div id="adouter">
		<div id="first">
				<div id="left">펜션 오픈 기념으로 1박하면 3박이 공짜입니다.</div>
				<div id="right"><span onclick="hideX()">X</span></div>
		</div>
	</div>
	<header>
		<div id="left"><a href="../main/index"><img src="../resources/imgs/logo.jpg" id="logo" height="90px"></a></div>
		<div id="fright"> 
		<c:if test="${userid==null}">
		<a href="../member/login">로그인</a> | <a href="../member/member">회원가입</a> 
		</c:if>
		<c:if test="${userid=='admin'}">
			<a href="../tour/list">여행후기</a> |
         	<a href="../board/list">게시판</a> |
            <a href="../gongji/list">공지사항</a> |
			<a href="../adminRoom/list">객실관리</a> |
			<a href="../adminRoom/reserveList">예약관리</a> |
			<a href="../adminRoom/inquiryList">문의관리</a> |
		</c:if>
		
		<c:if test="${userid!=null}">
			<span id="myInfo" onmouseover="viewMy()" onmouseout="hideMy()">${name}님
				<ul id="myMenu">
					<li><a href="../member/bmemberView">회원정보</a></li>
					<li><a href="../member/reserveList">예약정보</a></li>
					<li><a href="../member/myWrite">나의 글</a></li>
					<li><a href="javascript:outCheck()">회원탈퇴</a></li>				
				</ul>
			</span> |
			<a href="../member/logout">로그아웃</a>
		</c:if>
			| <a href="../inquiry/write">문의하기</a>
		</div>
	</header>
	<nav>
		<ul id="main">
			<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)">펜션 소개
				<ul class="menu">
					<li> 펜션지기 </li>
           			<li> 오시는길 </li>
           			<li> 우리 펜션은? </li>
				</ul>
			</li>
			<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">주변 볼거리
				<ul class="menu">
					<li> 고봉산 </li>
           			<li> 개스타 하우스 </li>
				</ul>
			</li>
			<li onmouseover="viewMenu(2)" onmouseout="hideMenu(2)">주변 맛집
				<ul class="menu">
					<li> 숏컷 로스터스 </li>
           			<li> 다미가 </li>
           			<li> 힐사이드 </li>
           			<li> 르돌치 </li>
				</ul>
			</li>
			<li onmouseover="viewMenu(3)" onmouseout="hideMenu(3)">객실 현황
				<ul class="menu" id="roomMenu"></ul>
			</li>
			<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)">예약 관련
				<ul class="menu">
					<li> 예약 안내 </li>
           			<li><a href="../reserve/reserve">실시간 예약</a></li>
				</ul>
			</li>
			<li onmouseover="viewMenu(5)" onmouseout="hideMenu(5)">커뮤니티
				<ul class="menu">
					<li><a href="../gongji/list"> 공지 사항</a> </li>
           			<li><a href="../tour/list"> 여행후기</a> </li>
           			<li> <a href="../board/list">회원 게시판</a></li>
           			<li><a href="../inquiry/write"> 문의하기</a> </li>
				</ul>
			</li>		
		</ul>
	</nav>

	<decorator:body/>
	
	<footer>
		<div id="footerdiv">
			
		<div id="footerfirst"><img src="../resources/imgs/logo2.jpg" id="logo2" height="130px"></div>
		<div id="footermiddle"><span id="footertext" style="font-size:9px; color:white; text-align:left;">
								<p>
								고양시 성석펜션<p>

								경기 고양시 일산서구 113-4<p>
								
								대표자 : 유지인 | 사업자 번호 :830-42-098490<p>
								
								개인정보처리방침<p>
								
								COPYRIGHT©(주)지인트레블.ALL RIGHTS RESERVED<p>
								
								T.01073978663</span></div>
		<div id="footerlast">TEL.010-7397-8663</div>
	
	
		</div>
	</footer>
</body>
</html>