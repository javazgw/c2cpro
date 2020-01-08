package com.ht.c2c.Admin;

import com.ht.c2c.servicex.mall.User;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/admin")
public class AdminService extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        final Set<Class<?>> classes = new HashSet<Class<?>>();
        classes.add(User.class);
        return classes;
    }
}
