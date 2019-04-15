<%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/4/15
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8" />
    <title>Metronic | Products</title>

    <link rel="shortcut icon" href="favicon.ico" />
    <jsp:include page="hear.jsp" flush="true"/>


</head>
<body>

<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
<!-- BEGIN HEADER -->
<jsp:include flush="true" page="./top.jsp"></jsp:include>
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"> </div>
<!-- END HEADER & CONTENT DIVIDER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <jsp:include page="./siderbar.jsp" />
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <%
        String url = request.getParameter("url");

    %>

    <%
        if (url ==null ) url = "list.jsp";

    %>
    <jsp:include page="<%= url %>" ></jsp:include>
    <!-- END CONTENT -->

</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<jsp:include flush="true" page="./footer.jsp"></jsp:include>
<!-- END FOOTER -->

</body>


</body>
</html>
