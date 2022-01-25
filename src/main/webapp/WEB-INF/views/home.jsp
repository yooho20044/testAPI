<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<label>아이디</label>
			<input type="text" id="user_id">
		</div>
		<div class="row">
			<label>비밀번호</label>
			<input type="password" id="password">
		</div>
		<div class="row">
			<button type="button" id="login">로그인</button>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		$("#login").click(function(){
			
			let id = $("#user_id").val();
			let pw = $("#password").val();
			
			
			location.href="${pageContext.request.contextPath}/member/login.do?user_id="+id+"&password="+pw;
		})
	</script>
</body>
</html>
