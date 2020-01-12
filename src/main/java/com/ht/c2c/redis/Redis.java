/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.redis;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.Cell;
import com.ht.c2c.dataBase.Row;
import com.ht.c2c.tools.Configure;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;


public class Redis {

    private  static Redis redis ;
    Jedis jedis;
    private Redis()
    {

        JedisPoolConfig config = new JedisPoolConfig();
        //最大连接数
        config.setMaxTotal(Integer.parseInt(Configure.getInstance().getProperties().get("redis.pool.maxTotal").toString()));
        //最多空闲实例
        config.setMaxIdle(Integer.parseInt(Configure.getInstance().getProperties().get("redis.pool.maxIdle").toString()));

        //超时时间
//        config.setMaxWaitMillis(MAX_WAIT);
        //
        config.setTestOnBorrow(false);


        String ADDR = Configure.getInstance().getProperties().get("redis.url").toString();
        int PORT = Integer.parseInt(Configure.getInstance().getProperties().get("redis.port").toString());
        JedisPool pool = new JedisPool(config, ADDR, PORT, 1000,"Ht123321");

        jedis = pool.getResource();


//         jedis = new Jedis("localhost");
         //jedis = new Jedis(Configure.getInstance().getProperties().get("redis.url").toString());
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

    //hash
    public void setHash(String key, Map<String,String> map)
    {
        jedis.hmset(key,map);

    }
    public Map<String, String> getHash(String key)
    {
        return jedis.hgetAll(key);
    }

    public JSON getHashJson(String key)
    {
        Map map =  getHash(key);
        JSONObject json = new JSONObject(map);
        return json;
    }
    public void delHash(String key)
    {
        jedis.del(key);
    }
    public void setHashKay(String key,String mapkey,String mvalue)
    {
        jedis.hset(key,mapkey,mvalue);

    }

    public Jedis getJedis()
    {
        return redis.jedis;
    }

    public static  void main(String[] argc)
    {
        Redis.getInstance().getJedis().flushDB();
        long current = System.currentTimeMillis();
        for(int i = 0; i<1000;i++) {
            Redis.getInstance().setKeyValue("zgw"+i, "1231");
            Redis.getInstance().setList("zgwlist"+i, "1231", "333", "444");
            Hashtable<String, String> ht = new Hashtable<>();
            ht.put("zzz", "3333");
            ht.put("zzz1", "3222333");
            ht.put("zzz2", "223333");
            Redis.getInstance().setHash("zgwhash"+i, ht);
        }
        long current2 = System.currentTimeMillis();
        System.out.println((current2-current )/1000);

        Cell cell = new Cell("zgw","value");
        Row row  = new Row();
        row.addCell(cell);


       // System.out.println(Redis.getInstance().getHashJson("zgw30"));

    }

}
