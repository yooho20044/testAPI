package com.api.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.api.configurator.SpringContext;
import com.api.service.NoticeService;


public class echoHandler extends TextWebSocketHandler{
	//모든 클라이언트의 session 값을 저장하는 저장소
		private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		
		
		//spring Container 내부에서 ChatService 클래스형 인스턴스를 찾아 반환해 멤버필드에 담는 작업
		private NoticeService service = SpringContext.getApplicationContext().getBean(NoticeService.class);
		
		
		
//	    Map<String,WebSocketSession> us ers = new HashMap<>();
	    
	    @Override
	    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	        String user_name = searchUserName(session);
	        sessionList.add(session);
            session.sendMessage(new TextMessage("recMs :"+noticeMapper.countMessageView(user_name)));
	    }
		
	    @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	        String user_name= searchUserName(session);
	 
	        
//	        //사용자가 접속중인지 아닌지
//	        WebSocketSession chatwritingSession =users.get("user_name");
//	        if(chatwritingSession != null) {
//	            TextMessage textMessage = new TextMessage(user_name+ " 님이 메세지를 보냈습니다.");
//	            chatwritingSession.sendMessage(textMessage);
//	        }
	        for(WebSocketSession sess: sessionList) {
	            sess.sendMessage(new TextMessage(user_name+": "+message.getPayload()));
	        }
	    }
		
		  @Override
		    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		        String user_name = searchUserName(session);
		        System.out.println("연결 끊어짐");
		        for(WebSocketSession sess : sessionList) {
		            sess.sendMessage(new TextMessage(user_name+"님의 연결이 끊어졌습니다."));
		        }
		        sessionList.remove(session);
		    }
		
		 public String searchUserName(WebSocketSession session)throws Exception {
		        String user_name;
		        Map<String, Object> map;
		        map = session.getAttributes();
		        user_name = (String) map.get("user_id");
		        return user_name;
		    }
		}
	

