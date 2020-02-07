/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/order")
public class Order extends Common {

    public Order()
    {
        this.tablename = "order";
    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public String  list(@HeaderParam("token") String token, String bodyquery)
    {
        return super.list(token,bodyquery);
    }
}
