<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/6/11
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修单列表</title>
    <link href="/default/assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="/default/assets/css/style.css" rel="stylesheet">
    <script src="/default/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="/default/assets/js/vendor/bootstrap.min.js"></script>

</head>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <th>
                        编号
                    </th>
                    <th>
                        描述
                    </th>
                    <th>
                        故障提交时间
                    </th>
                    <th>
                        状态
                    </th>
                </tr>
                </thead>
                <tbody>
<%
                int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
                int onepagenum=request.getParameter("onepagenum")==null?12:Integer.parseInt(request.getParameter("onepagenum"));;
                String pageurl = "maintainlist.jsp?1=1";
                String totalsql = "select count(*) as c from gcode ";
                request.setAttribute("pagesql",totalsql);
                request.setAttribute("pageurl",pageurl);
                //							String sql = "select * from gcode limit "+(curpage-1)*onepagenum+","+onepagenum;
                String sql = "select * from gcode  limit "+(curpage-1)*onepagenum+","+onepagenum;
                Connection con1 = SQLTools.getInstance().getConnection();
                Statement stmt1 = con1.createStatement();
                ResultSet rs1 = stmt1.executeQuery(sql);

                while (rs1.next())
                {

                %>
                <tr>
                    <td>
                        1
                    </td>
                    <td>
                        监控画面没显示
                    </td>
                    <td>
                        01/04/2019
                    </td>
                    <td>
                        Default
                    </td>
                </tr>
                <%--<tr class="success">
                    <td>
                        1
                    </td>
                    <td>
                        TB - Monthly
                    </td>
                    <td>
                        01/04/2012
                    </td>
                    <td>
                        Approved
                    </td>
                </tr>
                <tr class="error">
                    <td>
                        2
                    </td>
                    <td>
                        TB - Monthly
                    </td>
                    <td>
                        02/04/2012
                    </td>
                    <td>
                        Declined
                    </td>
                </tr>
                <tr class="warning">
                    <td>
                        3
                    </td>
                    <td>
                        TB - Monthly
                    </td>
                    <td>
                        03/04/2012
                    </td>
                    <td>
                        Pending
                    </td>
                </tr>
                <tr class="info">
                    <td>
                        4
                    </td>
                    <td>
                        TB - Monthly
                    </td>
                    <td>
                        04/04/2012
                    </td>
                    <td>
                        Call in to confirm
                    </td>--%>
                </tr>
<%
    }
    rs1.close() ;
    stmt1.close();
    con1.close();
%>
                </tbody>
            </table>
            <div class="row-fluid">
                <div class="span12">
                    <jsp:include page='<%= "/public/page.jsp" %>' ></jsp:include>
                </div>
            </div>
        </div>

    </div>

</div>


</body>
</html>
