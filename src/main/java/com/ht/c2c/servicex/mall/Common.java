/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.redis.Redis;
import com.ht.c2c.returnObject.ReturnObject;

import com.ht.c2c.tools.SQLTools;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;


import static com.ht.c2c.tools.SQLTools.getDateNow;

/**
 * 创建表记录：POST /{控制器路由名称}/create
 * 修改表记录：POST /{控制器路由名称}/update/{id}
 * 删除指定表记录：POST /{控制器路由名称}/delete/{id}
 * 分页查询表记录：GET /{控制器路由名称}/list
 * 获取指定记录详情：GET /{控制器路由名称}/{id}
 */
//地址管理

public class Common {


    public String tablename ;
    public int onepagenum = 10;
    public int curpagenum = 1;
    public Common()
    {

        System.out.println("addr"+this);

        tablename = "addr";
    }




    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/create")
    public String create(@HeaderParam("token") String token,String createstr)
    {




        System.out.println(token);
        HashMap<String,Object> ht = JSON.parseObject(createstr, HashMap.class);
        System.out.println(createstr);
        ht.put("createdate",getDateNow());
//        ht.put("ccode",)
        try {
            SQLTools.getInstance().insertFromHt(tablename,ht);
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }

        //  return Redis.getInstance().getHashJson("zgw30");
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        return JSON.toJSON(ro).toString();
    }


    /**
     *
     * 更新，必须有token，否则表混论
     * 没有token 或者token 异常，当然要报错
     * 更新的内容 sql 定义里取得，参数前端提交
     * @param token
     * @param id
     * @param updatejson  这个是放在body 里提交的
     *
     * update 的 配置文件在setting.ini 里
     *        ADDRCREATESQL 是需要执行的sql
     *        ADDRCREATESQL_STRING 是需要提交保存的字段
     *        但是where 条件里的id 是 url 参数提供的
     *        另外一个where 条件是token 和 用户相关 的ccode 提供的
     *
     *        于是update sql 执行条件和表结构必须有id ，ccode，时间戳（updatedate）
     */
    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/update/{id}")
    public String update(@HeaderParam("token") String token,@PathParam("id") String id,String updatejson)
    {



        System.out.println(updatejson);
        System.out.println(id);
        HashMap<String,Object> ht = JSON.parseObject(updatejson, HashMap.class);

        ht.put("updatedate",getDateNow());

        String keyjson = "{'icode':'"+id+"'}";
        HashMap<String,Object> keyht = JSON.parseObject(keyjson, HashMap.class);

        try {
            SQLTools.getInstance().updateFromHt(this.tablename,ht,keyht);
        } catch (Exception e) {

            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }

        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        return JSON.toJSON(ro).toString();

    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{id}")
    public String delete(@HeaderParam("token") String token,@PathParam("id") String id)
    {
        String sql = "delete from "+this.tablename+" where icode ="+id;
        try {
            SQLTools.getInstance().Update(sql);
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        return JSON.toJSON(ro).toString();
    }

    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public String  list(@HeaderParam("token") String token,String bodyquery)
    {

        try {

            StringBuffer sqlquery = new StringBuffer();
            HashMap<String,Object> queryht = new HashMap<>();
            if(bodyquery!=null && !bodyquery.equals(""))
            {
                queryht = JSON.parseObject(bodyquery, HashMap.class);
            }

            for(String key :queryht.keySet())
            {

                Object value = queryht.get(key);
                if(key.equals("onepagenum") )
                {
                    onepagenum = Integer.parseInt(value.toString());
                    continue;
                }
                if(key.equals("total"))
                {
                    continue;
                }
                if(key.equals("curpagenum"))
                {
                    curpagenum = Integer.parseInt(value.toString());
                    continue;
                }

                if(value!=null) {
                    value =value.toString().replaceAll("'","''");
                    sqlquery.append(key);
                    sqlquery.append(" like ");

                    sqlquery.append("  '%" +value +"%'");
                    sqlquery.append(" and ");
                }
            }



            String sql = "select * from "+tablename+" where "+ sqlquery + " 1=1    order by createdate desc  ";

            String totalsql = " select count(*) as c from ("+sql+" ) as a ";
            sql = sql + " limit "+((curpagenum -1)* onepagenum)+","+ onepagenum +"";

            DataSet ds = SQLTools.getInstance().query(sql);

            DataSet totalds = SQLTools.getInstance().query(totalsql);



            String jsonString = JSON.toJSONString(ds);
            JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("ds",ja);
            JSONObject jinfo = new JSONObject();
            jinfo.put("total",Integer.parseInt(totalds.getValue(0,"c").toString()));
            jinfo.put("onepagenum",onepagenum);
            jinfo.put("curpagenum",curpagenum);

            jsonObject.put("info",jinfo);

            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.SUCCESS);
            ro.setMsg("成功");
            ro.setJson(jsonObject);

            return JSON.toJSON(ro).toString();
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();

        }

    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public String one(@HeaderParam("token") String token,@PathParam("id") String id)
    {
        try {



            String sql = "select * from "+this.tablename+" where icode = '"+id+"'";

            DataSet ds = SQLTools.getInstance().query(sql);




            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.SUCCESS);
            ro.setMsg("成功");

            String jsonString = JSON.toJSONString(ds);
            JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
            JSONObject jsonObject = new JSONObject();
            if(ja.size() >0) {
                jsonObject.put("row", ja.get(0));


            }
            ro.setJson(jsonObject);

            return JSON.toJSON(ro).toString();
        } catch (Exception e) {
            e.printStackTrace();
            ReturnObject  ro =new ReturnObject();
            ro.setType(ReturnObject.ERROR);
            ro.setMsg("失败");
            return JSON.toJSON(ro).toString();
        }
    }




/*
    @GET
    @Produces("text/plain")
    @Path("{id}")
    public String getaddr(@PathParam("id") Long id) {
        System.out.println(this);
        System.out.println("id=" +id);
        return "Hello World!";
    }*/

   /* @GET
    @Produces({MediaType.APPLICATION_JSON,MediaType.TEXT_PLAIN})
    @Path("/list2")
    public String getAlladdr(@HeaderParam("token") String token) {

        String username  = JWT.getInstance().getUserNameFromToken(token);
        DataSet ds = null;
        try {
             ds = SQLTools.getInstance().query("select * from addr where ccode ='" + username + "'");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        System.out.println(this);

        if(ds !=null)
            return ds.toString();
        return null;
    }*/


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/add")
    public JSON add(String query,@HeaderParam("token") String token) {
        /* recivename
            addr
            tel
            mobil
            status
            createdate
            updatedate
            ccode

        */

        System.out.println(token);
       Hashtable<String,String> ht = JSON.parseObject(query, Hashtable.class);
        System.out.println(query);


        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.format(d);

        try {

            SQLTools.getInstance().Update("insert into addr (recivename,addr,tel,mobil,ccode,createdate) values(?,?,?,?,?,?)", new String[]{
                    ht.get("recivename"), ht.get("addr"),ht.get("tel"),ht.get("mobil"),ht.get("ccode"), format.format(d)
            });
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return Redis.getInstance().getHashJson("zgw30");
    }
}
