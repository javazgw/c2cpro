package com.ht.c2c.servicex.mall;

import javax.ws.rs.Path;

@Path("user")
public class User  extends Common {
    public User()
    {
        this.tablename = "user";
    }
}
