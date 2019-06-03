﻿<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="meta description">

		<title>Product Compare - Digital Products Store eCommerce Bootstrap 4 Template</title>

		<!--=== Favicon ===-->
		<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />

		<!--== Google Fonts ==-->
		<%--<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">--%>

		<!--=== Bootstrap CSS ===-->
		<link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">
		<!--=== Font-Awesome CSS ===-->
		<link href="assets/css/vendor/font-awesome.css" rel="stylesheet">
		<!--=== Plugins CSS ===-->
		<link href="assets/css/plugins.css" rel="stylesheet">
		<!--=== Helper CSS ===-->
		<link href="assets/css/helper.min.css" rel="stylesheet">
		<!--=== Main Style CSS ===-->
		<link href="assets/css/style.css" rel="stylesheet">

		<!-- Modernizer JS -->
		<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

		<!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	</head>

	<body>

		<%@ include file="header.jsp" %>

		<!--== Start Page Breadcrumb ==-->
		<div class="page-breadcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-breadcrumb">
							<ul class="nav">
								<li>
									<a href="index.html">主页</a>
								</li>
								<li>
									<a href="shop.html">商店</a>
								</li>
								<li>
									<a href="shop.html" class="active">登录</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--== End Page Breadcrumb ==-->

		<!--== Page Content Wrapper Start ==-->
		<div id="page-content-wrapper">
			<div class="container">
				<div class="member-area-from-wrap">
					<div class="row">
						<!-- Login Content Start -->
						<div class="col-lg-5">
							<div class="login-reg-form-wrap  pr-lg-50">
								<h2>已经有账号?</h2>

								<form class="login-form" action="javascript:login()" method="post">
									<div class="single-input-item">
										<input type="text" placeholder="邮箱或者用户名" name="cname" required />
									</div>

									<div class="single-input-item">
										<input type="password" placeholder="密码" name="pass"  required />
									</div>
									<div class="form-group">
										<fieldset> <input name="checkvalue"  onkeydown="javascript:if(event.keyCode==13) loginsystem() " id="checkimage"
														  name="checkvalue" tabindex="3" type="text" placeholder="验证码" value="" autocomplete="off" />
											<img width="80" height="40" alt="code..." name="randImage" id="randImage" src="./checkimage.jsp"  border="1" align="absmiddle">
											<a href=javascript: onclick="javascript:reloadImage()">更换</a></fieldset>
									</div>
									<div class="single-input-item">
										<div class="login-reg-form-meta d-flex align-items-center justify-content-between">
											<div class="remember-meta">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" name = "remember" id="rememberMe">
													<label class="custom-control-label" for="rememberMe">记住我</label>
												</div>
											</div>

											<a href="#" class="forget-pwd">忘记密码?</a>
										</div>
									</div>

									<div class="single-input-item">
										<button class="btn">登陆</button>
									</div>
								</form>
							</div>
						</div>
						<!-- Login Content End -->

						<!-- Register Content Start -->
						<div class="col-lg-7 mt-30 mt-lg-0">
							<div class="login-reg-form-wrap">
								<h2>新注册</h2>
								<form class="register-form" action="javascript:register()" method="post">


									<div class="single-input-item">
										<input type="email" name="email" placeholder="邮箱" required />
									</div>

									<div class="single-input-item">
										<input type="text" name="cname" placeholder="用户名" required />
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="single-input-item">
												<input type="password" name="pass" placeholder="密码" required />
											</div>
										</div>

										<div class="col-lg-6">
											<div class="single-input-item">
												<input type="password" name="rpass" placeholder="再输入一次密码" required />
											</div>
										</div>
									</div>



									<div class="single-input-item">
										<button class="btn">注册</button>
									</div>
								</form>
							</div>
						</div>
						<!-- Register Content End -->
					</div>
				</div>
			</div>
		</div>
		<!--== Page Content Wrapper End ==-->

		<%@ include file="footer.jsp" %>

		<!--=======================Javascript============================-->
		<!--=== Jquery Min Js ===-->
		<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
		<!--=== Jquery Migrate Min Js ===-->
		<script src="assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
		<!--=== Popper Min Js ===-->
		<script src="assets/js/vendor/popper.min.js"></script>
		<!--=== Bootstrap Min Js ===-->
		<script src="assets/js/vendor/bootstrap.min.js"></script>
		<!--=== Ajax Mail Js ===-->
		<script src="assets/js/ajax-mail.js"></script>
		<!--=== Plugins Min Js ===-->
		<script src="assets/js/plugins.js"></script>

		<!--=== Active Js ===-->
		<script src="assets/js/active.js"></script>



		<script>
            var login = function()
            {
                $.post( '/cc?action=login', $('.login-form').serialize(), function(data) {

                        if(data.type==1001)
                        {
                            window.location.href='/default/index3.jsp';
                        }
                        else {
                            console.log(data.msg);
                            alert("错误"+data.msg);
                        }
                    },
                    'json' // I expect a JSON response
                );
            }
            var register = function()
            {
                $.post( '/cc?action=register', $('.register-form').serialize(), function(data) {

                        if(data.type==1001)
                        {
                             window.location.href='/default/index3.jsp';
                        }
                        else {
                            console.log(data.msg);
                            alert("错误"+data.msg);
                        }
                    },
                    'json' // I expect a JSON response
                );
            }
            function reloadImage()
            {


                document.randImage.src = './checkimage.jsp?' + Math.random();
            }
		</script>
	</body>

</html>