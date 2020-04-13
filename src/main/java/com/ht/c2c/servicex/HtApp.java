/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex;

import com.alibaba.fastjson.serializer.SerializeConfig;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.dataBase.DataSetSerializer;
import com.ht.c2c.server.test.HelloWorldResource;
import com.ht.c2c.servicex.mall.*;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;
@ApplicationPath("/mall")
public class HtApp extends Application {





    Set<Class<?>> classes = new HashSet<Class<?>>();
    public HtApp()
    {
        System.out.println("注册。。。");
        classes.add(HelloWorldResource.class);
        classes.add(Addr.class);
        classes.add(Order.class);
        classes.add(User.class);
        classes.add(Product.class);
        classes.add(Maintain.class);
        classes.add(Setting.class);
        classes.add(gcodetype.class);
        classes.add(GcodeAttr.class);
//暂时放在此处 应该再init 里面的
        SerializeConfig.getGlobalInstance().put(DataSet.class, new DataSetSerializer());
        System.out.println("http://localhost:8080/helloworld---");
//        System.out.println("http://localhost:8080/h2---");

        System.out.println(""+

                " _______  __   __  _______  ___   _    _______  _______  __   __  ___   ______          ____   _______\n"+
                "|       ||  | |  ||       ||   | | |  |       ||       ||  | |  ||   | |      |        |    | |  _    |\n"+
                "|    ___||  | |  ||       ||   |_| |  |       ||   _   ||  |_|  ||   | |  _    | ____   |   | | | |   |\n"+
                "|   |___ |  |_|  ||       ||      _|  |       ||  | |  ||       ||   | | | |   ||____|  |   | | |_|   |\n"+
                "|    ___||       ||      _||     |_   |      _||  |_|  ||       ||   | | |_|   |        |   | |___    |\n"+
                "|   |    |       ||     |_ |    _  |  |     |_ |       | |     | |   | |       |        |   |     |   |\n"+
                "|___|    |_______||_______||___| |_|  |_______||_______|  |___|  |___| |______|         |___|     |___|\n"+

                "");


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

        return classes;
    }
}