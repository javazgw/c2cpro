/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.returnObject;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.Serializable;

/**
 *
 */
public class ReturnObject implements Serializable {
    private int type;
    private String msg;
    private String action;
    private JSONObject json;
//    private JSONObject j;
    public static final  int SUCCESS = 1001;
    public static final  int ERROR = 9001;
    public static final  int DBCONNECTERROR = 2001;
    public static final  int TIMEOUT = 3001;
    public static final  int YOUIPISBANANDFUCKYOU = 4001;
    public static final  int USERNOTEXIST = 4011;
    public static final  int USERORPASSNOTALLOW = 4011;
    //jwt auth 没有token
    public static final  int JWT_NOT_TOKEN = 6010;
    //jwt auth 过期.需要重新登陆
    public static final  int JWT_TOKEN_EXP = 6011;
    //JWT 没有用户名
    public static final  int JWT_TOKEN_NO_USERNAME = 6020;



    public ReturnObject()
    {

    }
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public JSONObject getJson() {
        return json;
    }

    public void setJson(JSONObject json) {
        this.json = json;
    }

    public  static void main(String[] argc)
    {
        ReturnObject rto = new ReturnObject();
        rto.setMsg("errorhaah");
        rto.setType(123);
        System.out.println(JSON.toJSON(rto).getClass());
        ReturnObject rto2  =JSON.parseObject("{\"msg\":\"success\",\"type\":123}",ReturnObject.class);
        System.out.println(rto2.msg);

    }
}
