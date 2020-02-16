package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.tools.SQLTools;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.HashMap;
import java.util.UUID;

import static com.ht.c2c.tools.SQLTools.getDateNow;
@Path("/gcodetype")
public class gcodetype  extends Common {



        public gcodetype() {
            this.tablename = "gcodetype";
        }

        @POST
        @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
        @Produces(MediaType.APPLICATION_JSON)
        @Path("/create")
        public String create(@HeaderParam("token") String token, String createstr) {

            System.out.println(token);
            System.out.println(createstr);

            if (createstr == null || createstr.trim().equals("")) {
                createstr = "{}";
            }
            HashMap<String, Object> ht = JSON.parseObject(createstr, HashMap.class);
            System.out.println(createstr);

            if (!ht.containsKey("icode")) {
                String icode = UUID.randomUUID().toString();
                ht.put("icode", icode);
            }
            ht.put("createdate", getDateNow());

            try {

                SQLTools.getInstance().insertFromHt(tablename, ht);
            } catch (Exception e) {
                e.printStackTrace();
                ReturnObject ro = new ReturnObject();
                ro.setType(ReturnObject.ERROR);
                ro.setMsg("失败");
                return JSON.toJSON(ro).toString();
            }


//        String json  = JSON.toJSONString(ht);
//        JSON.toJSON(ht);


            //  return Redis.getInstance().getHashJson("zgw30");
            ReturnObject ro = new ReturnObject();
            ro.setType(ReturnObject.SUCCESS);
            ro.setMsg("成功");
            ro.setAction("CREATE");
            ro.setJson((JSONObject) JSON.toJSON(ht));

            //broatcast(JSON.toJSON(ro).toString());

            return JSON.toJSON(ro).toString();
        }

        @POST
        @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
        @Produces(MediaType.APPLICATION_JSON)
        @Path("/update/{id}")
        public String update(@HeaderParam("token") String token, @PathParam("id") String id, String updatejson) {


            System.out.println(updatejson);
            System.out.println(id);
            HashMap<String, Object> ht = JSON.parseObject(updatejson, HashMap.class);

            ht.put("updatedate", getDateNow());

            String keyjson = "{'icode':'" + id + "'}";
            HashMap<String, Object> keyht = JSON.parseObject(keyjson, HashMap.class);

            try {
                SQLTools.getInstance().updateFromHt(this.tablename, ht, keyht);
            } catch (Exception e) {

                e.printStackTrace();
                ReturnObject ro = new ReturnObject();
                ro.setType(ReturnObject.ERROR);
                ro.setMsg("失败");
                return JSON.toJSON(ro).toString();
            }
            //broatcast(json);

            ht.put("icode", id);
            ReturnObject ro = new ReturnObject();
            ro.setType(ReturnObject.SUCCESS);
            ro.setMsg("成功");
            ro.setAction("UPDATE");
            ro.setJson((JSONObject) JSON.toJSON(ht));
            //ro.setJson(JSON.toJSONString(ht));
            //broatcast(JSON.toJSON(ro).toString());
            return JSON.toJSON(ro).toString();

        }

}
