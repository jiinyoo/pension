<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#test
{
	text-align:center;
	padding-left:0px;


}


#test > li
{
	list-style-type:none;
	border:1px solid black;
	display:inline-block;
	width:225px;
	position:relative;
	text-align:center;
	
}

#test .submenu 
{
	padding-left:0px;
	position:absolute;
	top:50px;
	text-align:center;


}

#test .submenu li
{
	list-style-type:none;
	text-align:center;
	border:1px solid black;
	width:225px;
	
}




</style>



</head>
<body>
	<div id="first"></div>
	<header></header>
	<nav>
	<ul id="test">
		<li>첫번째 메뉴
			<ul class="submenu" style="text-align:center;">
				<li style="text-align:center;">첫번째 하위메뉴1</li>
				<li style="text-align:center;">첫번째 하위메뉴2</li>
				<li style="text-align:center;">첫번째 하위메뉴3</li>
				<li style="text-align:center;">첫번째 하위메뉴4</li>
			</ul>
		</li>
		<li>두번째 메뉴</li>
		<li>세번째 메뉴</li>
		<li>네번째 메뉴</li>
	</ul>
	
	
	</nav>
	<section></section>
	<footer></footer>
	
</body>
</html>