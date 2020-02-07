package com.ht.c2c.server;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.c2c.tools.SQLTools;
import com.ht.c2c.websocket.WebSocketObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileCleaningTracker;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.UUID;

/**
 * 文件上传,使用bootystap 的fileinput ,其他上传也行
 * 如果是fileinput 进行上传有可能提供额外的参数,模拟form 的提交.格式如下
 * 字段名的标志以HT 开头,HTtable 和HTicode 属于关键字,表名和icode 主键,其他是字段名称
 * 目前只能String, Data,number 类型是支持的.扩展uploadExtraData 不是必须的
 * 注意上传里如果存在icode 就是update,如果不存在icode 就是insert
 * 注意修改的你必须上传icode,否则你想想后果

 *  uploadExtraData: function() {  // callback example
 *             var out = {}, key, i = 0;
 *
 *             out["HTname"] =  $("#name").val();
 *             out["HTdescript"] =  $("#desc").val();
 *
 *             out["HTicode"] = "123";
 *             out["HTtable"] = "maintain";
 *
 *             return out;
 *         }
 */
@WebServlet("/up")
public class FileUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private File fileUploadPath;
    private static final String fileDirectory = File.separator+"uploaddata";

    public void init() {
        System.out.println("init upload");
        String realPath = this.getServletConfig().getServletContext().getRealPath("/");
        fileUploadPath = new File(realPath + fileDirectory);
        if (!fileUploadPath.exists()) {
            boolean isCreate = fileUploadPath.mkdirs();
            if (isCreate) {
                System.out.println("文件夹己被创建");
            }
        }
    }
    private DiskFileItemFactory newDiskFileItemFactory(ServletContext context, File repository) {
        FileCleaningTracker fileCleaningTracker = FileCleanerCleanup.getFileCleaningTracker(context);
        DiskFileItemFactory factory = new DiskFileItemFactory(DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD, repository);
        factory.setFileCleaningTracker(fileCleaningTracker);
        return factory;
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("init upload");
         Hashtable<String,String> tableht = new Hashtable<String,String>();
         ArrayList<String> arrayList = new ArrayList<>();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            DiskFileItemFactory factory = newDiskFileItemFactory(servletContext, repository);

            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("utf-8");

            PrintWriter printWriter = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            request.setCharacterEncoding("UTF-8");
            JSONArray files = new JSONArray();
            try {
                List<FileItem> items = upload.parseRequest(request);
                for (FileItem item : items) {
                    if (item.isFormField()) { //表单输入域
                        System.out.println(item.getFieldName()+"="+item.getString("utf-8"));
                        if(item.getFieldName().startsWith("HT"))
                        {
                            tableht.put(item.getFieldName(),item.getString("utf-8"));
                        }
                    } else { // 文件上传域
                        String name = UUID.randomUUID()+item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());//item.getName();
                        if (!name.equals("")) {
                            int index = name.indexOf("\\");
                            File uploadedFile;
                            if (index == -1) {
                                uploadedFile = new File(fileUploadPath,
                                        File.separator + name);
                            } else {

                                uploadedFile = new File(fileUploadPath, File.separator + name.substring(name.lastIndexOf(File.separator) + 1));
                            }
                            arrayList.add(uploadedFile.getPath().substring(uploadedFile.getPath().indexOf(fileDirectory)));
                            item.write(uploadedFile);
                            JSONObject file = new JSONObject();
                            file.put("name", name);
                            file.put("size", item.getSize());
                            String url = request.getScheme() + "://"+request.getServerName() + ":" + request.getServerPort() + fileDirectory;


                            url+=File.separator+name;
                            //win 的路径 要转换 否则再数据库的json 又发生错误

                            url = url.replaceAll("\\\\","/");
                            file.put("url", url);
                            file.put("deleteType", "post");
                            files.add(file);
                        } else {
                            JSONObject file = new JSONObject();
                            file.put("result", "please choose a file");
                            files.add(file);
                        }
                    }
                }
            //插入表单提交的信息到数据库
                if(tableht.size()>0) {
                    insertIntoDB(tableht,arrayList);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                JSONObject result = new JSONObject();
                result.put("files", files);
                printWriter.write(result.toString());
                printWriter.close();
            }
        }
    }

    /**
     * ht 里要有HTicode
     * @param ht
     * @throws Exception
     */
    public void insertIntoDB(Hashtable<String,String> ht,ArrayList<String> arrayList) throws Exception {
        boolean firemaintain = false;
        String linkcode = ht.get("HTicode");//UUID.randomUUID().toString();
        //replace into tbl_name(col_name, ...) values(...)
            String sql = "replace into " +ht.get("HTtable")+" ( ";
            String values=" values (";
            for(String key  : ht.keySet())

            {
                if(key.startsWith("HT"))
                {
                    String str = key.substring(key.indexOf("HT")+2);
                    if(str.trim().equals("table"))
                    {
                        //特殊处理maintain表,触发长连接

                        if(ht.get(key).trim().equals("maintain"))
                        {


                            firemaintain = true;

                        }
                        continue;
                    }
                    else
                    {
                        sql += str +",";
                        values +="'"+ht.get(key).replaceAll("'","''")+"',";
                    }
                }
            }
        sql += "linkcode";
            values +="'"+linkcode+"'";
       // sql = sql.substring(0,sql.length()-1);
        //values =values.substring(0,values.length()-1);
        sql +=")";
        values +=")";
        sql =sql+ values;


        SQLTools.getInstance().Update(sql);


        for(String path:arrayList)
        {
            String imagesql = "insert into images (linkcode,imagepath) values('"+linkcode+"','"+path+"')";
            SQLTools.getInstance().Update(imagesql);
        }
        //触发维单
        if(firemaintain)
        {
            WebSocketObject.getInstance().fireWorkspaceChanged();
        }


    }

}
