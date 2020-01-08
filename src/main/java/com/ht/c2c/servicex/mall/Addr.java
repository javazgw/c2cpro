/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.redis.Redis;
import com.ht.c2c.tools.JWT;
import com.ht.c2c.tools.SQLTools;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;

//地址管理
@Path("/companyAddress")
public class Addr {

    public Addr()
    {
        System.out.println("addr"+this);
    }

    @GET
    @Produces("text/plain")
    @Path("{id}")
    public String getaddr(@PathParam("id") Long id) {
        System.out.println(this);
        System.out.println("id=" +id);
        return "Hello World!";
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON,MediaType.TEXT_PLAIN})
    @Path("/list")
    public String getAlladdr(@HeaderParam("token") String token) {

        String username  = JWT.getInstance().getUserNameFromToken(token);
        DataSet ds = null;
        try {
             ds = SQLTools.getInstance().query("select * from addr where ccode ='" + username + "'");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        System.out.println(this);

        if(ds !=null)
            return ds.toString();
        return null;
    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/add")
    public JSON add(String query,@HeaderParam("token") String token) {
        /* recivename
            addr
            tel
            mobil
            status
            createdate
            updatedate
            ccode

        */

        System.out.println(token);
       Hashtable<String,String> ht = JSON.parseObject(query, Hashtable.class);
        System.out.println(query);


        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.format(d);

        try {

            SQLTools.getInstance().Update("insert into addr (recivename,addr,tel,mobil,ccode,createdate) values(?,?,?,?,?,?)", new String[]{
                    ht.get("recivename"), ht.get("addr"),ht.get("tel"),ht.get("mobil"),ht.get("ccode"), format.format(d)
            });
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return Redis.getInstance().getHashJson("zgw30");
    }
}
