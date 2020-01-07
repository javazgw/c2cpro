package com.ht.c2c.server.test;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Pavel Bucek (pavel.bucek at oracle.com)
 */
//@ApplicationPath("/")
public class MyApplication extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        final Set<Class<?>> classes = new HashSet<Class<?>>();
        // register root resource
        classes.add(HelloWorldResource.class);
//23
       classes.add(HW2.class);
        System.out.println("http://localhost:8080/helloworld");
        System.out.println("http://localhost:8080/h2");
        return classes;
    }
}