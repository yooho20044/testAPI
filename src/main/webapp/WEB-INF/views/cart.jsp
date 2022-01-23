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
				<th>재고</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.NAME}</td>
					<td>${dto.PRICE}</td>
					<td>${dto.QUANTITY}</td>
					<td><button type="button" class="deleteCart" value="${dto.NAME }">장바구니삭제</button></td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
	<button type="button">구매</button>
	<button type="button">취소</button>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	$(".deleteCart").click(function(e){
		let name = e.target.value;
		location.href= "${pageContext.request.contextPath}/cart/deleteCart.do?name="+name;  
	})
	</script>
</body>
</html>