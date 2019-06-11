<%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/6/11
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修记录</title>
    <%--<link href="/default/assets/css/vendor/bootstrap.min.css" rel="stylesheet">--%>
    <link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="/default/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="/default/assets/js/vendor/bootstrap.min.js"></script>
</head>


<body>


<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <form>
                <fieldset>

                    <legend>故障申报</legend>
                    <label>故障描述</label>
                    <input type="text" />
                    <label>图片信息(你最好提交图片,这样我们处理会准确一些)</label>


                    <span class="help-block"></span>
                    <label class="checkbox"><input type="checkbox" /> 勾选同意</label>
                    <button type="submit" class="btn">提交</button>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>
