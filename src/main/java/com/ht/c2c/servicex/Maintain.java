package com.ht.c2c.servicex;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.servicex.mall.Common;
import com.ht.c2c.tools.SQLTools;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.*;

import static com.ht.c2c.tools.SQLTools.getDateNow;

@ServerEndpoint(value = "/websocket/M")
@Path("/maintain")
public class Maintain extends Common {


    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    public Maintain()
    {
        this.tablename = "maintain";
    }

    @POST
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/create")
    public String create(@HeaderParam("token") String token, String createstr) {

        System.out.println(token);
        System.out.println(createstr);

        if(createstr == null || createstr.trim().equals(""))
        {
            createstr = "{}";
        }
        HashMap<String,Object> ht = JSON.parseObject(createstr, HashMap.class);
        System.out.println(createstr);

        if(!ht.containsKey("icode"))
        {
            String icode = UUID.randomUUID().toString();
            ht.put("icode",icode);
        }
        ht.put("createdate",getDateNow());

        try {

           SQLTools.getInstance().insertFromHt(tablename,ht);
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }


//        String json  = JSON.toJSONString(ht);
//        JSON.toJSON(ht);


        //  return Redis.getInstance().getHashJson("zgw30");
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setAction("CREATE");
        ro.setJson((JSONObject)  JSON.toJSON(ht));

        broatcast(JSON.toJSON(ro).toString());

        return JSON.toJSON(ro).toString();
    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public String  list(@HeaderParam("token") String token,String bodyquery)
    {
/*
        onepagenum: 10,
                total: 0,
            curpagenum: 1*/

        try {

            StringBuffer sqlquery = new StringBuffer();
            HashMap<String,Object> queryht = new HashMap<>();
            if(bodyquery!=null && !bodyquery.equals(""))
            {
                 queryht = JSON.parseObject(bodyquery, HashMap.class);
            }

            for(String key :queryht.keySet())
            {

                Object value = queryht.get(key);
                if(key.equals("onepagenum") )
                {
                    onepagenum = Integer.parseInt(value.toString());
                    continue;
                }
                if(key.equals("total"))
                {
                    continue;
                }
                if(key.equals("curpagenum"))
                {
                    curpagenum = Integer.parseInt(value.toString());
                    continue;
                }

                if(value!=null) {
                    value =value.toString().replaceAll("'","''");
                    sqlquery.append(key);
                    sqlquery.append(" like ");

                    sqlquery.append("  '%" +value +"%'");
                    sqlquery.append(" and ");
                }
            }



            String sql = "select * from "+tablename+" where "+ sqlquery + " 1=1    order by createdate desc  ";

            String totalsql = " select count(*) as c from ("+sql+" ) as a ";
            sql = sql + " limit "+((curpagenum -1)* onepagenum)+","+ onepagenum +"";

            DataSet ds = SQLTools.getInstance().query(sql);

            DataSet totalds = SQLTools.getInstance().query(totalsql);



            String jsonString = JSON.toJSONString(ds);
            JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ds",ja);
            JSONObject jinfo = new JSONObject();
            jinfo.put("total",Integer.parseInt(totalds.getValue(0,"c").toString()));
            jinfo.put("onepagenum",onepagenum);
            jinfo.put("curpagenum",curpagenum);

            jsonObject.put("info",jinfo);

            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.SUCCESS);
            ro.setMsg("成功");
            ro.setJson(jsonObject);

            return JSON.toJSON(ro).toString();
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();

        }

    }

    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/update/{id}")
    public String update(@HeaderParam("token") String token,@PathParam("id") String id,String updatejson)
    {



        System.out.println(updatejson);
        System.out.println(id);
        HashMap<String,Object> ht = JSON.parseObject(updatejson, HashMap.class);

        ht.put("updatedate",getDateNow());

        String keyjson = "{'icode':'"+id+"'}";
        HashMap<String,Object> keyht = JSON.parseObject(keyjson, HashMap.class);

        try {
            SQLTools.getInstance().updateFromHt(this.tablename,ht,keyht);
        } catch (Exception e) {

            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }
        //broatcast(json);

        ht.put("icode",id);
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setAction("UPDATE");
        ro.setJson((JSONObject)  JSON.toJSON(ht));
        //ro.setJson(JSON.toJSONString(ht));
        broatcast(JSON.toJSON(ro).toString());
        return JSON.toJSON(ro).toString();

    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{id}")
    public String delete(@HeaderParam("token") String token,@PathParam("id") String id)
    {
        String sql = "delete from addr where icode ='"+id+"'";
        try {
            SQLTools.getInstance().Update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }
//        broatcast();
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");

        ro.setAction("DELETE");


        JSONObject jsonObject = new JSONObject();
        jsonObject.put("icode",id);
        ro.setJson(jsonObject);

        broatcast(JSON.toJSONString(ro));
        return JSON.toJSON(ro).toString();
    }

    public void broatcast(String json)
    {
        synchronized (sessions) {
            sessions.forEach(sessiontemp -> {
                if (sessiontemp.isOpen()) {
                    System.out.println("broadcast");
                    //sessiontemp.getAsyncRemote().sendObject(message);
                    try {
                        sessiontemp.getBasicRemote().sendText(json);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
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


           }
}
