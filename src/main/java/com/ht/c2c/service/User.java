/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.service;


import com.ht.c2c.dataBase.DataSet;
import com.ht.c2c.server.Cache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;


@WebServlet("/USER")
public class User extends HtServlet {



    public void doAction(HttpServletRequest req,HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");

        //设置逻辑实现
        PrintWriter out = resp.getWriter();
        out.println("<h3>User</h3>");
        DataSet ds = Cache.getInstance().getCahe("GCODE_CACHE");
        out.println("<h3>"+ds+"</h3>");

    }


    }
