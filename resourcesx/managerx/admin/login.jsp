<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.6
Version: 4.5.3
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>登陆</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
  <!--       <link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="../assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="../assets/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="index.html">
                <img src="../assets/pages/img/logo-big.png" alt="" /> </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" action="javascript:login()" method="post">
                <h3 class="form-title">登陆</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> 录入用户名和密码 </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Username</label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="bname" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Password</label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="pass" /> </div>
                </div>
                <div class="form-group">
                <fieldset><label class="control-label visible-ie8 visible-ie9" for="checkimage">验证码:</label> <input  onkeydown="javascript:if(event.keyCode==13) loginsystem() " id="checkimage"
                                                                                                                           name="checkvalue" tabindex="3" type="text" placeholder="验证码" value="" autocomplete="off" />
                <img width="80" height="40" alt="code..." name="randImage" id="randImage" src="./checkimage.jsp"  border="1" align="absmiddle">
                <a href=javascript: onclick="javascript:reloadImage()">更换</a></fieldset>
        </div>
                <div class="form-actions">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" value="1" /> 记住我 </label>
                    <button type="submit" class="btn green pull-right"> 登陆 </button>
                </div>
                <%--<div class="login-options">--%>
                    <%--<h4>Or login with</h4>--%>
                    <%--<ul class="social-icons">--%>
                        <%--<li>--%>
                            <%--<a class="facebook" data-original-title="facebook" href="javascript:;"> </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a class="twitter" data-original-title="Twitter" href="javascript:;"> </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a class="googleplus" data-original-title="Goole Plus" href="javascript:;"> </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a class="linkedin" data-original-title="Linkedin" href="javascript:;"> </a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <div class="forget-password">
                    <h4>忘记密码 ?</h4>
                    <p> 别担心，点击
                        <a href="javascript:;" id="forget-password"> 这里 </a> 重置密码. </p>
                </div>
                <div class="create-account">
                    <p> 您还没有账号 ?&nbsp;
                        <a href="javascript:;" id="register-btn"> 创建新帐户 </a>
                    </p>
                </div>
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="javascript:index.html" method="post">
                <h3>忘记密码 ?</h3>
                <p> Enter your e-mail address below to reset your password. </p>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn red btn-outline">后退 </button>
                    <button type="submit" class="btn green pull-right"> 提交 </button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
            <!-- BEGIN REGISTRATION FORM -->
            <form class="register-form" action="javascript:register()" method="post">
                <h3>注册</h3>
                <%--<p> 请录入您的注册信息: </p>--%>
                <%--<div class="form-group">--%>
                    <%--<label class="control-label visible-ie8 visible-ie9">Full Name</label>--%>
                    <%--<div class="input-icon">--%>
                        <%--<i class="fa fa-font"></i>--%>
                        <%--<input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" name="fullname" /> </div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->--%>
                    <%--<label class="control-label visible-ie8 visible-ie9">Email</label>--%>
                    <%--<div class="input-icon">--%>
                        <%--<i class="fa fa-envelope"></i>--%>
                        <%--<input class="form-control placeholder-no-fix" type="text" placeholder="Email" name="email" /> </div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label class="control-label visible-ie8 visible-ie9">Address</label>--%>
                    <%--<div class="input-icon">--%>
                        <%--<i class="fa fa-check"></i>--%>
                        <%--<input class="form-control placeholder-no-fix" type="text" placeholder="Address" name="address" /> </div>--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label class="control-label visible-ie8 visible-ie9">City/Town</label>--%>
                    <%--<div class="input-icon">--%>
                        <%--<i class="fa fa-location-arrow"></i>--%>
                        <%--<input class="form-control placeholder-no-fix" type="text" placeholder="City/Town" name="city" /> </div>--%>
                <%--</div>--%>
               <%--<div  class="form-group">--%>
                    <%--<label class="control-label visible-ie8 visible-ie9">Country</label>--%>
                    <%--<select name="country" id="country_list" class="select2 form-control">--%>
                        <%--<option value=""></option>--%>

                        <%--<option value="CN">China</option>--%>

                    <%--</select>--%>
                <%--</div>--%>
                <p> 请录入您的账号信息: </p>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="bname" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Password</label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="密码" name="pass" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">再录入一次密码</label>
                    <div class="controls">
                        <div class="input-icon">
                            <i class="fa fa-check"></i>
                            <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="再录入一次密码" name="rpass" /> </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="tnc" /> 我同意
                        <a href="javascript:;"> 服务条款  </a> 和
                        <a href="javascript:;"> 隐私政策 </a>
                    </label>
                    <div id="register_tnc_error"> </div>
                </div>
                <div class="form-actions">
                    <button id="register-back-btn" type="button" class="btn red btn-outline"> 后退 </button>
                    <button type="submit" id="register-submit-btn" class="btn green pull-right"> 注册 </button>
                </div>
            </form>
            <!-- END REGISTRATION FORM -->






        </div>
        <!-- END LOGIN -->
        <!-- BEGIN COPYRIGHT -->
        <div class="copyright">
        <jsp:include flush="true" page="./footer.jsp"></jsp:include>
        </div>
        <!-- END COPYRIGHT -->
        <!--[if lt IE 9]>

<!--<script src="../assets/global/plugins/respond.min.js"></script>-->
<!--<script src="../assets/global/plugins/excanvas.min.js"></script> -->
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <%--<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
        <%--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>
        <%--<script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>--%>
        <%--<script src="../assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>--%>
        <script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="../assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
 <script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="../assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
<!--        <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>-->
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <script src="../assets/pages/scripts/login-4.min.js" type="text/javascript"></script>

        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>
<script>
    var login = function()
    {
        $.post( '/login?action=login', $('.login-form').serialize(), function(data) {

                if(data.type==1001)
                {
                    window.location.href='/managerx/admin/main.jsp';
                }
                else {
                    log(data.msg);
                }
            },
            'json' // I expect a JSON response
        );
    }
    var register = function()
    {
        $.post( '/login?action=register', $('.register-form').serialize(), function(data) {

                if(data.type==1001)
                {
                    window.location.href='/managerx/admin/main.jsp';
                }
                else {
                    log(data.msg);
                }
            },
            'json' // I expect a JSON response
        );
    }


    var log = function(msg)
    {
        $.bootstrapGrowl(msg, {
            ele: 'body', // which element to append to
            type: "warning", // (null, 'info', 'danger', 'success', 'warning')
            offset: {from: 'top', amount: 20}, // 'top', or 'bottom'
            align: "center", // ('left', 'right', or 'center')
            width: "auto", // (integer, or 'auto')
            delay: 1000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
            allow_dismiss:true, // If true then will display a cross to close the popup.
            stackup_spacing: 10 // spacing between consecutively stacked growls.
        });
    }
    function reloadImage()
    {


        document.signin_standard.randImage.src = './checkimage.jsp?' + Math.random();
    }

</script>
    <script src="../assets/global/plugins/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
    <%--<script src="../assets/pages/scripts/ui-bootstrap-growl.min.js" type="text/javascript"></script>--%>
    <script src="../assets/global/plugins/bootstrap-growl/jquery.bootstrap-growl.min.js" type="text/javascript"></script>
</html>