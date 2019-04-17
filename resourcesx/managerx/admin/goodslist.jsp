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
                            <i class="fa fa-shopping-cart"></i>Order Listing </div>
                        <div class="actions">
                            <a href="javascript:;" class="btn btn-circle btn-info">
                                <i class="fa fa-plus"></i>
                                <span class="hidden-xs"> New Order </span>
                            </a>
                            <div class="btn-group">
                                <a class="btn btn-circle btn-default dropdown-toggle" href="javascript:;" data-toggle="dropdown">
                                    <i class="fa fa-share"></i>
                                    <span class="hidden-xs"> Tools </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <div class="dropdown-menu pull-right">
                                    <li>
                                        <a href="javascript:;"> 导出到pdf </a>
                                    </li>

                                    <li>
                                        <a href="javascript:;"> 打印</a>
                                    </li>

                                </div>
                            </div>
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
                                    <th width="10%"> icode </th>
                                    <th width="15%"> gcode </th>
                                    <th width="15%"> gname </th>
                                    <th width="10%"> price </th>
                                    <th width="10%"> discout </th>
                                    <th width="15%"> imageid </th>
                                    <th width="10%"> desc </th>
                                    <th width="10%"> Actions </th>
                                </tr>
<%
    Connection con = SQLTools.getInstance().getConnection();
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("select * from gcode");

     while (rs.next())
     {
         %>
        <tr role="row" class="filter">
                                    <td> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getInt("icode")%>">  </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="product_name" value ="<%= rs.getString("gcode")%>"> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("gname")%>">
                                    </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getBigDecimal("price")%>">
            </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getBigDecimal("discout")%>">
            </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("imagesid")%>">
            </td>
            <td>
                <input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("desc")%>" >
            </td>


                                    <td>
                                        <div class="margin-bottom-5">
                                            <button class="btn btn-sm btn-success filter-submit margin-bottom">
                                                <i class="fa fa-search"></i> 删除</button>
                                        </div>
                                        <button class="btn btn-sm btn-default filter-cancel">
                                            <i class="fa fa-times" data-toggle="modal" data-target="#myModal"></i> 修改</button>
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

<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Event</h4>
            </div>
            <div class="modal-body">
                <p>Loading...</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<a  href='/site/login' class='ls-modal'>Login</a>