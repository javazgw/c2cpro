package com.ht.c2c.server;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BaseServlet extends HttpServlet {
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
        System.out.println("action = "+action);
        if(action==null)
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>baseserblet</h3>");
        }
        else if(action.equals("getgoodsitem"))
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>getgoodsitem</h3>");
        }
        else if(action.equals("getorderitem"))
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>getorderitem</h3>");
        }
    }

}
