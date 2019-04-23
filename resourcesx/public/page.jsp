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

    String pagesql =request.getParameter("sql")==null?"":request.getParameter("sql");

    String url = request.getParameter("pageurl")==null?"":request.getParameter("pageurl");


    int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
    int totalpagenum ,onepagenum=12,itemnum;

    DataSet ds = SQLTools.getInstance().query(pagesql);
    itemnum = Integer.parseInt(ds.getValue(0,"c"));
    totalpagenum = itemnum/onepagenum+ ((itemnum%onepagenum==0)?0:1);

%>

<div class="products-settings-option d-block d-md-flex">
    <nav class="page-pagination">
        <ul class="pagination">
            <li>
                <a href="<%= url+"&curpage="+1+"&onepagenum="+onepagenum%>" >第一页</a>
            </li>
            <li>
                <a href="<%= url+"&curpage="+((curpage-1)<=1?1:curpage-1)+"&onepagenum="+onepagenum %>" aria-label="Previous">&laquo;</a>
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
                <a <%= curpage==i?"class=\"current\"":"" %> href="<%= url+"&curpage="+i+"&onepagenum="+onepagenum%>"><%= i%></a>
            </li>
            <%

            }
        }
        else
            {

%>
            <li>
                <a <%= curpage==i?"class=\"current\"":"" %> href="<%= url+"&curpage="+i+"&onepagenum="+onepagenum%>"><%= i%></a>
            </li>
            <%
                    }
                }
%>


            <li>
                <a href="<%= url+"&curpage="+((curpage+1)>=totalpagenum ?totalpagenum:curpage+1)+"&onepagenum="+onepagenum%>" aria-label="Next">&raquo;</a>
            </li>
            <li>
                <a href="<%= url+"&curpage="+totalpagenum+"&onepagenum="+onepagenum%>" >最后一页</a>
            </li>
        </ul>
    </nav>
</div>