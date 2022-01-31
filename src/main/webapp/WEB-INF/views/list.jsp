<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" id="toReply">댓글api(Disqus)구현</button>
	<button type="button" id="toMakeReply">댓글 구현</button>
	<button type="button" id="toLike">좋아요 구현</button>
	<button type="button" id="alarm">알람 구현</button>
	<button type="button" id="toProduct">물품페이지</button>
	<button type="button" id="toCart">장바구니</button>
	
	<div id="alarmContent"></div>
	

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
			location.href="${pageContext.request.contextPath}/product/selectAll.do";
		})
		$("#toCart").click(function(){
			location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id=ddd111";
		})
		
		$(document).ready(function(){
		    if(!isEmpty($("#session_id").val()))
		            connectWS();
		});
		
		
		ws = new WebSocket("ws://localhost:8089/alarm");	
		
		//메세지 수신
		ws.onmessage = function(e){
			console.log(e.data);
			let msgObj = JSON.parse(e.data);
		
		let newMsg= $("<div>")
		if("${loginSession.user_id}" == '${msgObj.id}'){
			newMsg.append(msgObj.message);
			$("#alarmContent").append(newMsg); 
		}
			
		}
		
	</script>
	<script type="text/javascript">
var socket = null;
var sock = new SockJS("/echo");
socket =sock;
$(document).ready(function(){
    if(!isEmpty($("#session_id").val()))
            connectWS();
});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
            var splitdata =e.data.split(":");
            if(splitdata[0].indexOf("recMs") > -1)
                $("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
            else
                $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
    }
    
    $("#board1").click(function(){
        location.href="/board/main_board.do";
    });
 

$("#chatForm").submit(function(event){


        event.preventDefault();


            sock.send($("#message").val());


            $("#message").val('').focus();    


    });    


</script>
	
</body>
</html>
