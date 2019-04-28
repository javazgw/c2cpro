package com.ht.c2c.server;

import com.ht.c2c.tools.Configure;
import com.ht.c2c.tools.Encryption;
import com.ht.c2c.tools.SQLTools;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;
import java.util.List;

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
        if (!ServletFileUpload.isMultipartContent(req)) {
            resp.setContentType("text/html");
        }
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
        else {
            if (action.equals("save")) {
                resp.setContentType("text/html");
                String tableName = req.getParameter("ext_tName");
                if (tableName==null)
                    return;
                tableName = Encryption.sampleEncodeAndDecode(tableName);

//                String table = req.getParameter("tb");
                String icode = req.getParameter("icode");
                ArrayList<String> paramList = new ArrayList<String>();
                String updatesql = "update " + tableName;
                String inserttsql = "insert into " + tableName;
                StringBuffer sql = new StringBuffer();
                StringBuffer iSqlCol = new StringBuffer();
                StringBuffer iSqlVal = new StringBuffer();
                sql.append(" set ");
                 if (ServletFileUpload.isMultipartContent(req)){
                    // 配置上传参数
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
                    factory.setSizeThreshold(1024*1204*3);
                    // 设置临时存储目录
                    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    // 设置最大文件上传值
                    upload.setFileSizeMax(1024*1024*10);
                    // 设置最大请求值 (包含文件和表单数据)
                    upload.setSizeMax(1024*1024*50);

                    try {
                        List<FileItem> formItems = upload.parseRequest(req);

                        if (formItems != null && formItems.size() > 0) {
                            // 迭代表单数据
                            for (FileItem item : formItems) {
                                String key = item.getFieldName();
                                if (key.equals("action") || key.startsWith("ext_")) {
                                    continue;
                                }else if (key.equals("icode")){
                                    icode = item.getString("utf-8");
                                    continue;
                                }

                                System.out.println("key="+key+" data="+item.getString("utf-8"));
                                // 处理不在表单中的字段
                                if (!item.isFormField()) {
                                    String fileNmae = item.getName();
                                    // 保存文件到硬盘
                                    byte[] fileData = item.get();
                                   // System.out.println("fileNmae="+fileNmae+" data="+new String(fileData));
                                    //paramList.add(new String(fileData));
                                    if (fileNmae != null) {
                                        sql.append(key + "path=?,");
                                        paramList.add(fileNmae);
                                        iSqlCol.append(key + "path,");
                                        iSqlVal.append("?,");
                                    }
                                }else{
                                    sql.append(key);
                                    sql.append("=?,");
                                    iSqlCol.append(key+",");
                                    iSqlVal.append("?,");
                                    //sql.append(req.getParameter(key).replaceAll(",", "'"));
                                    //sql.append("',");
                                    paramList.add(item.getString("utf-8"));
                                }
                            }
                        }
                    }catch (Exception e) {
                        Configure.log("" + e.getMessage());
                        PrintWriter out = resp.getWriter();
                        out.println("<h3>文件保存失败！</h3>");
                    }
                }else{
                     Enumeration<String> paramekeys = req.getParameterNames();
                     //update gcode set gname ='xiaomi2'  where icode =''
                     while (paramekeys.hasMoreElements()) {
                         String key = paramekeys.nextElement();
                         if (key.equals("icode") || key.equals("action") || key.startsWith("ext_"))
                             continue;
                         sql.append(key);
                         sql.append("=?,");
                         iSqlCol.append(key+",");
                         iSqlVal.append("?,");
                         //sql.append(req.getParameter(key).replaceAll(",", "'"));
                         //sql.append("',");
                         paramList.add(req.getParameter(key));
                     }
                }

                if (icode != null && !icode.trim().equals("")) {
                    updatesql = updatesql + sql;
                    updatesql = updatesql.substring(0, updatesql.length() - 1);
                    updatesql = updatesql + " where icode =" + icode;
                }else{
                    inserttsql = inserttsql + "("+iSqlCol;
                    inserttsql = inserttsql.substring(0, inserttsql.length() - 1)+")";
                    inserttsql = inserttsql + " value ("+iSqlVal;
                    inserttsql = inserttsql.substring(0, inserttsql.length() - 1)+")";
                    updatesql = inserttsql;
                }
             //   System.out.println("updatesql="+updatesql);
                try {
                    SQLTools.getInstance().Update(updatesql,paramList.toArray());
                } catch (Exception e) {
                    Configure.log("" + e.getMessage());
                }
            }
        }
    }

}
