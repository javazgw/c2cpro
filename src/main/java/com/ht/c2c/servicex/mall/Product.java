/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import javax.ws.rs.Path;

@Path("/product")
public class Product extends Common {
    public Product()
    {
        this.tablename = "product";
    }
}
