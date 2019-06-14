package com.ht.c2c.websocket;

import java.util.EventObject;

public class WebSocketEvent extends EventObject {
    /**
     * Constructs a prototypical Event.
     *
     * @param source The object on which the Event initially occurred.
     * @throws IllegalArgumentException if source is null.
     */
    private static final long serialVersionUID = 6936098798146410884L;
    int state;
    public WebSocketEvent(Object source,int state) {
        super(source);
        this.state = state;
    }
}
