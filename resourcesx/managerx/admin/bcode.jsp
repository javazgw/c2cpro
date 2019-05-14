<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ht.c2c.dataBase.DataSet" %>
<%@ page import="com.ht.c2c.server.Cache" %><%--
  ~ Copyright (c) 2019.  javazgw@gmail.com
  ~
  ~
  --%>

<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/5/14
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //分页配置 改变 1。pageurl，2。表的totalsql 2。sql 的表名
    String pageurl = "main.jsp?url=bcode.jsp";
    String totalsql = "select count(*) as c from bcode ";
    request.setAttribute("pagesql",totalsql);
    request.setAttribute("pageurl",pageurl);
    int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
    int onepagenum=request.getParameter("onepagenum")==null?12:Integer.parseInt(request.getParameter("onepagenum"));;
    String sql = "select * from bcode limit "+(curpage-1)*onepagenum+","+onepagenum;

%>
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
                            <i class="fa fa-shopping-cart"></i>客户列表</div>

                    </div>
                    <div class="portlet-body">
                        <div class="table-container">

                            <table class="table table-striped1 table-bordered table-hover table-checkable" id="datatable_products">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable"> </th>
                                    <th width="10%"> ID </th>
                                    <th width="10%"> 编码 </th>
                                    <th width="10%"> 名称 </th>
                                    <th width="10%"> 别称 </th>
                                    <th width="10%"> 邮箱 </th>
                                    <th width="10%"> 最后登陆时间 </th>

                                    <th width="15%"> 头像 </th>
                                    <th width="10%"> 状态 </th>
                                    <th width="10%"> 操作 </th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Connection con = SQLTools.getInstance().getConnection();
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(sql);
                                    //分页


                                    while (rs.next())
                                    {
                                        String bcode=rs.getString("bcode");
                                        if (bcode==null)
                                            bcode="";
                                %>
                                <tr role="row" class="filter">
                                    <td> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="icode" value ="<%= rs.getInt("icode")%>">  </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="bcode" value ="<%= bcode%>"> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="bname" value ="<%= rs.getString("bname")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="nakename" value ="<%= rs.getString("nakename")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="price" value ="<%= rs.getString("email")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="discout" value ="<%= rs.getString("lastlogindate")%>">
                                    </td>


                                    <td>
                                        <input   type="image" src=<%=rs.getString("avatarimage")%> width="80px" height="80px" >

                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="discout" value ="<%= rs.getString("isban")%>">
                                    </td>
                                    <%--<td>--%>
                                    <%--<input type="text" class="form-control form-filter input-sm" name="product_id" value ="<%= rs.getString("desc")%>" >--%>
                                    <%--</td>--%>

                                    <td>
                                        <div class="margin-bottom-5">
                                            <button class="btn btn-sm btn-success filter-submit margin-bottom">
                                                <i class="fa fa-search"></i> 删除</button>
                                            <%--<button class="btn btn-sm btn-default filter-cancel edit" data-id="<%= rs.getString("icode")%>">--%>
                                            <%--<i class="fa fa-times" data-toggle="modal" data-target="#edit" ></i> 修改</button>--%>
                                        </div>

                                    </td>
                                </tr>

                                <%
                                    }

                                    rs.close() ;
                                    stmt.close();
                                    con.close();
                                %>
                                </tbody>
                            </table>

                            <jsp:include page='<%= "/public/page.jsp" %>' ></jsp:include>

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




<script>




</script>
