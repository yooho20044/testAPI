<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:set var="ttotal" value="0"/>
			<c:set var="total" value="0"/>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><input type="text" value="${dto.NAME}" disabled></td>
					<td>${dto.PRICE}</td>
					<td><input type="text" class="quantity" value="${dto.QUANTITY}"></td>
					<td><button type="button" class="deleteCart" value="${dto.NAME }">장바구니삭제</button></td>
					<td>
						<c:set var="total" value="${dto.PRICE * dto.QUANTITY }"/>
						<c:set var="ttotal" value="${ttotal+total}"/>
						<c:out value="${total }"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
	<div class="col">
		<label>총 가격</label>
	</div>
	</div>
	<div class="row">
	<div class="col">
		<c:out value="${ttotal }"/>
	</div>
	</div>
	<button type="button">구매</button>
	<button type="button" id="back">취소</button>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	$(".deleteCart").click(function(e){
		let name = e.target.value;
		location.href= "${pageContext.request.contextPath}/cart/deleteCart.do?name="+name;  
	})
	
	$("#back").click(function(){
		location.href="/"
	})
	
	$(".quantity").blur(function(e){
		let quantity = e.target.value;
		let thisRow = $(this).closest('tr');
		let name = thisRow.find('td:eq(0)').find('input').val();
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/cart/updateQuantity.do?quantity="+quantity+"&name=" + name,
			post:"get"
		}).done(function(data){
			if(data == "success"){
				location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id=ddd111";	
			}
		}).fail(function(e){
			console.log(e);
		})
	})
	
	</script>
</body>
</html>