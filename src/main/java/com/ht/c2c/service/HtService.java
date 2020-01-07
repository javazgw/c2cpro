package com.ht.c2c.service;

import com.ht.c2c.server.Goods;
import com.ht.c2c.server.test.HW2;
import com.ht.c2c.server.test.HelloWorldResource;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/")
public class HtService  extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        final Set<Class<?>> classes = new HashSet<Class<?>>();
        classes.add(User.class);
        classes.add(Order.class);
        classes.add(Goods.class);
        //classes.add(GoodsType.class);
        //classes.add(Addr.class);
        //classes.add(ShopingCar.class);
        return classes;
    }
}
