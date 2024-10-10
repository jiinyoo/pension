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
		width:1000px;
		height:800px;
		margin:auto;
	}
	
	section table{
	
		border-spacing:0px;
	}
	
	section table td{
	
	
		height:40px;
	}



	section #img{
	
		height:260px;
	}


	section #cont{
	
		height:120px;
	}
	
	section #cont{
	
		height:120px;
	}
	
	section select{
		
		height:28px;
		width:120px;
	
	}

</style>
<script>
	function chgPrice() //4개의 select 태그 에서 값이 변경되면 결제 금액을 다시 계산
	{
		//숙박 요금 => 숙박일수 * 1박 가격 //모든 body내의 값을 자바스크립트에서 읽으면 전부 string
		//더하기를 제외한 연산은 Number형으로 변환 없이 사용가능
		
		var suk=parseInt(document.rform.suk.value);
		var inwonprice=parseInt(document.rform.inwon.value);
		var bbqprice=parseInt(document.rform.bbq.value);
		var chacolprice=parseInt(document.rform.chacol.value);
		
		var sukprice=suk*${rdto.price};
		//인원추가 요금
		var inwonprice=(inwonprice-${rdto.min})*10000;
		inwonprice=suk*inwonprice;
		//bbq요금
		var bbqprice=bbqprice*50000;
		//숯불요금
		var chacolprice=chacolprice*20000;
		//위의 4개를 더한 후
		
		var total=sukprice+inwonprice+bbqprice+chacolprice;
		document.rform.chgprice.value=total;
		//comma를 추가하기
		total=new Intl.NumberFormat().format(total);
		
		
		document.getElementById("chgprice").innerText=total;
		
	}


	function chgImg(my)
	{
		//alert(my)
		document.getElementById("maximg").src=my;
	}
	


</script>
</head>
<body><!-- reserve/reserveNext.jsp -->
<!-- 몇박, 입실인원, 옵션추가 -->
<section>
<form name="rform" action="reserveOk">
	<input type="hidden" name="inday" value="${date}">
	<input type="hidden" name="chgprice" value="${rdto.price}">
	<input type="hidden" name="rid" value="${rdto.id}">
	<!-- 아웃데이는 컨트롤러에서 -->
	<table align="center">
		<caption><h3>예약 정보</h3></caption>
		<tr>
			<td width="180">입실일</td>
			<td width="300">${date}</td>
			<td width="300">숙박일수</td>
			<td width="220">
				<select name="suk" onchange="chgPrice()">
					<c:forEach begin="1" end="${suk}" var="i">
						<option value="${i}">${i}박</option>					
					</c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<td>기본 정보</td>		
			<td>${rdto.min}인/${rdto.max}인</td>
			<td>입실인원(1인:10,000원)</td>
			<td>
				<select name="inwon" onchange="chgPrice()">
					<c:forEach begin="${rdto.min}" end="${rdto.max}" var="i">
						<option value="${i}">${i}명</option>
					</c:forEach>				
				</select>
			</td>
		</tr>
		<tr>
			<td>bbq(50,000)원</td>
			<td>
				<select name="bbq" onchange="chgPrice()">
					<option value="0">선택안함</option>
					<option value="1">1회분</option>
					<option value="2">2회분</option>
					<option value="3">3회분</option>
					<option value="4">4회분</option>
					<option value="5">5회분</option>
					<option value="6">6회분</option>
				</select>
			</td>
			<td>숯불패키지(20,000)원</td>
			<td>
				<select name="chacol" onchange="chgPrice()">
					<option value="0">선택안함</option>
					<option value="1">1회분</option>
					<option value="2">2회분</option>
					<option value="3">3회분</option>
					<option value="4">4회분</option>
					<option value="5">5회분</option>
					<option value="6">6회분</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>총결 결제 금액</td>
			<td colspan="3"><span id="chgprice">${rdto.price2}</span>원</td>
		</tr>
		<tr id="img">
			<td>객실사진</td>		
			<td colspan="3">
				<img src="../resources/room/${rdto.imgs[0]}" width="400" height="260" id="maximg">
				<hr>
			<c:forEach items="${rdto.imgs}" var="img">
				<img src="../resources/room/${img}" width="50" onclick="chgImg(this.src)">			
			</c:forEach>
			</td>
		</tr>
		<tr id="cont">
			<td>객실 정보</td>		
			<td colspan="3">${rdto.content}</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="예약 완료"></td>
		</tr>
	</table>
</form>
</section>	
</body>
</html>