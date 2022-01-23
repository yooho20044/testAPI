<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<label>키가쑥쑥 화분</label>
			</div>
			<div class="col">
				식물을 이 화분에 심으면 키가 쑥쑥 자라요!
			</div>
			<div class="col">
				<label>수량</label>
				<select id="quantity1">
					<option value="">수량선택</option>
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
					<option value=5>5</option>
					<option value=6>6</option>
					<option value=7>7</option>
					<option value=8>8</option>
					<option value=9>9</option>
				</select>
			</div>
			<div class="col">
				<button type="button" id="cart1" value="1">장바구니담기</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label>트럼프카드</label>
			</div>
			<div class="col">
				마술에 사용되는 트럼프카드!
			</div>
			<div class="col">
				<label>수량</label>
				<select id="quantity2">
					<option value="">수량선택</option>
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
					<option value=5>5</option>
					<option value=6>6</option>
					<option value=7>7</option>
					<option value=8>8</option>
					<option value=9>9</option>
				</select>
			</div>
			<div class="col">
				<button type="button" id="cart2" value="2">장바구니담기</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label>물품3</label>
			</div>
			<div class="col">
				<input type="text" value="물품3정보">
			</div>
			<div class="col">
				<label>수량</label>
				<select name="quantity">
					<option value="">수량선택</option>
					<option value=1>1</option>
					<option value=1>2</option>
					<option value=1>3</option>
					<option value=1>4</option>
					<option value=1>5</option>
					<option value=1>6</option>
					<option value=1>7</option>
					<option value=1>8</option>
					<option value=1>9</option>
				</select>
			</div>
			<div class="col">
				<button type="button" value="3">장바구니담기</button>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

//장바구니 버튼 클릭시
	$("#cart1").click(function(){
		let num = $(this).val();
		let id = "ddd111"
		let quantity = $("#quantity1").val();
		
		
		//데이터 입력한 뒤에 장바구니로 이동할 것인지 확인받음
		$.ajax({
			url:"${pageContext.request.contextPath}/cart/insertCart.do?product_no="+num+"&user_id="+id+"&quantity="+quantity,
			type: "get"
		}).done(function(data){
			if(data==1){
				let con = confirm("장바구니로 이동하시겠습니까??");
				if(con == true){
					location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id="+id;
				}else{
						
				}
			}	
		}).fail(function(e){
			console.log(e);
		})
	})
	
	//장바구니 버튼 클릭시
	$("#cart2").click(function(){
		let num = $(this).val();
		let id = "ddd111"
		let quantity = $("#quantity2").val();
		
		
		//데이터 입력한 뒤에 장바구니로 이동할 것인지 확인받음
		$.ajax({
			url:"${pageContext.request.contextPath}/cart/insertCart.do?product_no="+num+"&user_id="+id+"&quantity="+quantity,
			type: "get"
		}).done(function(data){
			if(data==1){
				let con = confirm("장바구니로 이동하시겠습니까??");
				if(con == true){
					location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id="+id;
				}else{
						
				}
			}	
		}).fail(function(e){
			console.log(e);
		})
	})
	

</script>
</body>
</html>