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

		<title>Contact Us - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
									<a href="index3.jsp">主页</a>
								</li>
								<li>
									<a href="shop.jsp" class="active">联系我们</a>
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
				<div class="row">
					<!-- Start Contact Info  -->
					<div class="col-lg-6">
						<div class="contact-info-wrap contact-method">
							<h2>Contact Info</h2>
							<p>If you have any problems,suggestions and feedback then please feel free to contact with us. Choose our communication soruces. We will love to hear from you.</p>

							<div class="contact-info-items">
								<div class="single-contact-info">
									<h3><i class="fa fa-phone"></i> Call</h3>
									<a href="">+231 40596971</a>
								</div>

								<div class="single-contact-info">
									<h3><i class="fa fa-envelope"></i> Mail</h3>
									<a href="mailto:your@email.here">your@email.here</a>
								</div>

								<div class="single-contact-info">
									<h3><i class="fa fa-map-marker"></i> Address</h3>
									<a href="#" target="_blank">San Francisco, CA 94111, United States</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End Contact Info  -->

					<!-- Start Contact Form -->
					<div class="col-lg-6">
						<div class="contact-form-wrap contact-method">
							<h2>Write to Us</h2>
							<form action="#" method="post" id="contact-form">
								<div class="row">
									<div class="col-md-6">
										<div class="single-input-item">
											<input type="text" name="first_name" placeholder="First Name" required />
										</div>
									</div>
									<div class="col-md-6">
										<div class="single-input-item">
											<input type="text" name="last_name" placeholder="Last Name" required />
										</div>
									</div>
								</div>

								<div class="single-input-item">
									<input type="email" name="contact_email" placeholder="Email Address" required />
								</div>

								<div class="single-input-item">
									<input type="text" name="contact_subject" placeholder="Subject" required/>
								</div>

								<div class="single-input-item">
									<textarea name="contact_message" cols="30" rows="4" placeholder="Write your Message" required></textarea>
								</div>

								<div class="single-input-item">
									<button class="btn" type="submit" name="submit">Send Message</button>
								</div>
								<!-- Show Succes or Error Message -->
								<div class="form-message"></div>
							</form>
						</div>
					</div>
					<!-- End Contact Form -->
				</div>
			</div>
		</div>
		<!--== Page Content Wrapper End ==-->

		<!-- Start Map Area Wrapper -->
		<div class="map-area-wrapper">
			<div id="map_content" data-lat="23.763491" data-lng="90.431167" data-zoom="8" data-maptitle="HasTech" data-mapaddress="Floor# 4, House# 5, Block# C </br> Banasree Main Rd, Dhaka">
			</div>
		</div>

		<!-- End Map Area Wrapper -->

		<!--== Start Brand Carousel Area ==-->
		<div class="brand-logo-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="brand-logo-carousel owl-carousel">
							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-1.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->

							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-2.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->

							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-3.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->

							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-4.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->

							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-5.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->

							<!-- Single Brand Logo Start -->
							<div class="single-brand-item">
								<a href="#"><img src="assets/img/logo-6.png" alt="brand"></a>
							</div>
							<!-- Single Brand Logo End -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--== End Brand Carousel Area ==-->

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