package com.ht.c2c.server.test;

import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.server.Cache;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

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
   /*
   @Path("/getSubTaskInfo/") // url上没有参数，参数通过body传入
    @POST
    @Consumes(MediaType.APPLICATION_JSON) // 声明传入参数是json格式
    @Produces(MediaType.APPLICATION_JSON)  //返回json

    */




}