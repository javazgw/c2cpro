package com.ht.c2c.server.test;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
@Path("/h2")
public class HW2 {
//    @GET
//    @Produces("text/plain")
//    public String get2() {
//        return "Hello2";
//    }

    @GET
    @Produces("text/plain")
    public String get3() {
        return "Hello3";
    }


}
