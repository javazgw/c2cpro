<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/4/17
  Time: 5:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">


        <!-- BEGIN PAGE BASE CONTENT -->
        <div class="row">
            <div class="col-md-12">

                <!-- Begin: life time stats -->
                <div class="portlet ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-shopping-cart"></i>商品列表</div>
                        <div class="actions">
                            <a href="javascript:newGoodes();" class="btn btn-circle btn-info">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-xs">新建商品</span>
                            </a>
                            <%--<div class="btn-group">--%>
                                <%--<a class="btn btn-circle btn-default dropdown-toggle" href="javascript:;" data-toggle="dropdown">--%>
                                    <%--<i class="fa fa-share"></i>--%>
                                    <%--<span class="hidden-xs"> Tools </span>--%>
                                    <%--<i class="fa fa-angle-down"></i>--%>
                                <%--</a>--%>
                                <%--<div class="dropdown-menu pull-right">--%>
                                    <%--<li>--%>
                                        <%--<a href="javascript:;"> 导出到pdf </a>--%>
                                    <%--</li>--%>

                                    <%--<li>--%>
                                        <%--<a href="javascript:;"> 打印</a>--%>
                                    <%--</li>--%>

                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-container">
                            <div class="table-actions-wrapper">
                                <span> </span>
                                <select class="table-group-action-input form-control input-inline input-small input-sm">
                                    <option value="">Select...</option>
                                    <option value="publish">Publish</option>
                                    <option value="unpublished">Un-publish</option>
                                    <option value="delete">Delete</option>
                                </select>
                                <button class="btn btn-sm btn-success table-group-action-submit">
                                    <i class="fa fa-check"></i> Submit</button>
                            </div>
                            <table class="table table-striped table-bordered table-hover table-checkable" id="datatable_products">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable"> </th>
                                    <th width="10%"> ID </th>
                                    <th width="15%"> SKU </th>
                                    <th width="15%"> 商品名称 </th>
                                    <th width="15%"> 商品大类 </th>
                                    <th width="10%"> 单价 </th>
                                    <th width="10%"> 折扣 </th>
                                    <%--<th width="15%"> imageid </th>--%>
                                    <%--<th width="10%"> desc </th>--%>
                                    <th width="10%"> 操作 </th>
                                </tr>
<%
    Connection con = SQLTools.getInstance().getConnection();
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("select * from gcode");

     while (rs.next())
     {
         String typecode=rs.getString("typecode");
         if (typecode==null)
             typecode="";
         %>
        <tr role="row" class="filter">
            <td> </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="icode" value ="<%= rs.getInt("icode")%>">  </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="gcode" value ="<%= rs.getString("gcode")%>"> </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="gname" value ="<%= rs.getString("gname")%>">
            </td>
            <td>
                <select  class="form-control form-filter input-sm" name="typecode">
                    <option value="1001" <%=(typecode.equals("1001"))?"selected=\"selected\"":""%>>电脑</option>
                    <option value="1010" <%=(typecode.equals("1010"))?"selected=\"selected\"":""%>>打印机</option>
                    <option value="1020" <%=(typecode.equals("1020"))?"selected=\"selected\"":""%>>硬盘</option>
                </select>
            </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="price" value ="<%= rs.getBigDecimal("price")%>">
            </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="discout" value ="<%= rs.getBigDecimal("discout")%>">
            </td>
            <%--<td>--%>
                <%--<input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("imagesid")%>">--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("desc")%>" >--%>
            <%--</td>--%>


                                    <td>
                                        <div class="margin-bottom-5">
                                            <button class="btn btn-sm btn-success filter-submit margin-bottom">
                                                <i class="fa fa-search"></i> 删除</button>
                                        </div>
                                        <button class="btn btn-sm btn-default filter-cancel edit" data-id="<%= rs.getString("icode")%>">
                                            <i class="fa fa-times" data-toggle="modal" data-target="#edit" ></i> 修改</button>
                                    </td>
                                </tr>

    <%
     }

     rs.close() ;
    stmt.close();
    con.close();
%>

                                </thead>
                                <tbody> </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End: life time stats -->
            </div>
        </div>
        <!-- END PAGE BASE CONTENT -->
    </div>
    <!-- END CONTENT BODY -->
</div>
<a href="#" data-toggle="modal" data-load-url="/index.jsp" data-target="#myModal">Click me</a>

<div id="myModal" class="modal fade" aria-hidden='true' data-backdrop='static'>
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">商品添加/编辑</h4>
            </div>
            <div class="modal-body">
                <p>Loading...</p>
            </div>
            <div class="modal-footer">
                <button id="close" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button  id="save" type="submit" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<a   class='edit'>Login</a>


<script>

    document.addEventListener("DOMContentLoaded", function(){



        $('.edit').on('click', function (e) {
            e.preventDefault();

            $('#myModal').modal('show').find('.modal-body').load('goodsedit.jsp?icode='+$(this).data('id'));

            // $('input[name="product[name]').val("1212")
        });

        $('#myModal').on('shown.bs.modal', function (e) {
            e.preventDefault();
          //  $('input[name="product[name]').val("12124")

        });

        $('#save').click(function(event) {

            event.preventDefault();
         //   alert("save...")
            $('#myModal').modal('hide').find('.modal-body');
        });

        $('#close').click(function(event) {

            event.preventDefault();
         //   alert("Close.....")
            $('#myModal').modal('hide').find('.modal-body');
        });
    });

    function newGoodes() {
        $('#myModal').modal('show').find('.modal-body').load('goodsedit.jsp?icode=0');
    }

</script>