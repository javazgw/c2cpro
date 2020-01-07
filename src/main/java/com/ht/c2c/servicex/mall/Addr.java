/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.redis.Redis;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//地址管理
@Path("/companyAddress")
public class Addr {
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
    public String getAlladdr() {
        System.out.println(this);

        return "getall addr";
    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/add")
    public JSON add(String query) {

        System.out.println(query);

        return Redis.getInstance().getHashJson("zgw30");
    }
}
