<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/4/15
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//@// TODO: 2019/4/18  ckeditor 有bug，图片修改在背景，偶尔出不来编辑器。
    String gcode = request.getParameter("gcode");
    System.out.println(gcode);
    Connection con = SQLTools.getInstance().getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from gcode where gcode ="+gcode);

    while (rs.next())
    {

%>
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="">
        <!-- BEGIN PAGE HEAD-->

        <!-- END PAGE HEAD-->
        <!-- BEGIN PAGE BREADCRUMB -->
        <!-- END PAGE BREADCRUMB -->
        <!-- BEGIN PAGE BASE CONTENT -->
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
                                        <a href="#tab_general" data-toggle="tab"> General </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_general">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Name:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="hidden"  class="form-control" name="icode"  placeholder="" value="<%= rs.getString("icode")%>">



                                                <input type="text" class="form-control" name="gname" placeholder="" value="<%= rs.getString("gname")%>"> </div>
                                            </div>




                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Price:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control" name="price" placeholder="" value="<%= rs.getBigDecimal("price")%>" > </div>
                                            </div>

                                            <%--<div class="form-group">--%>
                                                <%--<label class="col-md-2 control-label">商品描述:--%>
                                                    <%--<span class="required"> * </span>--%>
                                                <%--</label>--%>


                                                <%--<div class="col-md-10">--%>
                                                    <%--<textarea class="ckeditor form-control" name="desc" rows="6">--%>
                                                        <%--<%= rs.getString("desc")%>--%>

                                                    <%--</textarea>--%>
                                                <%--</div>--%>


                                            <%--</div>--%>




                                            <div class="form-group">
                                                <label class="col-md-2 control-label">note:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">



                                                    <a class="summernote" name="descript" rows="6"  onupdated="$('#summernote').summernote('code', this.data.value);">
                                                    <%= rs.getString("descript")%>

                                                    </a>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-md-2 control-label">note:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                     <textarea><%= rs.getString("descript")%>
</textarea>

                                                    </textarea>
                                                </div>
                                            </div>








                                        </div>
                                    </div>

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
    }

    rs.close() ;
    stmt.close();
    con.close();
%>
<script>

    document.addEventListener("DOMContentLoaded", function(){
        $('.editsubmit').on('click',function (){
            // $('#editform').submit(function () {
            // $(this).ajaxSubmit(function () {
            //     $('#output2').html("提交成功！欢迎下次再来！").show();
            // });

            $.post( '/BS?action=save', $('#editform').serialize(), function(data) {

                    },
                    'json' // I expect a JSON response
            );
            // return false; //阻止表单默认提交
            // });
        });
        //$('.summernote').summernote();
    });

    $('#editsubmit').on('click',function (){
        // $('#editform').submit(function () {
        // $(this).ajaxSubmit(function () {
        //     $('#output2').html("提交成功！欢迎下次再来！").show();
        // });

        $.post( '/BS?action=save', $('#editform').serialize(), function(data) {

                },
                'json' // I expect a JSON response
        );
        // return false; //阻止表单默认提交
        // });
    });

   // $('.summernote').summernote();

    tinymce.init({ selector:'textarea' });

</script>
<%--<script src="../assets/global/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>--%>

<%--<script src="../assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>--%>

