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
    String q_ordercode = request.getParameter("ordercode")==null?"":request.getParameter("ordercode");
    String q_orderdatefrom = request.getParameter("orderdatefrom")==null?"":request.getParameter("orderdatefrom");
    String q_orderdateto = request.getParameter("orderdateto")==null?"":request.getParameter("orderdateto");
    String q_buyer = request.getParameter("buyer")==null?"":request.getParameter("buyer");
    String q_addr = request.getParameter("addr")==null?"":request.getParameter("addr");
    String q_status = request.getParameter("status")==null?"":request.getParameter("status");





    //分页配置 改变 1。pageurl，2。表的totalsql 2。sql 的表名
    String pageurl = "main.jsp?url=order.jsp";
    String totalsql = "select count(*) as c from orderlist ";

    int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
    int onepagenum=request.getParameter("onepagenum")==null?12:Integer.parseInt(request.getParameter("onepagenum"));;
    //String sql = "select * from orderlist limit "+(curpage-1)*onepagenum+","+onepagenum;
    String sql = "";
    sql = "select * from orderlist  where 1=1 and ordercode like '%"+q_ordercode+"%' and orderdate between '"+q_orderdatefrom+"' and '"+q_orderdateto+"' and " +
            " cname like '"+q_buyer+"' and addr like '"+q_addr +"' and status='"+q_status+"'  ";

    totalsql = "select count(*) as c from ("+sql+") as a ;";

    //sql = sql + " limit "+(curpage-1)*onepagenum+ ","+onepagenum;

    request.setAttribute("pagesql",totalsql);
    request.setAttribute("pageurl",pageurl);

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
                            <i class="fa fa-shopping-cart"></i>订单列表</div>

                    </div>


                    <div class="table-responsive"><table class="table table-striped table-bordered table-hover table-checkable dataTable no-footer" id="datatable_orders"
                          aria-describedby="datatable_orders_info" role="grid">
                        <thead>
                        <tr role="row" class="heading"><th width="2%" class="sorting_disabled" rowspan="1" colspan="1">
                            <div class="checker"><span><input type="checkbox" class="group-checkable"></span></div> </th>
                            <th width="5%" class="sorting"
                             tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> 订单编号&nbsp;# </th>
                            <th width="15%" class="sorting" tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> 购买日期 </th>
                            <th width="15%" class="sorting" tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> 购买方/电话 </th>
                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> 送货地址 </th>

                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> 状态 </th>
                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_orders" rowspan="1" colspan="1"> Actions </th></tr>
                        <tr role="row" class="filter"><td rowspan="1" colspan="1"> </td><td rowspan="1" colspan="1">
                            <input type="text" class="form-control form-filter input-sm" name="order_id"> </td><td rowspan="1" colspan="1">
                            <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
                                <input type="text" class="form-control form-filter input-sm" readonly="" name="order_date_from" id="order_date_from" placeholder="从">
                                <span class="input-group-btn">
                                                                <button class="btn btn-sm default" type="button">
                                                                    <i class="fa fa-calendar"></i>
                                                                </button>
                                                            </span>
                            </div>
                            <div class="input-group date date-picker" data-date-format="dd/mm/yyyy">
                                <input type="text" class="form-control form-filter input-sm" readonly="" name="order_date_to" id="order_date_to" placeholder="到">
                                <span class="input-group-btn">
                                                                <button class="btn btn-sm default" type="button">
                                                                    <i class="fa fa-calendar"></i>
                                                                </button>
                                                            </span>
                            </div>
                        </td><td rowspan="1" colspan="1">
                            <input type="text" class="form-control form-filter input-sm" name="order_customer_name"> </td><td rowspan="1" colspan="1">
                            <input type="text" class="form-control form-filter input-sm" name="order_ship_to"> </td>
                    <td rowspan="1" colspan="1">
                            <select name="order_status" class="form-control form-filter input-sm">
                                <option value="%">全部</option>
                                <option value="pending">备货</option>
                                <option value="ship">发货</option>
                                <option value="Billing">开票</option>
                                <option value="RG">退货</option>
                                <option value="EG">换货</option>
                                <option value="Refund">退款</option>
                            </select>
                        </td><td rowspan="1" colspan="1">
                            <div class="margin-bottom-5">
                                <button class="btn btn-sm btn-success filter-submit margin-bottom" id="search">
                                    <i class="fa fa-search" ></i> 查询</button>
                            </div>
                            <button class="btn btn-sm btn-default filter-cancel">
                                <i class="fa fa-times"></i> 重置查询</button>
                        </td></tr>
                        </thead>
                        <tbody> </tbody>
                    </table></div>








                    <div class="portlet-body">
                        <div class="table-container">

                            <table class="table table-striped1 table-bordered table-hover table-checkable" id="datatable_products">
                                <thead>
                                <tr role="row" class="heading">
                                    <th width="1%">
                                        <input type="checkbox" class="group-checkable"> </th>
                                    <th width="10%"> ID </th>
                                    <th width="15%"> 编码 </th>
                                    <th width="15%"> 名称 </th>
                                    <th width="15%"> 单价 </th>
                                    <th width="10%"> 数量 </th>

                                    <th width="15%"> 下单日期 </th>
                                    <th width="10%"> 联系人 </th>
                                    <th width="10%"> 电话 </th>
                                    <th width="10%"> 地址 </th>
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
                                        String ordercode=rs.getString("ordercode");
                                        if (ordercode==null)
                                            ordercode="";
                                %>
                                <tr role="row" class="filter">
                                    <td> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="icode" value ="<%= rs.getInt("icode")%>">  </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="ordercode" value ="<%= ordercode%>"> </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="gcode" value ="<%= rs.getString("gcode")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="gname" value ="<%= rs.getString("gname")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="price" value ="<%= rs.getString("price")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="num" value ="<%= rs.getString("num")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="ccode" value ="<%= rs.getString("ccode")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="cname" value ="<%= rs.getString("cname")%>">
                                    </td>
                                      <td>
                                        <input type="text" class="form-control form-filter input-sm" name="cname" value ="<%= rs.getString("addr")%>">
                                    </td>
                                      <td>
                                        <input type="text" class="form-control form-filter input-sm" name="tel" value ="<%= rs.getString("tel")%>">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-filter input-sm" name="orderdate" value ="<%= rs.getString("orderdate")%>">
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
    document.addEventListener("DOMContentLoaded", function() {

        //$('#order_date_from').datetimepicker();
        $('#search').on('click', function (e) {
            e.preventDefault();




            window.location.href = "./main.jsp?url=order.jsp?1=1&ordercode=1&orderdatefrom=2019-01-01&orderdateto=2019-09-09&buyer=zgw庄光旺&addr=广东&status=1";
        });
    });



</script>
