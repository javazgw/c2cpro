<%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/6/15
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script language="javascript" type="text/javascript">
    function openWebSocket() {
        var wsurl = getHost().replace("http://", "ws://");
        if ('WebSocket' in window)
            printws = new WebSocket(wsurl + "/../websocket/maintain");
        else if ('MozWebSocket' in window)
            printws = new MozWebSocket(wsurl + "/../websocket/maintain");
        else
            alert("not support");

        printws.onmessage = function (evt) {

            console.log(evt.data);

        };
        printws.onclose = function (evt) {
 // alert("socket close");
            printws = null;
            retryConnect();
        };
        printws.onopen = function (evt) {
 //alert("socket open");
        };

    }

    function retryConnect()
    {
        var retryid = 0;
        // alert(""+printws);
        if(printws==null)
        {
            setTimeout("openWebSocket()",5000);
        }

        else
        {
            if(retryid!=0)
                clearTimeout(retryid);
        }
    }
    window.onload = function (){
//$(document).ready(function() {

//init socket

        openWebSocket();


    }
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
