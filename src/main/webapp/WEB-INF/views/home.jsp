<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<button type="button" id="toReply">댓글api(Disqus)구현</button>
	<button type="button" id="toMakeReply">댓글 구현</button>
	<button type="button" id="toLike">좋아요 구현</button>
	<button type="button" id="alarm">알람 구현</button>
	<button type="button" id="toProduct">물품페이지</button>
	<button type="button" id="toCart">장바구니</button>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		$("#toReply").click(function(){
			location.href = "${pageContext.request.contextPath}/toReply.do";
		})
		$("#toMakeReply").click(function(){
			location.href = "${pageContext.request.contextPath}/toMakeReply.do";
		})
		$("#toLike").click(function(){
			location.href="${pageContext.request.contextPath}/toLike.do";
		})
		$("#alarm").click(function(){
			location.href="${pageContext.request.contextPath}/toAlarm.do";
		})
		$("#toProduct").click(function(){
			location.href="${pageContext.request.contextPath}/toProduct.do";
		})
		$("#toCart").click(function(){
			location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id=ddd111";
		})
	</script>
</body>
</html>
