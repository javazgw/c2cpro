package com.ht.c2c.servicex.mall;

import javax.ws.rs.Path;

@Path("/addr")
public class Addr extends Common{
    public Addr()
    {
        this.tablename = "addr";
    }
}
