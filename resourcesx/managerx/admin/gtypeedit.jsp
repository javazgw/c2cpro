<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.ht.c2c.tools.Encryption" %><%--
  ~ Copyright (c) 2019.  javazgw@gmail.com
  ~
  ~
  --%>

<%--
  Created by IntelliJ IDEA.
  User: zgw
  Date: 2019/4/30
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //@// TODO: 2019/4/18  ckeditor 有bug，图片修改在背景，偶尔出不来编辑器。
    String icode = request.getParameter("icode");
    Connection con = SQLTools.getInstance().getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from gcodetype where icode ="+icode);
    boolean bUpdate = rs.next();
//    while (rs.next())
//    {

%>
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="">
        <!-- BEGIN PAGE HEAD-->

        <!-- END PAGE HEAD-->
        <!-- BEGIN PAGE BREADCRUMB -->
        <!-- END PAGE BREADCRUMB -->
        <!-- BEGIN PAGE BASE CONTENT enctype ="multipart/form-data"-->
        <div class="row">
            <div class="col-md-12">
                <form id="editform" class="form-horizontal form-row-seperated" >
                    <div class="portlet">
                        <%--<div class="portlet-title" hidden>--%>
                        <%--<div class="caption">--%>
                        <%--<i class="fa fa-shopping-cart"></i>Test Product </div>--%>
                        <%--<div class="actions btn-set">--%>
                        <%--<button class=" " onclick="editsubmit()">--%>

                        <%--<i class="fa fa-check"></i> Save</button>--%>
                        <%--<button class="btn btn-success" >--%>
                        <%--<i class="fa fa-check-circle"></i> Save & Continue Edit</button>--%>

                        <%--</div>--%>
                        <%--</div>--%>
                        <div class="portlet-body">
                            <div class="tabbable-bordered">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_general" data-toggle="tab"> 基本信息 </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <%--<form id="editform" class="form-horizontal form-row-seperated" >--%>
                                    <div class="tab-pane active" id="tab_general">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品类型编码:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="hidden"  class="form-control" name="icode"  placeholder="" value="<%= bUpdate?rs.getString("icode"):""%>">
                                                    <input type="text" class="form-control" name="typecode" placeholder="" value="<%= bUpdate?rs.getString("typecode"):""%>">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品类型:
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control" name="typename" placeholder="" value="<%= bUpdate?rs.getString("typename"):""%>"> </div>
                                            </div>






                                           <%-- <div class="form-group ">
                                                <label class="control-label col-md-2">图片：</label>
                                                <div class="col-md-10">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
                                                            <%
                                                                if (bUpdate && rs.getString("image") != null){
                                                            %>
                                                            <img src=<%=rs.getString("image")%>>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div>
                                                            <span class="btn red btn-outline btn-file">
                                                                <span class="fileinput-new"> 选择文件 </span>
                                                                <span class="fileinput-exists"> 修改 </span>
                                                                <input type="file" accept="image/*" name="image"> </span>
                                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> 删除 </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>

                                            <div class="upload_box form-group">
                                                <div class="upload_main">
                                                    <div class="upload_choose">
                                                        <input id="fileImage" name="image" type="file" size="30"  multiple="" accept="image/jpeg,image/png,image/gif">
                                                        <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
                                                    </div>
                                                    <div id="preview" class="upload_preview">
                                                        <div id="uploadList_0" class="upload_append_list" style="display: block;">
                                                        <p>
                                                            <strong>839b99d54dc34.png</strong>
                                                            <a href="javascript:" class="upload_delete" title="删除" data-index="0">删除</a>
                                                            <br>

                                                            <input id="uploadImage_0"  name ="image" type="image" src=<%=rs.getString("image")%> class="upload_image"  width="100">
                                                        </p>

                                                        <span id="uploadProgress_0" class="upload_progress"></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="uploadInf" class="upload_inf"></div>
                                            </div>



                                        </div>
                                    </div>

                                    <%--</form>--%>

                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- END PAGE BASE CONTENT -->
    </div>
    <!-- END CONTENT BODY -->
</div>

<%
    //    }

    rs.close() ;
    stmt.close();
    con.close();
%>



<script>


    $('#save').on('click',function () {


        var formData = new FormData($('#editform')[0]);
       // var formData = new FormData($('#editform')[0]);
        $.ajax({
            url: '/BS?action=save&ext_tName=<%=Encryption.sampleEncodeAndDecode("gcodetype")%>',
            type: 'POST',
            data: formData,
            dataType: 'JSON',
            cache: false,
            processData: false,
            contentType: false
        }).done(function(ret){
            console.log(ret);
        });
        //return false; //阻止表单默认提交
        // });
    });

    //  CKEDITOR.replace("#ckeditor");
    // $('.summernote').summernote();

    //    tinymce.init({ selector:'textarea' });






    //----

    var ZXXFILE = {
        fileInput: null, //html file控件
        dragDrop: null, //拖拽敏感区域
        upButton: null, //提交按钮
        url: "", //ajax地址
        fileFilter: [], //过滤后的文件数组
        filter: function(files) { //选择文件组的过滤方法
            return files;
        },
        onSelect: function() {}, //文件选择后
        onDelete: function() {}, //文件删除后
        onDragOver: function() {}, //文件拖拽到敏感区域时
        onDragLeave: function() {}, //文件离开到敏感区域时
        onProgress: function() {}, //文件上传进度
        onSuccess: function() {}, //文件上传成功时
        onFailure: function() {}, //文件上传失败时,
        onComplete: function() {}, //文件全部上传完毕时

        /* 开发参数和内置方法分界线 */

        //文件拖放
        funDragHover: function(e) {
            e.stopPropagation();
            e.preventDefault();
            this[e.type === "dragover" ? "onDragOver" : "onDragLeave"].call(e.target);
            return this;
        },
        //获取选择文件，file控件或拖放
        funGetFiles: function(e) {
            // 取消鼠标经过样式
            this.funDragHover(e);

            // 获取文件列表对象
            var files = e.target.files || e.dataTransfer.files;
            //继续添加文件
            this.fileFilter = this.fileFilter.concat(this.filter(files));
            this.funDealFiles();
            return this;
        },

        //选中文件的处理与回调
        funDealFiles: function() {
            for(var i = 0, file; file = this.fileFilter[i]; i++) {
                //增加唯一索引值
                file.index = i;
            }
            //执行选择回调
            this.onSelect(this.fileFilter);
            return this;
        },

        //删除对应的文件
        funDeleteFile: function(fileDelete) {
            var arrFile = [];
            for(var i = 0, file; file = this.fileFilter[i]; i++) {
                if(file != fileDelete) {
                    arrFile.push(file);
                } else {
                    this.onDelete(fileDelete);
                }
            }
            this.fileFilter = arrFile;
            return this;
        },

        //文件上传
        funUploadFile: function() {
            var self = this;
            if(location.host.indexOf("sitepointstatic") >= 0) {
                //非站点服务器上运行
                return;
            }
            for(var i = 0, file; file = this.fileFilter[i]; i++) {
                (function(file) {
                    var xhr = new XMLHttpRequest();
                    if(xhr.upload) {
                        // 上传中
                        xhr.upload.addEventListener("progress", function(e) {
                            self.onProgress(file, e.loaded, e.total);
                        }, false);

                        // 文件上传成功或是失败
                        xhr.onreadystatechange = function(e) {
                            if(xhr.readyState == 4) {
                                if(xhr.status == 200) {
                                    self.onSuccess(file, xhr.responseText);
                                    self.funDeleteFile(file);
                                    if(!self.fileFilter.length) {
                                        //全部完毕
                                        self.onComplete();
                                    }
                                } else {
                                    self.onFailure(file, xhr.responseText);
                                }
                            }
                        };

                        // 开始上传
                        xhr.open("POST", self.url, true);
                        xhr.setRequestHeader("FILENAME", encodeURIComponent(file.name));
                        xhr.send(file);
                    }
                })(file);
            }

        },

        init: function() {
            var self = this;

            if(this.dragDrop) {
                this.dragDrop.addEventListener("dragover", function(e) {
                    self.funDragHover(e);
                }, false);
                this.dragDrop.addEventListener("dragleave", function(e) {
                    self.funDragHover(e);
                }, false);
                this.dragDrop.addEventListener("drop", function(e) {
                    self.funGetFiles(e);
                }, false);
            }

            //文件选择控件选择
            if(this.fileInput) {
                this.fileInput.addEventListener("change", function(e) {
                    self.funGetFiles(e);
                }, false);
            }

            //上传按钮提交
            if(this.upButton) {
                this.upButton.addEventListener("click", function(e) {
                    self.funUploadFile(e);
                }, false);
            }
        }
    };

    var params = {
        fileInput: $("#fileImage").get(0),
        dragDrop: $("#fileDragArea").get(0),
        upButton: $("#fileSubmit").get(0),
        url: $("#uploadForm").attr("action"),
        filter: function(files) {
            var arrFiles = [];
            for(var i = 0, file; file = files[i]; i++) {
                if(file.type.indexOf("image") == 0) {
                    if(file.size >= 512000) {
                        alert('您这张"' + file.name + '"图片大小过大，应小于500k');
                    } else {
                        arrFiles.push(file);
                    }
                } else {
                    alert('文件"' + file.name + '"不是图片。');
                }
            }
            return arrFiles;
        },

        onSelect: function(files) {
            var html = '',
                i = 0;
            $("#preview").html('<div class="upload_loading"></div>');
            var funAppendImage = function() {
                file = files[i];
                if(file) {
                    var reader = new FileReader()
                    reader.onload = function(e) {
                        html = html + '<div id="uploadList_' + i + '" class="upload_append_list"><p><strong>' + file.name + '</strong>' +
                            '<a href="javascript:" class="upload_delete" title="删除" data-index="' + i + '">删除</a><br />' +
                            //'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>' +
                            '<input id="uploadImage_'+i+ '" name ="image" type="image" src="' + e.target.result + '" class="upload_image" alt="Submit" width="100">'+
                            '<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
                            '</div>';

                        i++;
                        funAppendImage();
                    }
                    reader.readAsDataURL(file);
                } else {
                    $("#preview").html(html);
                    if(html) {
                        //删除方法
                        $(".upload_delete").click(function() {
                            ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
                            return false;
                        });
                        //提交按钮显示
                        $("#fileSubmit").show();
                    } else {
                        //提交按钮隐藏
                        $("#fileSubmit").hide();
                    }
                }
            };
            funAppendImage();
        },
        onDelete: function(file) {
            $("#uploadList_" + file.index).fadeOut();
            $('#uploadForm')[0].reset();
        },
        onDragOver: function() {
            $(this).addClass("upload_drag_hover");
        },
        onDragLeave: function() {
            $(this).removeClass("upload_drag_hover");
        },
        onProgress: function(file, loaded, total) {
            var eleProgress = $("#uploadProgress_" + file.index),
                percent = (loaded / total * 100).toFixed(2) + '%';
            eleProgress.show().html(percent);
        },
        onSuccess: function(file, response) {
            $("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
        },
        onFailure: function(file) {
            $("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");
            $("#uploadImage_" + file.index).css("opacity", 0.2);
        },
        onComplete: function() {
            //提交按钮隐藏
            $("#fileSubmit").hide();
            //file控件value置空
            $('#uploadForm')[0].reset();
            // 成功提示
            $("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
        }
    };
    ZXXFILE = $.extend(ZXXFILE, params);
    ZXXFILE.init();
</script>

<style>
    .upload_box {
        width: 800px;
        margin: 1em auto;
    }

    .upload_main {
        border-width: 1px 1px 2px;
        border-style: solid;
        border-color: #ccc #ccc #ddd;
        background-color: #fbfbfb;
    }

    .upload_choose {
        padding: 1em;
    }

    .upload_drag_area {
        display: inline-block;
        width: 60%;
        padding: 1em 0;
        margin-left: .5em;
        border: 1px dashed #ddd;
        background: #fff url(drag.png) no-repeat 20px center;
        color: #999;
        text-align: center;
        vertical-align: middle;
    }

    .upload_drag_hover {
        border-color: #069;
        box-shadow: inset 2px 2px 4px rgba(0, 0, 0, .5);
        color: #333;
    }

    .upload_preview {
        border-top: 1px solid #bbb;
        border-bottom: 1px solid #bbb;
        background-color: #fff;
        overflow: hidden;
        _zoom: 1;
    }

    .upload_append_list {
        height: 300px;
        padding: 0 1em;
        float: left;
        position: relative;
    }

    .upload_delete {
        margin-left: 2em;
    }

    .upload_image {
        max-height: 250px;
        padding: 5px;
    }

    .upload_submit {
        padding-top: 1em;
        padding-left: 1em;
    }

    .upload_submit_btn {
        display: none;
        height: 32px;
        font-size: 14px;
    }

    .upload_loading {
        height: 250px;
        background: url(/study/image/loading.gif) no-repeat center;
    }

    .upload_progress {
        display: none;
        padding: 5px;
        border-radius: 10px;
        color: #fff;
        background-color: rgba(0, 0, 0, .6);
        position: absolute;
        left: 25px;
        top: 45px;
    }
</style>