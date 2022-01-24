<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<c:forEach items="${list }" var="dto">
		<div class="row">
			<div class="col">
				<label>${dto.NAME }</label>
			</div>
			<div class="col">
				${dto.CONTENT }
			</div>
			<div class="col quantityBox">
				<label>수량</label>
				<input type="text" class="quantity">
			</div>
			<div class="col stockBox" hidden>
				<input type="text" class="stock" value="${dto.STOCK }">
			</div>
			<div class="col">
				<button type="button" class="cart" value="${dto.PRODUCT_NO }">장바구니담기</button>
			</div>
		</div>
		</c:forEach>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>



//장바구니 버튼 클릭시
	$(".cart").click(function(e){
		let num =e.target.value; //물품번호
		let id = "ddd111";
		let thisRow = $(this).closest(".row");
		let stock = thisRow.find('.stockBox').find('.stock').val(); //재고
		let quantity = thisRow.find('.quantityBox').find('.quantity').val();//수량
		
		
		function Regex(){
			const Regex = /[0-9]/;
			if(Regex.test(quantity)){
				return true;
			}else{
				return false;
			}
		}
		
			if(!Regex() || quantity==""){
				alert("올바른 숫자를 입력해주세요.")
			}else{
				
				//재고파악
				if(quantity<=stock){
					
					//데이터 입력한 뒤에 장바구니로 이동할 것인지 확인받음
					$.ajax({
						url:"${pageContext.request.contextPath}/cart/insertCart.do?product_no="+num+"&user_id="+id+"&quantity="+quantity,
						type: "get"
					}).done(function(data){
						if(data==1){
							let con = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까??");
							if(con == true){
								location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id="+id;
							}
						}else if(data==-1){
							let con = confirm("장바구니에 중복된 상품이 있습니다. 장바구니로 이동하시겠습니까??");
							if(con == true){
								location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id="+id;
							}
						}	
					}).fail(function(e){
						console.log(e);
					})
				}else{
					alert("재고가 부족합니다. 수량을 조절해주세요.");
				}
			}
			
	})

</script>
</body>
</html>