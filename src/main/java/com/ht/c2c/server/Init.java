package com.ht.c2c.server;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class Init extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//       super.doGet(req,resp);
        processRequest(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//       super.doPost(req,resp);
        processRequest(req,resp);

    }
    public void processRequest(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if(action==null)
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>你tmd 什么都没提交</h3>");
        }
    }
    public void init(ServletConfig config) {
        try {
            super.init();
        } catch (ServletException e) {
            e.printStackTrace();
        }
        System.out.println("================>[Init]加载缓存.");
        try {
            Cache.getInstance().addCache("GCODE_CACHE","select * from gcode");
            Cache.getInstance().addCache("GCOETYPE_CACHE","select * from gcodetype");

            System.out.println("================>[Init]加载缓存完成.");
            System.out.println("部署要删除");
            System.out.println("http://localhost:8080/default/index3.jsp");
            System.out.println("http://localhost:8080/managerx/admin/main.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    }
