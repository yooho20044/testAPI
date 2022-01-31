package com.api.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.api.configurator.SpringContext;
import com.api.configurator.WSConfig;
import com.api.dto.NoticeDTO;
import com.api.service.NoticeService;
import com.google.gson.JsonObject;

@ServerEndpoint(value="/alarm", configurator=WSConfig.class)
public class EndPoint {
	
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private HttpSession session;
	
	private NoticeService service = SpringContext.getApplicationContext().getBean(NoticeService.class);
	
	
	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		clients.add(session);
		System.out.println("접속 완료");
		
		this.session = (HttpSession)config.getUserProperties().get("hSession");
	}
	
	@OnMessage
	public void onReceive(String message Session session) {
		String userID=(String)this.session.getAttribute("loginID");
		JsonObject obj = new JsonObject();
		obj.addProperty("id", userID);
		obj.addProperty("message", message);
		
		synchronized(clients) { //동기화 블럭
			//이 동기화 블럭이 실행되는 동안 다른 쓰레드가 이 블럭 안으로 들어오는 것을 막아 줌
			//즉 for문이 도는 중간에 onClose 메서드를 통해 clients list에 변화가 생겼다 하더라도
			//즉각적으로 이 블럭안의 clients 리스트에 반영되지 않아 ConcurrentModification Exception 발생X
			for(Session client : clients) {
				//for문을 돌리면서 모든 클라이언트에게 지금 받은 메세지를 전송
				if(client != session) {
					try {//throws를 하게 되면 나머지 클라이언트가 메세지를 받지 못할 수 있음
						
						client.getBasicRemote().sendText(obj.toString());
						}catch(IOException e) {
							e.printStackTrace();
						}
				}
			}
		}
		//클라이언트로부터 받은 메세지를 데이터베이스에 저장하는 작업 -> ChatService 
				try {
				service.insert(new NoticeDTO(userID, message));
				}catch(Exception e) {
					e.printStackTrace();
					return;
				}
			}
			
			@OnClose //연결이 끊어지면 실행되는 메서드 
			public void onClose(Session session) {
				clients.remove(session);
				System.out.println("클라이언트의 접속이 끊어졌습니다.");
			}
		}
