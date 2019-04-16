<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/4/16
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>fileup</title>
</head>
<h2>文件上传</h2>
<form action="/up" method="post" enctype="multipart/form-data">
    <div class="fileInputContainer">
        <input class="fileInput" type="file" name="file1"><br>
    </div>
    <input type="submit" value="submit">
</form>
</body>
</html>
