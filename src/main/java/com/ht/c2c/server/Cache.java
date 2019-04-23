/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */
/**
 * 缓存类，返回dataset，常用的而且不经常更新的数据放在此处
 * 注意 是常用，不常更新的数据
 * 此缓存会在定时任务里执行更新。
 * 或者你手动更新Cache.getInstance().reCache("GCODE_CACHE");
 * 或者即便全部更新缓存也应该很快就
 * Cache.getInstance().reCache("GCODE_CACHE");
 */
package com.ht.c2c.server;

import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.tools.SQLTools;

import java.util.Hashtable;

public class Cache {
    private static   Cache cache;
    Hashtable<String , DataSet> ht = new Hashtable<String, DataSet>();
    Hashtable<String , String> cachesetting = new Hashtable<String, String>();

    private Cache()
    {

    }
    public static Cache getInstance()
    {
        if(cache==null)
        {
            cache=new Cache();
        }
        return cache;
    }
    public void init()
    {

    }
    public void addCache(String name,String sql) throws Exception {
        DataSet ds = SQLTools.getInstance().query(sql);
        ht.put(name,ds);
        cachesetting.put(name,sql);
    }
    public void removeCache(String name)
    {
        ht.remove(name);
    }
    public void reCache(String name) throws Exception {
        String sql = cachesetting.get(name);
        DataSet ds = SQLTools.getInstance().query(sql);
        ht.put(name,ds);

    }
    public void reCacheAll() throws Exception {
        for(String key :ht.keySet())
        {
            reCache(key);
        }
    }
    public DataSet getCahe(String name)
    {
        return ht.get(name);
    }

}
