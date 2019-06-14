package com.ht.c2c.websocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

@ServerEndpoint(value = "/websocket/maintain")
public class Maintain {


    private void init(Session session) {
        System.out.println("init");
    }
    @OnOpen
    public  void onOpen(final Session session) throws IOException {
        init(session);
        System.out.println("onOpen"+session);
        WebSocketObject.getInstance().addDoorListener(new WebSocketListener() {
            @Override
            public void WebSocketEvent(WebSocketEvent event) {
                if(event.state==WebSocketObject.CHANGED)
                {
                    try {
                        session.getBasicRemote().sendText("change");
                    } catch (IOException e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
        });



    }
    @OnMessage
    public void onMessage(String message,Session session) throws IOException {
            System.out.println("onmessage");
        session.getBasicRemote().sendText("test");
    }

    @OnClose
    public void onClose(Session session, CloseReason closeReason){
        System.out.println("onClose");
    }

    @OnError
    public void onError(Session session, Throwable throwable){
        System.out.println("error");
    }

}
