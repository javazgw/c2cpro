<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/6/11
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang=zh>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>维修记录</title>
    <%--<link href="/default/assets/css/vendor/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">--%>



    <%--&lt;%&ndash;<script src="/default/assets/js/vendor/jquery-3.3.1.min.js"></script>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<script src="/default/assets/js/vendor/bootstrap.min.js"></script>&ndash;%&gt;--%>

    <%--<!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" media="all" rel="stylesheet" type="text/css">&ndash;%&gt;--%>
    <link rel="stylesheet" href="./bootstrap4.3.1.css" media="all" rel="stylesheet" type="text/css">
    <%--&lt;%&ndash;<link rel="stylesheet" href="http://plugins.krajee.com/assets/prod/all-krajee.min.css?ver=201903112143">&ndash;%&gt;--%>
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />--%>
    <%--<!-- if using RTL (Right-To-Left) orientation, load the RTL CSS file after fileinput.css by uncommenting below -->--%>
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/css/fileinput-rtl.min.css" media="all" rel="stylesheet" type="text/css" />--%>
    <%--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>--%>
    <%--<!-- piexif.min.js is needed for auto orienting image files OR when restoring exif data in resized images and when you--%>
    <%--wish to resize images before upload. This must be loaded before fileinput.min.js -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/js/plugins/piexif.min.js" type="text/javascript"></script>--%>
    <%--<!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.--%>
    <%--This must be loaded before fileinput.min.js -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/js/plugins/sortable.min.js" type="text/javascript"></script>--%>
    <%--<!-- purify.min.js is only needed if you wish to purify HTML content in your preview for--%>
    <%--HTML files. This must be loaded before fileinput.min.js -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/js/plugins/purify.min.js" type="text/javascript"></script>--%>
    <%--<!-- popper.min.js below is needed if you use bootstrap 4.x. You can also use the bootstrap js--%>
    <%--3.3.x versions without popper.min.js. -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>--%>
    <%--<!-- bootstrap.min.js below is needed if you wish to zoom and preview file content in a detail modal--%>
    <%--dialog. bootstrap 4.x is supported. You can also use the bootstrap js 3.3.x versions. -->--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/javascript"></script>--%>
    <%--<!-- the main fileinput plugin file -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/js/fileinput.min.js"></script>--%>
    <%--<!-- optionally if you need a theme like font awesome theme you can include it as mentioned below -->--%>
    <%--&lt;%&ndash;<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/themes/fa/theme.js"></script>&ndash;%&gt;--%>
    <%--<!-- optionally if you need translation for your language then include  locale file as mentioned below -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.3/js/locales/zh.js"></script>--%>
    <%--<script src="/default/assets/js/vendor/bootstrap.min.js"></script>--%>
    <%--&lt;%&ndash;<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.5.0/themes/fas/theme.js"></script>&ndash;%&gt;--%>
    <%--<script src="http://plugins.krajee.com/assets/7b05f299/themes/fas/theme.min.js?ver=201904201807"></script>--%>
    <%--<script src="http://plugins.krajee.com/assets/7b05f299/themes/fa/theme.min.js?ver=201904201807"></script>--%>


    <!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">--%>
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />--%>
    <link href="./../assets/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    <!-- if using RTL (Right-To-Left) orientation, load the RTL CSS file after fileinput.css by uncommenting below -->
    <!-- link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput-rtl.min.css" media="all" rel="stylesheet" type="text/css" /-->
    <!-- the font awesome icon library if using with `fas` theme (or Bootstrap 4.x). Note that default icons used in the plugin are glyphicons that are bundled only with Bootstrap 3.x. -->
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="./../assets/css/all.css" crossorigin="anonymous">
    <%--<script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>--%>
    <script src="./../assets/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <!-- piexif.min.js is needed for auto orienting image files OR when restoring exif data in resized images and when you
        wish to resize images before upload. This must be loaded before fileinput.min.js -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js" type="text/javascript"></script>--%>
    <script src="./../assets/piexif.min.js" type="text/javascript"></script>
    <!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.
        This must be loaded before fileinput.min.js -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/sortable.min.js" type="text/javascript"></script>--%>
    <script src="./../assets/sortable.min.js" type="text/javascript"></script>
    <!-- purify.min.js is only needed if you wish to purify HTML content in your preview for
        HTML files. This must be loaded before fileinput.min.js -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/purify.min.js" type="text/javascript"></script>--%>
    <script src="./../assets/purify.min.js" type="text/javascript"></script>
    <!-- popper.min.js below is needed if you use bootstrap 4.x (for popover and tooltips). You can also use the bootstrap js
       3.3.x versions without popper.min.js. -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>--%>
    <script src="./../assets/popper.min.js"></script>
    <!-- bootstrap.min.js below is needed if you wish to zoom and preview file content in a detail modal
        dialog. bootstrap 4.x is supported. You can also use the bootstrap js 3.3.x versions. -->
    <%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>--%>
    <%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>--%>
    <script src="./../assets/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <!-- the main fileinput plugin file -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>--%>
    <script src="./../assets/fileinput.min.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/locales/zh.js"></script>--%>
    <script src="./../assets/zh.js"></script>
    <!-- following theme script is needed to use the Font Awesome 5.x theme (`fas`) -->
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/themes/fas/theme.min.js"></script>--%>
    <script src="./../assets/theme.min.js"></script>
    <!-- optionally if you need translation for your language then include the locale file as mentioned below (replace LANG.js with your language locale) -->

    <link href="./../default/assets/css/vendor/font-awesome.css" rel="stylesheet">
    <script src="./../js/ht.js"></script>
</head>


<body>

<%
    String icode = request.getParameter("icode");
    String addr = request.getParameter("addr");
    if(icode==null)
    {
        icode = "";
    }

%>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="alert">

                <h4>
                    故障申报!
                </h4>
                <button class="btn btn-primary" onclick="window.location.href='./maintainquery.jsp?addr=<%=addr%>'">查询历史故障申报</button>
            </div>
        </div>
        <div class="span12">



            <form   class="form-horizontal">
                <fieldset>
                    <%--<legend>故障申报</legend>--%>
                    <div class="form-group">
                        <label class="control-label" for="desc">故障描述</label>
                        <div class="controls">
                            <input id="icode" type="hidden" class="form-control" value="<%=((icode==null || icode.equals(""))?UUID.randomUUID():icode)%>"/>
                            <input id="desc" type="text" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="name">故障申报人姓名</label>
                        <div class="controls">
                            <input id="name" type="text" class="form-control" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="input-fas">图片信息</label>
                        <div class="file-loading">
                            <input id="input-fas" name="input-fas[]" type="file" multiple>
                        </div>

                    </div>

                    <span class="help-block"></span>



                </fieldset>
            </form>

        </div>
    </div>
    <div class="col-md-12 text-center">
        <button id ="tijiao"  name="singlebutton" class="btn btn-primary">提交!</button>
    </div>


    <div id="kv-error-2" style="margin-top:10px;display:none"></div>
    <div id="kv-success-2" class="alert alert-success fade in" style="margin-top:10px;display:none"></div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div id = "response" class="alert alert-info">
                    <%--<button type="button" class="close" data-dismiss="alert">×</button>--%>
                    <h4>
                        提示!
                    </h4> 录入完毕记住提交.
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var id_str = '';
    $("#input-fas").fileinput({
        language: 'zh',
        textEncoding:"UTF-8",
        theme: "fas",
        uploadAsync: true,
        uploadUrl: "../up",
        showRemove:false,
        showUpload:false,
        allowedFileTypes: ["image", "video"],
        maxFileCount: 5,
        uploadExtraData: function() {  // callback example
            var out = {}, key, i = 0;

            out["HTname"] =  $("#name").val();
            out["HTdescript"] =  $("#desc").val();
            //内码


            out["HTicode"] = $("#icode").val();

            <% if(addr!=null  && !addr.equals("") ) { %>
            out["HTaddr"] = "<%=addr%>";
            <% }%>
            out["HTtable"] = "maintain";
            out["HTstatus"] = "待处理";

            return out;
        }
    }).on('filebatchpreupload', function(event, data, id, index) {
        /* $('#kv-success-2').html('<h4>上传状态</h4><ul></ul>').hide();
         console.log("filebatchpreupload1");*/
    }).on('filebatchuploadsuccess', function(event, data) {
        /*  var out = '';
          $.each(data.files, function(key, file) {
              var fname = file.name;
              out = out + '<li>' + '上传文件 # ' + (key + 1) + ' - '  +  fname + ' 成功。' + '</li>';
              console.log("filebatchuploadsuccess2-"+out);
          });
          $('#kv-success-2 ul').append(out);
          $('#kv-success-2').fadeIn('slow');*/

        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        // alert (extra.bdInteli + " " +  response.uploaded);
    }).on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded-");
    }).on('fileerror', function(event, data, msg) {
        console.log("fileerror-");

    }).on('filebatchuploadcomplete',function (event,files,extra) {
        if(id_str.length == 0){
            console.log("filebatchuploadcomplete  error-");

            $("#response").html("提交成功,1秒后跳转");
            // window.location.reload( true );

             setTimeout("window.location.href='./maintainquery.jsp?addr=<%=addr%>'",1000)
            return false;
        }

    }).on('fileuploaded', function(event, data, previewId, index) {
        if(typeof(data.response.id) != 'undefined'){
            id_str = id_str+data.response.id+',';
        }
        console.log("fileuploaded "+data.response.id+"-"+data.files);

        console.log("response = "+data.response);
    });

    /*
        $('#input-fas').on('filebatchuploadsuccess', function(event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
            alert (extra.bdInteli + " " +  response.uploaded);
        });*/


    /*  $('#tijiao').on('click',function () {
          $('#input-fas').fileinput('upload');
      });*/
    $( "#tijiao" ).click(function() {

        $('#input-fas').fileinput('upload');
    });

</script>
</html>
