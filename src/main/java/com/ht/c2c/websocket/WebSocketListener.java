package com.ht.c2c.websocket;

import java.util.EventListener;

public interface  WebSocketListener extends EventListener {
    public void WebSocketEvent(WebSocketEvent event);
}
