package com.ht.c2c.server;

import com.alibaba.fastjson.JSON;
import com.ht.c2c.returnObject.ReturnObject;
import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.SQLTools;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.ht.c2c.returnObject.ReturnObject.ERROR;
import static com.ht.c2c.returnObject.ReturnObject.SUCCESS;

/**
 * Created by guangwangzhuang on 2019/4/12.
 */
public class LoginServlet extends HttpServlet{
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
        String remoteHost = req.getRemoteHost();
        String remoteAddr = req.getRemoteAddr();
        Configure.log(remoteHost);
        Configure.log(remoteAddr);
        if(action==null)
        {
            resp.setContentType("text/html");

            //设置逻辑实现
            PrintWriter out = resp.getWriter();
            out.println("<h3>denglu</h3>");
        }

        else if(action.equals("httpclientlogin"))
        {
            ReturnObject rto = new ReturnObject();
            String bname = req.getParameter("bname");
            String pass = req.getParameter("pass");


            String sql = "select count(*) as c from bcode where bname='"+bname+"' and pass=md5('"+pass+"')";
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
                        req.getSession().setAttribute("bname",bname);
                        PrintWriter out = resp.getWriter();

                        out.println(JSON.toJSON(rto));
                    }
                    else if(c==0)
                    {
                        rto.setType(ERROR);
                        rto.setMsg("用户名不存在或者密码不正确");
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
                out.println("<h3>错误</h3>");
            }
        }

        else if(action.equals("login"))
        {
            ReturnObject rto = new ReturnObject();
            String bname = req.getParameter("bname");
            String pass = req.getParameter("pass");
            String remember = req.getParameter("remember");
            String checkvalue =req.getParameter("checkvalue");

            if(!checkvalue.equals(req.getSession().getAttribute("checkvalue")))
            {
                rto.setType(ERROR);
                rto.setMsg("验证码不正确");
                PrintWriter out = resp.getWriter();
                out.println(JSON.toJSON(rto));
                return;
            }


            String sql = "select count(*) as c from bcode where bname='"+bname+"' and pass=md5('"+pass+"')";
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
                        req.getSession().setAttribute("bname",bname);
                        PrintWriter out = resp.getWriter();

                        out.println(JSON.toJSON(rto));
                    }
                    else if(c==0)
                    {
                        rto.setType(ERROR);
                        rto.setMsg("用户名不存在或者密码不正确");
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
                out.println("<h3>错误</h3>");
            }


        }
        else if(action.equals("register"))
        {
            String bname = req.getParameter("bname");
            String pass = req.getParameter("pass");
            String rpass = req.getParameter("rpass");
            ReturnObject rto = new ReturnObject();
            try {
                if (!pass.equals(rpass)) {
                    rto.setType(ERROR);
                    rto.setMsg("两次录入验证码不一致");
                    PrintWriter out = resp.getWriter();
                    out.println(JSON.toJSON(rto));
                    return;
                }
            }
            catch(Exception e2)
                {
                    rto.setType(ERROR);
                    rto.setMsg("空？");
                    PrintWriter out = resp.getWriter();
                    out.println(JSON.toJSON(rto));
                    return;
                }
            String sql = "select count(*) as c from bcode where bname='"+bname+"'";
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




                        SQLTools.getInstance().Update("insert into bcode set bname='"+bname+"', pass=md5("+pass+")");

                        req.getSession().setAttribute("bname",bname);
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
    }
}
