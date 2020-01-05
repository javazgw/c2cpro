/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.redis;

import com.ht.c2c.tools.Configure;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import redis.clients.jedis.Jedis;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;


public class Redis {

    private  static Redis redis ;
    Jedis jedis;
    private Redis()
    {
//         jedis = new Jedis("localhost");
         jedis = new Jedis(Configure.getInstance().getProperties().get("redis.url").toString());
    }

    public static Redis getInstance()
    {
        if(redis == null)
        {
            redis = new Redis();

        }
        return redis;
    }
    public void setKeyValue(String key,String value)
    {
        jedis.set(key,value);
    }
    public String getKey(String key)
    {
        return jedis.get(key);
    }
//List
    public void setList(String key,String... strings)
    {
        jedis.lpush(key,strings);
    }
    public List<String> getList(String key)
    {
        return jedis.lrange(key,0,-1);
    }

    public List<String> getList(String key,int start,int end)
    {
        return jedis.lrange(key,start,end);
    }


    public void delList(String key)
    {
        jedis.del(key);
    }

    public void insertList(String key,String... strings)
    {
        jedis.rpush(key,strings);
    }

    //has
    public void setHash(String key, Map<String,String> map)
    {
        jedis.hmset(key,map);

    }
    public Map<String, String> getHash(String key)
    {
        return jedis.hgetAll(key);
    }

    public void delHash(String key)
    {
        jedis.del(key);
    }
    public void setHashKay(String key,String mapkey,String mvalue)
    {
        jedis.hset(key,mapkey,mvalue);

    }

    public static  void main(String[] argc)
    {
        long curtime = System.currentTimeMillis();
        for(int i = 0 ;i<1000;i++) {
            Redis.getInstance().setKeyValue("zgw"+i, "1231");
            Redis.getInstance().setList("zgw2"+i, "1231", "333", "444");
            Hashtable<String, String> ht = new Hashtable<>();
            ht.put("zzz", "3333");
            ht.put("zzz1", "3222333");
            ht.put("zzz2", "223333");
            Redis.getInstance().setHash("zgw3"+i, ht);
        }
        long curtime2 = System.currentTimeMillis();
        System.out.println((curtime2-curtime) /1000);
    }

}
