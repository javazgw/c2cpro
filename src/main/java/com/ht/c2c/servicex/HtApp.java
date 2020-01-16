/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex;

import com.ht.c2c.server.test.HelloWorldResource;
import com.ht.c2c.servicex.mall.Addr;
import com.ht.c2c.servicex.mall.Common;
import com.ht.c2c.servicex.mall.Order;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;
@ApplicationPath("/mall")
public class HtApp extends Application {


    Set<Class<?>> classes = new HashSet<Class<?>>();
    public HtApp()
    {
        System.out.println("htapp.....");
        classes.add(HelloWorldResource.class);
        classes.add(Addr.class);
        classes.add(Order.class);
    }
    @Override
    public Set<Class<?>> getClasses() {
        System.out.println("Set.....");
      //  final Set<Class<?>> classes = new HashSet<Class<?>>();
        // register root resource
      //  classes.add(HelloWorldResource.class);
      //  classes.add(Common.class);
       // classes.add(Home.class);
       // classes.add(Order.class);
      //  classes.add(Product.class);
//        classes.add(Common.class);
        System.out.println("http://localhost:8080/helloworld---");
        System.out.println("http://localhost:8080/h2---");
        return classes;
    }
}