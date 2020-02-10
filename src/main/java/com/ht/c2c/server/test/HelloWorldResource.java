package com.ht.c2c.server.test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.server.Cache;
import com.ht.c2c.tools.SQLTools;

import javax.annotation.PostConstruct;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

/**
 * @author Pavel Bucek (pavel.bucek at oracle.com)
 */
@Path("helloworld")
public class HelloWorldResource {

    @GET
    @Produces("text/plain")
    @Path("{id}")
    public String getHello(@PathParam("id") Long id) {
        System.out.println(this);
        System.out.println("id=" +id);
        return "Hello World!";
    }
    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("list")
    public String list() {
        System.out.println(this);
      //  System.out.println("id=" +id);

       // return "{\"data\":{\"name\":\"zgw\"},\"code\":20000}";
        return "{\"addr\":\"gd\",\"name\":\"zgw\",\"filelist\":[{\"uid\":1580972678514,\"name\":\"2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"url\":\"http://localhost:8080/uploaddata/2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"status\":\"success\"},{\"uid\":1580972678514,\"name\":\"2d4ff8e5-2fb3-49a7-8ecd-7b4f592b36a0.jpg\",\"url\":\"http://localhost:8080/uploaddata/96c49f78-7da7-4fbe-9f98-864234e5fd82.png\",\"status\":\"success\",\"file\":\"[{\\\"name\\\":123},{\\\"name\\\":3455}]\"}]}";
    }
    @Path("name/{id}")
    @GET
    @Produces("text/plain")
    public String getH1(@PathParam("id") Long id)
    {
        System.out.println(this);
        System.out.println("id=" +id);
        DataSet ds  = Cache.getInstance().getCahe("GCOETYPE_CACHE");
        return ds.toString()
                ;

    }

    @Path("list/{curpage}/{onepagenum}")
    @GET
    @Produces("text/plain")
    public String getH2(@PathParam("curpage") int start,@PathParam("onepagenum") int end)
    {
        System.out.println(this);

        System.out.printf("start %s end = %s %n ",start,end);
        DataSet ds  = Cache.getInstance().getCahe("GCOETYPE_CACHE");
        return ds.toString()
                ;

    }




    @POST
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("default")
    public String getDefault() throws Exception {

        String sql = "SELECT addr as value FROM c2cdb.maintain where addr is not null and addr !='null' group by addr";

        DataSet ds = SQLTools.getInstance().query(sql);


        JSONObject jsonObject = new JSONObject();
        String jsonString = JSON.toJSONString(ds);
        JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
        jsonObject.put("ds",ja);
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setJson(jsonObject);
        return JSON.toJSON(ro).toString();


    }




    @POST
    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("default2/{type}")
    public String getDefault2(@PathParam("type") String type) throws Exception {

        type = type.replaceAll("'","''");
        String sql = "select code ,value  from setting where type ='"+type+"'";

        DataSet ds = SQLTools.getInstance().query(sql);


        JSONObject jsonObject = new JSONObject();
        String jsonString = JSON.toJSONString(ds);
        JSONArray ja =(JSONArray)JSON.parseArray(jsonString);
        jsonObject.put("ds",ja);
        ReturnObject ro =new ReturnObject();
        ro.setType(ReturnObject.SUCCESS);
        ro.setMsg("成功");
        ro.setJson(jsonObject);
        return JSON.toJSON(ro).toString();


    }
   /*
   @Path("/getSubTaskInfo/") // url上没有参数，参数通过body传入
    @POST
    @Consumes(MediaType.APPLICATION_JSON) // 声明传入参数是json格式
    @Produces(MediaType.APPLICATION_JSON)  //返回json

    */




}