<%--
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
        <ul class="page-sidebar-menu   " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">

            <li class="heading">
                <h3 class="uppercase">Pages</h3>
            </li>
            <li class="nav-item  active open">
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
                        <a href="main.jsp?url=list.jsp" class="nav-link ">
                            <i class="icon-tag"></i>
                            <span class="title">订单列表</span>
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
            </li>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>