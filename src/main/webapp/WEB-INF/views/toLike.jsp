<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아용</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
  .likebtnBox, .dislikebtnBox{
float:left;
}
button{
width:120px;
height: 40px;
background-color:rgb(255, 255, 255);
border-color: aliceblue;
}
button:hover, #dislike{
    background-color: rgba(0, 0, 0, 0.384);
    color:white;
}

#dislike{
	display:none;
}

</style>
</head>
<body>
	 <div class="container">
        <div class="row">
            <div class="col-2">
                <label>총 좋아요 수</label>
            </div>
            <div class="col-10" id="countInput">
                
            </div>
        </div>
        
		<div class="row">
			<div class="col-2 ml-3 likebtnBox">
				<button type="button" id="like">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                        <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                      </svg>
                    <span>좋아요+1</span>
                </button>
                <button type="button" id="dislike">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                        <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
                      </svg>
                    <span>좋아요-1</span>
                </button>
			</div>	
		</div>		
		<div class="row">
			<div id="msgStack"></div>
		</div>		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
    

	$(document).ready(function() {
			count();
			selectLike();
		 
		});   
	//좋아요 +1
$('#like').click(function(){
	let bid= 'ddd111'
	let receiver='aaa111'
	let count ='1'
	let btitle = '자바의정석'
	$(this).css("display", "none")
	$("#dislike").css("display", "block");

	$.ajax({
		url : "${pageContext.request.contextPath}/like/plus.do?post_no=1&user_id=ddd111",
		type : "get"
	}).done(function(data){
		if(data == "available"){
			Recount();
		}else if(data == "unavailable"){
			alert("좋아요 요청 실패");
		}
	}).fail(function(e){
		console.log(e);
	})
})

	//좋아요 -1
$('#dislike').click(function(){
	let bid= 'ddd111'
		let receiver='aaa111'
		let count ='0'
		let btitle = '자바의정석'
	$(this).css("display", "none")
	$("#like").css("display", "block");
	
	$.ajax({
		url : "${pageContext.request.contextPath}/like/minus.do?post_no=1&user_id=ddd111",
		type : "get"
	}).done(function(data){
		if(data == "available"){
			Recount();
		}else if(data == "unavailable"){
			alert("싫어요 요청 실패");
		}
	}).fail(function(e){
		console.log(e);
	})
})

//좋아요 카운트 함수
function count(){
	$.ajax({
		url : "${pageContext.request.contextPath}/like/count.do?post_no=1",
		type : "get"
	}).done(function(data){
		let count = "<input type='text' value='"+data+"'>"
		$("#countInput").append(count);
	}).fail(function(e){
		console.log(e);
	});
	}

//좋아요 추가, 취소시 좋아요 다시 카운트 함수
function Recount(){
	$.ajax({
		url : "${pageContext.request.contextPath}/like/count.do?post_no=1",
		type : "get"
	}).done(function(data){
		let Recount = "<input type='text' value='"+data+"'>"
		$('#countInput *').remove();
		$("#countInput").append(Recount);
	}).fail(function(e){
		console.log(e);
	});
	}
	
function selectLike(){
	$.ajax({
		url:"${pageContext.request.contextPath}/like/selectLike.do?user_id=ddd111&post_no=1",
		type: "get"
	}).done(function(data){
		if(data == "available"){
			$("#dislike").css("display", "block")
			$("#like").css("display", "none");
		}else if(data == "unavailable"){
			$("#dislike").css("display", "none")
			$("#like").css("display", "block");
		}
	}).fail(function(e){
		console.log(e);
	});
}
</script>
</body>
</html>