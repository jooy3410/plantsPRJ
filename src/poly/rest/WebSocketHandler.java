package poly.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping(value = "chat/chat")

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
	private Logger log = Logger.getLogger(this.getClass());
    private List<WebSocketSession> sessions = new ArrayList<>();
 
    
    //채팅방 접속
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        
       
        log.info("접속 : {}" + session);
        
     
    }
 
    
    //메시지 전송
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}" + session);
        for(WebSocketSession sess : sessions){
            TextMessage msg = new TextMessage(message.getPayload());
            sess.sendMessage(msg);
        }
    }
 
    
    //채팅방 퇴장
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        log.info("퇴장 : {}" +  session);
    }
}
 
