<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="com.ht.c2c.dataBase.DataSet" %><%--
  ~ Copyright (c) 2019.  javazgw@gmail.com
  ~
  ~
  --%>

<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/4/23
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    /**
     *
     * 要传递 pagesql  request.setAttribute("totalsql",totalsql);totalsql 计算数据总数的sql语句
     * 要传递 pageurl   request.setAttribute("pageurl",pageurl); pageurl 一般是当前页面
     *
     * 譬如 String pageurl = "index3.jsp?1=1";
     * 									String totalsql = "select count(*) as c from gcode where gname REGEXP '"+searchstr+"'";
     * 									request.setAttribute("pagesql",totalsql);
     * 									request.setAttribute("pageurl",pageurl);
     *
     * 要在数据查询结束后加入此语句  因为要等待setAttribute
     * <jsp:include page='< %= "/public/page.jsp" % >' ></jsp:include>
     */




   // String pagesql =request.getParameter("sql")==null?"":request.getParameter("sql");
    String  pagesql = request.getAttribute("pagesql")+"";
    //pagesql = java.net.URLDecoder.decode(pagesql,"utf-8");
    //System.out.println("pagesql = "+pagesql);
    //String url = request.getParameter("pageurl")==null?"":request.getParameter("pageurl");
    String url = request.getAttribute("pageurl")+"";

    int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
    int totalpagenum ,onepagenum=12,itemnum;
    String searchstr = request.getParameter("searchstr");

    DataSet ds = SQLTools.getInstance().query(pagesql);
    itemnum = Integer.parseInt(ds.getValue(0,"c"));
    totalpagenum = itemnum/onepagenum+ ((itemnum%onepagenum==0)?0:1);

%>

<div class="products-settings-option d-block d-md-flex">
    <nav class="page-pagination">
        <ul class="pagination">
            <li>
                <a href="<%= url+"&curpage="+1+"&onepagenum="+onepagenum%><% if(!(request.getParameter("searchstr")==null)){%><%= "&searchstr="+searchstr%> <%}%>" >第一页</a>
            </li>
            <li>
                <a href="<%= url+"&curpage="+((curpage-1)<=1?1:curpage-1)+"&onepagenum="+onepagenum %><% if(!(request.getParameter("searchstr")==null)){%><%="&searchstr="+searchstr%> <%}%>" aria-label="Previous">&laquo;</a>
            </li>

<%
    boolean isnoshow =false;
    for(int i=1;i<=totalpagenum;i++){

        if(totalpagenum>6)
        {
            if((curpage-2>i || curpage+2 <i ) )
            {
                if(!isnoshow)
                {
                %>
            <li>
                <a >.....</a>
            </li>
            <%
                isnoshow = true;
                }
            }
            else
            {
                isnoshow = false;
            %>
            <li>
                <a <%= curpage==i?"class=\"current\"":"" %> href="<%= url+"&curpage="+i+"&onepagenum="+onepagenum %><% if(!(request.getParameter("searchstr")==null)){%><%= "&searchstr="+searchstr%> <%}%>"><%= i%></a>
            </li>
            <%

            }
        }
        else
            {

%>
            <li>
                <a <%= curpage==i?"class=\"current\"":"" %> href="<%= url+"&curpage="+i+"&onepagenum="+onepagenum%><% if(!(request.getParameter("searchstr")==null)){%><%= "&searchstr="+searchstr%> <%}%>"><%= i%></a>
            </li>
            <%
                    }
                }
%>


            <li>
                <a href="<%= url+"&curpage="+((curpage+1)>=totalpagenum ?totalpagenum:curpage+1)+"&onepagenum="+onepagenum%><% if(!(request.getParameter("searchstr")==null)){%><%= "&searchstr="+searchstr%> <%}%>" aria-label="Next">&raquo;</a>
            </li>
            <li>
                <a href="<%= url+"&curpage="+totalpagenum+"&onepagenum="+onepagenum%><% if(!(request.getParameter("searchstr")==null)){%><%="&searchstr="+searchstr%> <%}%>" >最后一页</a>
            </li>
        </ul>
    </nav>
</div>