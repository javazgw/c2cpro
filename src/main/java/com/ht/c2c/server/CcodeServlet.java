/*
 * Copyright (c) 2019.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.server;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.shoping.Shopingcar;
import com.ht.c2c.shoping.Shopitem;
import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.SQLTools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import static com.ht.c2c.returnObject.ReturnObject.ERROR;
import static com.ht.c2c.returnObject.ReturnObject.SUCCESS;

/**
 * 用户端servlet
 * 负责用户登陆，用户配置，购车车，订单
 */
@WebServlet("/cc")
public class CcodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    public void processRequest(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        Enumeration<String> enumeration = req.getParameterNames();

        while(enumeration.hasMoreElements())
        {
            String key = enumeration.nextElement();
            System.out.println(key+"--"+req.getParameter(key));
        }

        if(action==null)
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>baseserblet</h3>");
        }

        else if(action.equals("login"))
        {
            ReturnObject rto = new ReturnObject();
            String cname = req.getParameter("cname");
            String pass = req.getParameter("pass");
            String remember = req.getParameter("remember");
            String checkvalue =req.getParameter("checkvalue");

            if(!checkvalue.equals(req.getSession().getAttribute("checkvalue")))
            {
                rto.setType(ERROR);
                rto.setMsg("验证码不正确 ");
                PrintWriter out = resp.getWriter();
                out.println(JSON.toJSON(rto));
                return;
            }


            String sql = "select count(*) as c from ccode where cname='"+cname+"' and pass=md5("+pass+")";
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
                        rto.setType(SUCCESS);
                        req.getSession().setAttribute("cname",cname);
                        if("on".equals(remember))
                        {
                            req.getSession().setMaxInactiveInterval(-1);
                        }

                        PrintWriter out = resp.getWriter();

                        out.println(JSON.toJSON(rto));
                    }
                    else if(c==0)
                    {
                        rto.setType(ERROR);
                        rto.setMsg("用户名不存在或者密码不正确 ");

                        PrintWriter out = resp.getWriter();
                        out.println(JSON.toJSON(rto));
                    }
                    else{
                        rto.setType(ERROR);
                        PrintWriter out = resp.getWriter();
                        out.println(JSON.toJSON(rto));
                    }
                }
            } catch (Exception e) {
//                e.printStackTrace();
                Configure.error(e.getMessage());
                PrintWriter out = resp.getWriter();
                rto.setType(ERROR);
                rto.setMsg(e.getMessage());
                out.println(JSON.toJSON(rto));
            }


        }

        else if(action.equals("register"))
        {
            String cname = req.getParameter("cname");
            String email = req.getParameter("email");
            String pass = req.getParameter("pass");
            String rpass = req.getParameter("rpass");
            ReturnObject rto = new ReturnObject();
            try {
                if (!pass.equals(rpass)) {
                    rto.setType(ERROR);
                    rto.setMsg("两次录入验证码不一致 ");
                    PrintWriter out = resp.getWriter();
                    out.println(JSON.toJSON(rto));
                    return;
                }
            }
            catch(Exception e2)
            {
                rto.setType(ERROR);
                rto.setMsg("空？ ");
                PrintWriter out = resp.getWriter();
                out.println(JSON.toJSON(rto));
                return;
            }
            String sql = "select count(*) as c from ccode where cname='"+cname+"'";
            Connection con = null;
            try {
                con = SQLTools.getInstance().getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while(rs.next())
                {
                    int c = rs.getInt("c");
                    if(c==1)
                    {
                        rto.setType(ERROR);
                        rto.setMsg("已经存在相同用户");
                        PrintWriter out = resp.getWriter();
                        out.println(JSON.toJSON(rto));
                    }
                    else if(c==0)
                    {




                        SQLTools.getInstance().Update("insert into ccode set cname='"+cname+"', pass=md5("+pass+"),email='"+email+"'");

                        req.getSession().setAttribute("cname",cname);
                        //resp.sendRedirect("/managerx/admin/main.jsp");
                        rto.setType(SUCCESS);
                        rto.setMsg("成功注册跳转");
                        PrintWriter out = resp.getWriter();
                        out.println(JSON.toJSON(rto));

                    }
                    else{






                        rto.setType(ERROR);
                        rto.setMsg("未知错误");
                        PrintWriter out = resp.getWriter();
                        out.println(JSON.toJSON(rto));
                    }

                }
            } catch (Exception e) {
//                e.printStackTrace();
                Configure.error(sql+""+e.getMessage());
                PrintWriter out = resp.getWriter();
                out.println("<h3>错误</h3>");
            }

        }

        else if(action.equals("logout"))
        {
            req.getSession().removeAttribute("cname");
        }

        else if(action.equals("addshopingcar"))
        {

            ReturnObject rto = new ReturnObject();
            Shopingcar shopingcar;
            String gcode = req.getParameter("gcode");
            String cname = req.getSession().getAttribute("cname").toString();
            int num = Integer.parseInt(req.getParameter("num"));
            if(req.getSession().getAttribute("shoppingcar")!=null) {
                shopingcar = (Shopingcar) req.getSession().getAttribute("shoppingcar");
            }
            else
            {
                shopingcar = new Shopingcar(cname);
                req.getSession().setAttribute("shoppingcar",shopingcar);

            }

            Shopitem shopitem = new Shopitem();
            shopitem.setNum(num);
            shopitem.setGoodsid(gcode);
            if(shopingcar.add(shopitem)){
                rto.setType(SUCCESS);

            }
            else
            {
                rto.setType(ERROR);
                rto.setMsg("");
            }
            PrintWriter out = resp.getWriter();
            out.println(rto);

        }
        else if(action.equals("removeshopingcar"))
        {
            Shopingcar shopingcar;
            String gcode = req.getParameter("gcode");
            String cname = req.getSession().getAttribute("cname").toString();
            int num = Integer.parseInt(req.getParameter("num"));
            if(req.getSession().getAttribute("shoppingcar")!=null) {
                shopingcar = (Shopingcar) req.getSession().getAttribute("shoppingcar");
            }
            else
            {
                shopingcar = new Shopingcar(cname);
                req.getSession().setAttribute("shoppingcar",shopingcar);

            }

            Shopitem shopitem = new Shopitem();
            shopitem.setNum(num);
            shopitem.setGoodsid(gcode);
            ReturnObject rto = new ReturnObject();
            if(shopingcar.removeItem(shopitem)){
                rto.setType(SUCCESS);

            }
            else
            {
                rto.setType(ERROR);
                rto.setMsg("");
            }
            PrintWriter out = resp.getWriter();
            out.println(rto);


        }
    }
}
