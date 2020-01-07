package com.ht.c2c.service;

import javax.ws.rs.*;

/**
 * 会员管理
 */
@Path("/sso")
public class Member {
    @Path("/register")
    @POST
    @Produces("text/plain")
    public String register() {
        return "Hello3";
    }

// @RequestMapping(value = "/login", method = RequestMethod.POST)
//    @RequestMapping(value = "/getAuthCode", method = RequestMethod.GET)
//    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
//    @RequestMapping(value = "/refreshToken", method = RequestMethod.GET)
}
