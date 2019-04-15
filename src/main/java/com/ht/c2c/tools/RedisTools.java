package com.ht.c2c.tools;

import redis.clients.jedis.Jedis;

public class RedisTools {
    public static void main(String[] argv)
    {
        Jedis jedis = new Jedis("localhost");
        System.out.println("连接成功");
        //查看服务是否运行
        System.out.println("服务正在运行: "+jedis.ping());
    }
}
