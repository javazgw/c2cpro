package com.ht.c2c.servicex.mall;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.JWT;
import com.ht.c2c.tools.SQLTools;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.UUID;

import static com.ht.c2c.returnObject.ReturnObject.*;

@Path("user")
public class User  extends Common {
//    roles: ['admin'],
//    introduction: 'I am a super administrator',
//    avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
//    name: 'Super Admin'

    String roles,introduction,avatar,name;

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User()
    {
        System.out.println("user...");
        this.tablename = "user";
    }

    /**
     * 注意mediatype
     * @param username
     * @param pass
     * @return
     */
    @POST
    @Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/login")
    public String login(String bodyquery)
    {
        String  username = "";
        String pass= "";
            System.out.println("username = "+username);
            System.out.println("psss = "+pass);
        HashMap<String,Object> queryht = new HashMap<>();
        if(bodyquery!=null && !bodyquery.equals(""))
        {
            queryht = JSON.parseObject(bodyquery, HashMap.class);

            System.out.println("queryht="+queryht);
            username = queryht.get("username").toString();
            pass = queryht.get("password").toString();
        }

        String sql = "select count(*) as c from bcode where bname='"+username+"' and pass=md5('"+pass+"')";
        Connection con = null;
        Configure.info(sql);
        try {
            con = SQLTools.getInstance().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while(rs.next())
            {
                int c = rs.getInt("c");
                if(c==1)
                {
                    String id = UUID.randomUUID().toString();
                    String jwt =  JWT.getInstance().createJWT(id,username,1000000);




                    return ReturnLoginSuccess(jwt);
                }
                else if(c==0)
                {

                    return ReturnLoginERROR();
                }
                else{
                    return ReturnLoginERROR();
                }
            }
        } catch (Exception e) {
//                e.printStackTrace();
            return ReturnLoginERROR();
        }

        return ReturnLoginERROR();


    }
}
