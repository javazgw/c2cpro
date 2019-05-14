<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/4/15
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->

        <%
            String openurl = request.getParameter("url");
            if (openurl ==null ) openurl = "list.jsp";
            System.out.println("openurl = "+openurl);
            LinkedHashMap<String,String> ht = new LinkedHashMap<String,String>();
            ht.put("商品","");
            ht.put("仪表盘","list.jsp");

            ht.put("订单","list.jsp");
            ht.put("商品类型","gtypelist.jsp");
            ht.put("产品管理","goodslist.jsp");
            ht.put("产品编辑","edit.jsp");
            ht.put("产品编辑","edit.jsp");



            ht.put("客户管理","");
            ht.put("客户列表","ccode.jsp");

            ht.put("后台操作","");
            ht.put("后台人员管理","bcode.jsp");
            ht.put("设置","list.jsp");


        %>
        <ul class="page-sidebar-menu   " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">

            <li class="heading">
                <h3 class="uppercase">菜单</h3>
            </li>

            <%

               //Set<String> enumeration =  ht.keySet();
                boolean hasarrow  =false;
                boolean isopenfirst = true;

                for(String key :ht.keySet())
               {

                    String url = ht.get(key);
                    System.out.println(key+"--"+url+"-"+openurl);
                    if("".equals(url))
                    {

                        if(hasarrow)
                        {
                            %>
                            </ul>
                             </li>
                            <%
                        }
                        //else
                       // {
                            %>
                    <%--<li class="nav-item  active <%= isopenfirst?"open":""%>">--%>
                    <li class="nav-item  active open">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-basket"></i>
                            <span class="title"><%= key%></span>
                            <span class="selected"></span>
                            <span class="arrow <%= isopenfirst?" open":""%>"></span>
                        </a>
                    <%--<ul class="sub-menu"  style="display: <%= (openurl.equals(url)?"block":"none")%>;">--%>
                    <ul class="sub-menu"  style="display: block;">

                            <%
                       // }
                        hasarrow = true;
                        isopenfirst=false;

                    }
                    else
                    {
                        %>
                        <li class="nav-item   <%= (openurl.equals(ht.get(key))?"active open":"")%>">
                        <%--<li class="nav-item   active open">--%>
                            <a href="main.jsp?url=<%= ht.get(key)%>" class="nav-link ">
                                <i class="icon-home"></i>
                                <span class="title"><%= key%></span>
                                <%= (openurl.equals(ht.get(key))?"<span class=\"selected\"></span>":"")%>

                            </a>
                        </li>
                        <%
                    }
               }

               %>

                    </ul>
                    </li>

                        <%
            %>

         <%--  <li class="nav-item  active open">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-basket"></i>
                    <span class="title">eCommerce</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="main.jsp?url=list.jsp" class="nav-link ">
                            <i class="icon-home"></i>
                            <span class="title">仪表盘</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="main.jsp?url=list.jsp" class="nav-link ">
                            <i class="icon-basket"></i>
                            <span class="title">订单</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="main.jsp?url=gtypelist.jsp" class="nav-link ">
                            <i class="icon-tag"></i>
                            <span class="title">商品类型</span>
                        </a>
                    </li>
                    <li class="nav-item  active open">
                        <a href="main.jsp?url=goodslist.jsp" class="nav-link ">
                            <i class="icon-graph"></i>
                            <span class="title">产品管理</span>
                            <span class="selected"></span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="main.jsp?url=edit.jsp" class="nav-link ">
                            <i class="icon-graph"></i>
                            <span class="title">产品编辑</span>
                        </a>
                    </li>
                </ul>
            </li>--%>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>