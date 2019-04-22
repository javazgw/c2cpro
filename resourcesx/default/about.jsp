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

		<title>About :: Tienda - Digital Products Store eCommerce Bootstrap 4 Template</title>

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

	<%@ include file="header.jsp" %>

		<!--== Start Page Breadcrumb ==-->
		<div class="page-breadcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-breadcrumb">
							<ul class="nav">
								<li>
									<a href="index3.jsp">主页</a>
								</li>
								<li>
									<a href="shop.jsp" class="active">关于我们</a>
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
				<!-- About Page Content Start -->
				<div class="row">
					<!-- About Text Start -->
					<div class="col-lg-6 order-last order-lg-first">
						<div class="about-text-wrap">
							<h2><span>Provide Best</span>Product For You</h2>
							<p>We provide the best Beard oile all over the world. We are the worldd best store in indi for Beard Oil. You can buy our product without any hegitation because they truste us and buy our product without any hagitation because they belive and always happy buy our product.</p>

							<p>Some of our customer say’s that they trust us and buy our product without any hagitation because they belive us and always happy to buy our product.</p>

							<p>We provide the beshat they trusted us and buy our product without any hagitation because they belive us and always happy to buy.</p>
						</div>
					</div>
					<!-- About Text End -->

					<!-- About Image Start -->
					<div class="col-lg-5 col-md-10 m-md-auto ml-auto">
						<div class="about-image-wrap">
							<img src="assets/img/about.jpg" alt="About" />
						</div>
					</div>
					<!-- About Image End -->
				</div>
				<!-- About Page Content End -->
			</div>
		</div>
		<!--== Page Content Wrapper End ==-->

		<!-- Start Sale Feature Products -->
		<div class="category-banner-area deal-products p-0">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<a href="shop.jsp"><img src="assets/img/home4-deal-product-1.jpg" alt="Banner"></a>
					</div>

					<div class="col-md-4 mt-xs-30">
						<a href="shop.jsp"><img src="assets/img/home4-deal-product-2.jpg" alt="Banner"></a>
					</div>

					<div class="col-md-4 mt-xs-30">
						<a href="shop.jsp"><img src="assets/img/home4-deal-product-3.jpg" alt="Banner"></a>
					</div>
				</div>
			</div>
		</div>
		<!-- End Sale Feature Products -->

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
	</body>

</html>