<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>댓글</title>
<style>

</style>
</head>
<body>
	<div class="collapse" id="reply_card">
		<selection class="modal-section">
			<div class="card card-body">
				<!-- 댓글목록 -->
				<div class="reply-list reply-list">
					<!-- 댓글 목록 들어가는 곳 -->
				</div>
				<!-- 댓글 작성 => 로그인상태여야만 댓글작성 칸 나옴. -->
				<div class="row reply_write">
					<div class="col-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
						  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
						</svg>
					</div>
					<div class="col-8" class="input_reply_div">
						<input class="w-100 form-control" id="input_reply" type="text" placeholder="댓글입력...">
					</div>
					<div class="col-3">
						<button type="button" class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
					</div>
				</div>
			</div>
		</selection>
	</div>
	<script>
	
	</script>
</body>
</html>