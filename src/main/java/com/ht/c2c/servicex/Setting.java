package com.ht.c2c.servicex;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.servicex.mall.Common;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
//import javax.enterprise.event.Event;
@ServerEndpoint(value = "/websocket/setting")
//@ApplicationPath("/setting")
@Path("/setting")
public class Setting extends Common {

    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    public Setting() {
        this.tablename = "setting";
    }


    @OnOpen
    public void onOpen(Session session) {
        System.out.println("onOpen");
        sessions.add(session);


        ReturnObject message = new ReturnObject();
        message.setMsg("Welcome " + session.getId());
        session.getAsyncRemote().sendObject(message);
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose");
        sessions.remove(session);

    }

    @OnMessage
    public void onMessage(String message,Session session) throws IOException {
        System.out.println("onmessage");
//        session.getBasicRemote().sendText("test");


        synchronized (sessions) {
            sessions.forEach(sessiontemp -> {
                if (sessiontemp.isOpen()) {
                    System.out.println("broadcast");
                    sessiontemp.getAsyncRemote().sendObject(message);
                    try {
                        sessiontemp.getBasicRemote().sendText(message);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

    }
/*
   public void broadcast(@Observes ReturnObject message) {



        synchronized (sessions) {
            sessions.forEach(session -> {
                if (session.isOpen()) {
                    session.getAsyncRemote().sendObject(message);
                }
            });
        }
    }*/

    @POST
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/create")
    public String create(@HeaderParam("token") String token, String createstr) {

        synchronized (sessions) {
            sessions.forEach(sessiontemp -> {
                if (sessiontemp.isOpen()) {
                    System.out.println("broadcast");
                    //sessiontemp.getAsyncRemote().sendObject(message);
                    try {
                        sessiontemp.getBasicRemote().sendText("create 发送的数据");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        return JSON.toJSON(ro).toString();
    }

    @POST
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public String list(@HeaderParam("token") String token, String bodyquery) {

        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        return JSON.toJSON(ro).toString();
    }

}
