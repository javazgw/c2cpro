package com.ht.c2c.server;

import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.SQLTools;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Enumeration;

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

        //单表保存
        else if(action.equals("save"))
        {
            resp.setContentType("text/html");

            String table = req.getParameter("tb");
            String icode = req.getParameter("icode");
            table = "gcode";

            String updatesql ="update "+table;
            StringBuffer sql = new StringBuffer();
            sql.append(" set ");
            Enumeration<String> paramekeys = req.getParameterNames();
            //update gcode set gname ='xiaomi2'  where icode =''
            while(paramekeys.hasMoreElements())
            {

                String key = paramekeys.nextElement();
                if(key.equals("icode") || key.equals("action"))
                    continue;
                sql.append(key);
                sql.append("='");
                sql.append(req.getParameter(key).replaceAll(",","''"));
                sql.append("',");
            }
            updatesql =updatesql+sql;
            updatesql =updatesql.substring(0,updatesql.length()-1);
            updatesql =updatesql+" where icode ="+req.getParameter("icode");
            System.out.println(updatesql);

            try {


                SQLTools.getInstance().Update(updatesql);

            } catch (Exception e) {
                Configure.log(""+e.getMessage());
            }
        }
    }

}
