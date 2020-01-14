/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.redis.Redis;
import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.JWT;
import com.ht.c2c.tools.SQLTools;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;

/**
 * 创建表记录：POST /{控制器路由名称}/create
 * 修改表记录：POST /{控制器路由名称}/update/{id}
 * 删除指定表记录：POST /{控制器路由名称}/delete/{id}
 * 分页查询表记录：GET /{控制器路由名称}/list
 * 获取指定记录详情：GET /{控制器路由名称}/{id}
 */
//地址管理
@Path("/companyAddress")
public class Addr {

    public Addr()
    {
        System.out.println("addr"+this);
    }



    //一般不用，
    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/create")
    public String create(@HeaderParam("token") String token)
    {
        return "create";
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
    public void update(@HeaderParam("token") String token,@PathParam("id") Long id,String updatejson)
    {

        String sql = Configure.getInstance().getProperties().getProperty("ADDRCREATESQL");

        Configure.info(sql);
        String[] reciveColumn = Configure.getInstance().getProperties().getProperty("ADDRCREATESQL_STRING").split(",");


        Hashtable<String,String> ht = JSON.parseObject(updatejson, Hashtable.class);

        Object[] objects = new Object[reciveColumn.length+2];

        for(int i = 0; i<objects.length-2;i++)
        {
            objects[i] =  ht.get(reciveColumn[i]);
        }
        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.format(d);


        objects[objects.length-2] = format.format(d);
        objects[objects.length-1] = id;

        for(Object str:objects)
        {
            System.out.println(str);
        }



        try {

           int  updatecount =  SQLTools.getInstance().Update(sql, objects);

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }


    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{id}")
    public void delete(@HeaderParam("token") String token,@PathParam("id") Long id)
    {

    }

    @GET
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public void list(@HeaderParam("token") String token)
    {

    }


    @GET
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public String one(@HeaderParam("token") String token,@PathParam("id") Long id)
    {
        System.out.println(this);
        System.out.println("id=" +id);
        return "Hello World!";
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

    @GET
    @Produces({MediaType.APPLICATION_JSON,MediaType.TEXT_PLAIN})
    @Path("/list")
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
    }


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
