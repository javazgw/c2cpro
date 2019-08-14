<%--
  Created by IntelliJ IDEA.
  User: javazgw
  Date: 2019/4/15
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="page-footer">--%>
        <%--<div class="page-footer-inner"> 2019 &copy; power by httech.--%>
        <%--<a href="http://www.htfa.cn" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">httech</a>--%>
    <%--</div>--%>
    <%--<div class="scroll-to-top">--%>
        <%--<i class="icon-arrow-up"></i>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="portlet page-footer">

    <div class="portlet-body">

        <p class="text-center"> 2019 &copy; power by httech.
        <a href="http://www.htfa.cn" title="汉廷电商" target="_blank">httech</a>
        </p>
    </div>
    <div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
    </div>
</div>
<!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<%
    String appContext = request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + appContext;
%>

<script src="<%=basePath%>/managerx/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=basePath%>/managerx/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<%--<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>--%>

<script src="<%=basePath%>/managerx/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>


<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="<%=basePath%>/managerx/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<%--<script src="<%=basePath%>/managerx/assets/pages/scripts/ecommerce-products.min.js" type="text/javascript"></script>--%>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="<%=basePath%>/managerx/assets/layouts/layout4/scripts/layout.min.js" type="text/javascript"></script>
<%--<script src="<%=basePath%>/managerx/assets/layouts/layout4/scripts/demo.min.js" type="text/javascript"></script>--%>
<script src="<%=basePath%>/managerx/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<%--<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>--%>

<%--<link href="<%=basePath%>/managerx/assets/global/plugins/bootstrap-summernote/summernote.css" rel="stylesheet">--%>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<%--<script src="https://cloud.tinymce.com/5/tinymce.min.js"></script>--%>
<!-- END THEME LAYOUT SCRIPTS -->

<script src="<%=basePath%>/managerx/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="<%=basePath%>/managerx/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
<%--<script>--%>
    <%--$('.ls-modal').on('click', function(e){--%>
        <%--e.preventDefault();--%>

        <%--$('#myModal').modal('show').find('.modal-body').load('edit.jsp');--%>
    <%--});--%>
<%--</script>--%>