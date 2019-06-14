<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ht.c2c.tools.Encryption" %><%--
  ~ Copyright (c) 2019.  javazgw@gmail.com
  ~
  ~
  --%>

<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/6/14
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%

    String icode = request.getParameter("icode");
    Connection con = SQLTools.getInstance().getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from cms where icode = '" + icode+"'");
    boolean bUpdate = rs.next();

%>


<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="">
        <!-- BEGIN PAGE HEAD-->

        <!-- END PAGE HEAD-->
        <!-- BEGIN PAGE BREADCRUMB -->
        <!-- END PAGE BREADCRUMB -->
        <!-- BEGIN PAGE BASE CONTENT enctype ="multipart/form-data"-->
        <div class="row">
            <div class="col-md-12">
                <form id="editform" class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="title">标题</label>
                        <div class="controls">
                            <input type="hidden"  class="form-control" name="icode"  placeholder="" value="<%= bUpdate?rs.getString("icode"):""%>">
                            <input id="title" name = "title" type="text" value="<%=rs.getString("title")%>"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="user">作者</label>
                        <div class="controls">
                            <input id="user" name = "user" type="text" value="<%=rs.getString("user")%>"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="type">分类</label>
                        <div class="controls">
                            <input id="type" name = "type" type="text" value="<%=rs.getString("type")%>" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="ckeditor">内容</label>
                        <div class="controls">
                       <textarea class="ckeditor form-control" id="ckeditor" name="descript" rows="6">
                        <%= rs.getString("descript")%>
                        </textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label class="checkbox"><input type="checkbox" /> Remember me</label> <button type="submit" class="btn">登陆</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- END PAGE BASE CONTENT -->
    </div>
    <!-- END CONTENT BODY -->
</div>
<%
    //    }

    rs.close() ;
    stmt.close();
    con.close();
%>

<script src="../assets/global/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>

<script>
    var CKEditor = CKEDITOR.replace('ckeditor');
    console.log("CKEditor status ="+CKEditor.status);

    $('#save').on('click',function () {

        var formData = new FormData($('#editform')[0]);

        formData.set("descript",CKEditor.getData());

        // var imageblob =$('#uploadImage_0').attr("src");
        // formData.set("image",imageblob);
        //console.log("formData gname="+formData.get("gname"));
        if (formData.get("title")==null || "" == formData.get("title").trim()){
            alert("标题不能为空！");
            return;
        }

        $.ajax({
            url: '/BS?action=save&ext_tName=<%=Encryption.sampleEncodeAndDecode("cms")%>',
            type: 'POST',
            data: formData,
            dataType: 'JSON',
            cache: false,
            processData: false,
            contentType: false
        }).done(function(ret){
            console.log(ret);
        });

    });
</script>
</html>
