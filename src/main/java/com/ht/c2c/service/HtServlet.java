/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.service;

import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.server.Cache;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class HtServlet extends HttpServlet {
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
            /*resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>User</h3>");
            DataSet ds = Cache.getInstance().getCahe("GCODE_CACHE");
            out.println("<h3>"+ds+"</h3>");*/
            doAction(req,resp);
        }
    }

    public void doAction(HttpServletRequest req,HttpServletResponse resp)throws ServletException, IOException
    {

    }
}
