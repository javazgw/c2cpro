package com.ht.c2c.websocket;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

public class WebSocketObject {
    final public int INSERT = 1;
    final public int DEL = 2;
    final public static int CHANGED = 4;

    private static WebSocketObject webSocketObject = null;
    private Collection listeners;
    private WebSocketObject()
    {

    }
    public static WebSocketObject getInstance()
    {
        if(webSocketObject == null)
        {
            webSocketObject = new WebSocketObject();
        }

        return webSocketObject;

    }

    public void addDoorListener(WebSocketListener listener) {
        if (listeners == null) {
            listeners = new HashSet();
        }
        listeners.add(listener);
    }

    public void removeDoorListener(WebSocketListener listener) {
        if (listeners == null)
            return;
        listeners.remove(listener);
    }
    public  void fireWorkspaceChanged() {
        if (listeners == null)
            return;
        WebSocketEvent event = new WebSocketEvent(this, 4);
        notifyListeners(event);
    }
    private void notifyListeners(WebSocketEvent event) {
        Iterator iter = listeners.iterator();
        while (iter.hasNext()) {
            WebSocketListener listener = (WebSocketListener) iter.next();
            listener.WebSocketEvent(event);
        }
    }



    public static void main(String[] str)
    {
        WebSocketObject.getInstance().addDoorListener(new WebSocketListener() {
            @Override
            public void WebSocketEvent(WebSocketEvent event) {
                System.out.println("fire");
            }
        });

        WebSocketObject aa = WebSocketObject.getInstance();
        aa.fireWorkspaceChanged();
    }
}


