/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.service;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;
import java.io.IOException;
import java.io.PrintWriter;


@Path("/G/{gid}")
public class GoodsServlet  extends HtServlet{
    public void doAction(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException
    {

        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String servletPath = req.getServletPath();

        System.out.println("requesturl="+requestURI +" contextpath = "+contextPath+"servletPath="+servletPath);
        resp.setContentType("text/html");

        //设置逻辑实现
        PrintWriter out = resp.getWriter();

        out.println("goods");
    }
}
