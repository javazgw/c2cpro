/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.returnObject;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;

import java.io.Serializable;
import java.util.HashMap;

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




    public static String ReturnError(int type)
    {
        ReturnObject ro =new ReturnObject();

        ro.setType(type);
        ro.setMsg("失败");
        return JSON.toJSON(ro).toString();
    }
    public static String ReturnRowSuccess( HashMap<String,Object> ht,String action)
    {
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setAction(action);
        ro.setJson((JSONObject)  JSON.toJSON(ht));


        return JSON.toJSON(ro).toString();
    }
    public static String ReturnDSSuccess(DataSet ds)
    {
        return ReturnDSSuccess (ds,0,0,0);
    }
    /**
     * 通用类返回数据集dataset和数据的总数.
     * @param ds
     * @param totalcount  总数
     * @param onepagenum  一页显示数量
     * @param curpagenum   当前页数w
     * @return
     */
    public static String ReturnDSSuccess(DataSet ds,int totalcount ,int onepagenum,int curpagenum)
    {
        ReturnObject ro = new ReturnObject();
        String jsonString = JSON.toJSONString(ds);
        JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ds",ja);

        if(totalcount!=0) {
            JSONObject jinfo = new JSONObject();
            jinfo.put("total", totalcount);
            jinfo.put("onepagenum", onepagenum);
            jinfo.put("curpagenum", curpagenum);

            jsonObject.put("info", jinfo);
        }

        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setJson(jsonObject);

        return JSON.toJSON(ro).toString();
       // return ro;
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
