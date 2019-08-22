<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ht.c2c.tools.Encryption" %>
<%@ page import="com.ht.c2c.server.Cache" %>
<%@ page import="com.ht.c2c.dataBase.DataSet" %>
<%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/4/15
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //@// TODO: 2019/4/18  ckeditor 有bug，图片修改在背景，偶尔出不来编辑器。
    String icode = request.getParameter("icode");
    Connection con = SQLTools.getInstance().getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from maintain where icode ='"+icode+"'");
    boolean bUpdate = rs.next();


    String[] statusarray = new String[]{"待处理","短时间处理","较长时间处理","等待集中处理","处理完毕"};

//    while (rs.next())
//    {
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
                <form id="editform" class="form-horizontal form-row-seperated" >
                    <div class="portlet">
                        <%--<div class="portlet-title" hidden>--%>
                        <%--<div class="caption">--%>
                        <%--<i class="fa fa-shopping-cart"></i>Test Product </div>--%>
                        <%--<div class="actions btn-set">--%>
                        <%--<button class=" " onclick="editsubmit()">--%>

                        <%--<i class="fa fa-check"></i> Save</button>--%>
                        <%--<button class="btn btn-success" >--%>
                        <%--<i class="fa fa-check-circle"></i> Save & Continue Edit</button>--%>

                        <%--</div>--%>
                        <%--</div>--%>
                        <div class="portlet-body">
                            <div class="tabbable-bordered">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_general" data-toggle="tab"> 基本信息 </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <%--<form id="editform" class="form-horizontal form-row-seperated" >--%>
                                    <div class="tab-pane active" id="tab_general">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">申报人:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="hidden"  class="form-control" name="icode"  placeholder="" value="<%= bUpdate?"'"+rs.getString("icode")+"'":""%>">
                                                    <input type="hidden"  class="form-control" name="deeldate"  placeholder="" value="<%= "now()"%>">
                                                    <input type="text" class="form-control"  placeholder="" value="<%= bUpdate?rs.getString("name"):""%>"> </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label">信息描述:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control"  placeholder="" value="<%= bUpdate?rs.getString("descript"):""%>"> </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-2 control-label">处理结果描述:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control" name="resultdesc" placeholder="" value="<%= bUpdate?rs.getString("resultdesc"):""%>"> </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label">状态:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">



                                                <select  class="form-control form-filter input-sm" name="status">
                                                    <%

                                                        for (int i=0;i<statusarray.length;i++)
                                                        {

                                                    %>
                                                    <option value="<%=statusarray[i]%>" <%=(statusarray[i].equals(rs.getString("status")))?"selected=\"selected\"":""%>><%=statusarray[i]%></option>
                                                    <%

                                                        }
                                                    %>
                                                </select>


                                            </div>



                                            <div class="upload_box form-group">
                                                <label class="col-md-2 control-label">商品图片:
                                                    <span class="required"> * </span>
                                                </label>


                                                <%--<div id="uploadInf" class="upload_inf"></div>--%>
                                            </div>



                                        </div>
                                    </div>




                                        <div class="span4">

                                            <%
                                                String linkcode = rs.getString("linkcode");
                                                String sql2 = "select * from images where linkcode = '"+linkcode+"'";
                                                Connection con2 = SQLTools.getInstance().getConnection();
                                                Statement stmt2 = con2.createStatement();
                                                ResultSet rs2 = stmt2.executeQuery(sql2);
                                                while(rs2.next())
                                                {
                                            %>
                                            <img alt="240x240" style="height:240px;width:240px" src="<%=oss()+"/cms"+rs2.getString("imagepath")+"?x-oss-process=style/htfa"%>" />

                                            <%
                                                }

                                                rs2.close() ;
                                                stmt2.close();
                                                con2.close();
                                            %>

                                        </div>
                                    <%--</form>--%>

                                </div>

                            </div>
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
<%
    String appContext = request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + appContext;
%>

<script>

    document.addEventListener("DOMContentLoaded", function(){
        //$('.summernote').summernote();
    });
    //    var imageData=null;
    //    $('input[type=file]').on('change', function () {
    //                var reader = new FileReader();
    //                reader.onload = function (e) {
    //                    imageData=reader.result;
    //                    //console.log(reader.result);  //或者 e.target.result都是一样的，都是base64码
    //                }
    //                reader.readAsDataURL(this.files[0])
    ////filses就是input[type=file]文件列表，files[0]就是第一个文件，这里就是将选择的第一个图片文件转化为base64的码
    //            }
    //    );

    $('#save').on('click',function () {

        var formData = new FormData($('#editform')[0]);



        $.ajax({
            <%--url: '/BS?action=save&ext_tName=<%=Encryption.sampleEncodeAndDecode("maintain")%>',--%>
            url: '<%=basePath%>/BS?action=save&ext_tName=maintain',
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
<%!
    private String oss() {
        return "http://htfa.oss-cn-shenzhen.aliyuncs.com";
    }
%>

<%--<script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>--%>

