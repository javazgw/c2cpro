<%--
  ~ Copyright (c) 2019.  javazgw@gmail.com
  ~
  ~
  --%>

<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/8/15
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="./../default/assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <%--<link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">--%>
    <link href="./../assets/bootstrap-combined.min.css" rel="stylesheet">
    <link href="./../default/assets/css/style.css" rel="stylesheet">


    <script src="./../default/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="./../default/assets/js/vendor/bootstrap.min.js"></script>
    <script src="./../js/ht.js"></script>
</head>
<%
String addr = request.getParameter("addr")==null?"":request.getParameter("addr");
%>
<body>
<div class="container-fluid">
    <button class="btn btn-primary" onclick="window.location.href='./index.jsp?addr=<%=addr%>'">返回故障申报</button>
    <div class="row-fluid">

        <div class="span8">
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <%--<th>--%>
                    <%--编号--%>
                    <%--</th>--%>
                    <th>
                        故障提交时间
                    </th>
                    <th>
                        描述
                    </th>

                    <th>
                        位置
                    </th>
                    <th>
                        提交人
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
                    String totalsql = "select count(*) as c from maintain where addr = '"+addr+"'order by createdate desc ";
                    request.setAttribute("pagesql",totalsql);
                    request.setAttribute("pageurl",pageurl);
                    //							String sql = "select * from gcode limit "+(curpage-1)*onepagenum+","+onepagenum;
                    String sql = "select * from maintain where addr='"+addr+"' order by createdate desc limit "+(curpage-1)*onepagenum+","+onepagenum;
                    Connection con1 = SQLTools.getInstance().getConnection();
                    Statement stmt1 = con1.createStatement();
                    ResultSet rs1 = stmt1.executeQuery(sql);

                    String linkcode = "";
                    int num = 0;
                    while (rs1.next())
                    {
                        if(num==0) {
                            linkcode = rs1.getString("linkcode");
                        }
                        num++;
                %>
                <tr  <%= rs1.getString("status").equals("待处理")?"class=\"error\"":"class=\"success\""%>>
                    <%--<td>--%>
                    <%--<%=rs1.getString("icode")%>--%>
                    <%--</td>--%>
                    <td>
                        <%=rs1.getString("createdate")%>
                    </td>
                    <td>
                        <%=rs1.getString("descript")%>
                    </td>

                    <td>
                        <%=rs1.getString("addr")%>
                    </td>
                    <td>
                        <%=rs1.getString("name")%>
                    </td>
                    <td>
                        <%=rs1.getString("status")%>
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

        </div>

        <div class="span4">

            <%

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


        <div class="row-fluid">
            <div class="span12">
                <jsp:include page='<%= "/public/page.jsp" %>' ></jsp:include>
            </div>


        </div>


    </div>

</div>


</body>


<script language="javascript" type="text/javascript">

    var host;
    function getHost(){
        if(typeof(host)=="undefined"){
            var curWwwPath=window.document.location.href;
            //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht=curWwwPath.substring(0,pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
            //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
            host =(localhostPaht+projectName);
        }
        return host;
    }

</script>
</html>
<%!
    private String oss() {
        return "http://htfa.oss-cn-shenzhen.aliyuncs.com";
    }
%>