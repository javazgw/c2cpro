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
									<a href="index.html">Home</a>
								</li>
								<li>
									<a href="shop.jsp">Shop</a>
								</li>
								<li>
									<a href="shop.jsp" class="active">Compare</a>
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
					<div class="col-lg-12">
						<!-- Compare Page Content Start -->
						<div class="compare-page-content-wrap">
							<div class="compare-table table-responsive">
								<table class="table table-bordered mb-0">
									<tbody>
										<tr>
											<td class="first-column">Product</td>
											<td class="product-image-title">
												<a href="single-product.jsp" class="image"><img class="img-fluid" src="assets/img/product-1.jpg" alt="Compare Product"></a>
												<a href="#" class="category">Daimond</a>
												<a href="single-product-sale.jsp" class="title">Zeon Zen 4 Pro</a>
											</td>
											<td class="product-image-title">
												<a href="single-product.jsp" class="image"><img class="img-fluid" src="assets/img/product-2.jpg" alt="Compare Product"></a>
												<a href="#" class="category">Gold</a>
												<a href="single-product-group.jsp" class="title">Aquet Doren D 420</a>
											</td>
											<td class="product-image-title">
												<a href="single-product.jsp" class="image"><img class="img-fluid" src="assets/img/product-3.jpg" alt="Compare Product"></a>
												<a href="#" class="category">Ring</a>
												<a href="single-product.jsp" class="title">Game Station X 22</a>
											</td>
										</tr>
										<tr>
											<td class="first-column">Description</td>
											<td class="pro-desc">
												<p>Samsome Note Book Pro 5 is an the best Laptop on this budgeted. You can satisfied after usign this laptop. It’s performance is awesome.</p>
											</td>
											<td class="pro-desc">
												<p>Samsome Note Book Pro 5 is an the best Laptop on this budgeted. You can satisfied after usign this laptop. It’s performance is awesome.</p>
											</td>
											<td class="pro-desc">
												<p>Samsome Note Book Pro 5 is an the best Laptop on this budgeted. You can satisfied after usign this laptop. It’s performance is awesome.</p>
											</td>
										</tr>
										<tr>
											<td class="first-column">Price</td>
											<td class="pro-price">$295</td>
											<td class="pro-price">$275</td>
											<td class="pro-price">$395</td>
										</tr>
										<tr>
											<td class="first-column">Color</td>
											<td class="pro-color">Black</td>
											<td class="pro-color">Red</td>
											<td class="pro-color">Blue</td>
										</tr>
										<tr>
											<td class="first-column">Stock</td>
											<td class="pro-stock">In Stock</td>
											<td class="pro-stock">Stock Out</td>
											<td class="pro-stock">In Stock</td>
										</tr>
										<tr>
											<td class="first-column">Add to cart</td>
											<td>
												<a href="cart.jsp" class="btn">Add to Cart</a>
											</td>
											<td>
												<a href="cart.jsp" class="btn disabled">Add to Cart</a>
											</td>
											<td>
												<a href="cart.jsp" class="btn">Add to Cart</a>
											</td>
										</tr>
										<tr>
											<td class="first-column">Rating</td>
											<td class="pro-ratting">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</td>
											<td class="pro-ratting">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</td>
											<td class="pro-ratting">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</td>
										</tr>
										<tr>
											<td class="first-column">Remove</td>
											<td class="pro-remove">
												<button><i class="fa fa-trash-o"></i></button>
											</td>
											<td class="pro-remove">
												<button><i class="fa fa-trash-o"></i></button>
											</td>
											<td class="pro-remove">
												<button><i class="fa fa-trash-o"></i></button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- Compare Page Content End -->
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