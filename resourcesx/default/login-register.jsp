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
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">

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

		<%@ include file="header.html" %>

		<!--== Start Page Breadcrumb ==-->
		<div class="page-breadcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-breadcrumb">
							<ul class="nav">
								<li>
									<a href="index.html">Home</a>
								</li>
								<li>
									<a href="shop.jsp">Shop</a>
								</li>
								<li>
									<a href="shop.jsp" class="active">Member Area</a>
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
								<h2>Already a Member?</h2>

								<form action="#" method="post">
									<div class="single-input-item">
										<input type="email" placeholder="Email or Username" required />
									</div>

									<div class="single-input-item">
										<input type="password" placeholder="Enter your Password" required />
									</div>

									<div class="single-input-item">
										<div class="login-reg-form-meta d-flex align-items-center justify-content-between">
											<div class="remember-meta">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" id="rememberMe">
													<label class="custom-control-label" for="rememberMe">Remember Me</label>
												</div>
											</div>

											<a href="#" class="forget-pwd">Forget Password?</a>
										</div>
									</div>

									<div class="single-input-item">
										<button class="btn">Login</button>
									</div>
								</form>
							</div>
						</div>
						<!-- Login Content End -->

						<!-- Register Content Start -->
						<div class="col-lg-7 mt-30 mt-lg-0">
							<div class="login-reg-form-wrap">
								<h2>Singup Form</h2>
								<form action="#" method="post">
									<div class="single-input-item">
										<input type="text" placeholder="Full Name" required />
									</div>

									<div class="single-input-item">
										<input type="email" placeholder="Enter your Email" required />
									</div>

									<div class="single-input-item">
										<input type="text" placeholder="Choose yur Username" required />
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="single-input-item">
												<input type="password" placeholder="Enter your Password" required />
											</div>
										</div>

										<div class="col-lg-6">
											<div class="single-input-item">
												<input type="password" placeholder="Repeat your Password" required />
											</div>
										</div>
									</div>

									<div class="single-input-item">
										<div class="login-reg-form-meta">
											<div class="remember-meta">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" id="subnewsletter">
													<label class="custom-control-label" for="subnewsletter">Subscribe Our Newsletter</label>
												</div>
											</div>
										</div>
									</div>

									<div class="single-input-item">
										<button class="btn">Register</button>
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

		<!--== Start Newsletter Area ==-->
		<div class="newsletter-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 m-auto">
						<!-- Newsletter Content Start -->
						<div class="newsletter-content-wrap text-center text-lg-left d-lg-flex">
							<h2><i class="fa fa-envelope-square"></i> Sign up for Newsletter</h2>
							<div class="newsletter-form-wrap">
								<form id="subscribe-form" action="assets/php/subscribe.php" method="post">
									<input type="email" name="newsletter_email" id="address" placeholder="Enter Your Email Address" required />
									<button class="btn" type="submit">Subscribe</button>
								</form>
								<!-- Show Error & Success Message -->
								<div id="subscribeResult"></div>
							</div>
						</div>
						<!-- Newsletter Content End -->
					</div>

					<div class="col-lg-3 m-auto text-center text-lg-right">
						<!-- Social Icons Area Start -->
						<div class="social-icons">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-linkedin"></i></a>
							<a href="#"><i class="fa fa-youtube"></i></a>
						</div>
						<!-- Social Icons Area End -->
					</div>
				</div>
			</div>
		</div>
		<!--== End Newsletter Area ==-->

		<%@ include file="footer.html" %>

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
	</body>

</html>