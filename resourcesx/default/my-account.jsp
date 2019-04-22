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

		<title>Dashboard - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
									<a href="index.html">Home</a>
								</li>
								<li>
									<a href="shop.jsp" class="active">Dashboard</a>
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
						<!-- My Account Page Start -->
						<div class="myaccount-page-wrapper">
							<!-- My Account Tab Menu Start -->
							<div class="row">
								<div class="col-lg-3">
									<div class="myaccount-tab-menu nav" role="tablist">
										<a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i> Dashboard
										</a>

										<a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Orders</a>

										<a href="#download" data-toggle="tab"><i class="fa fa-cloud-download"></i> Download</a>

										<a href="#payment-method" data-toggle="tab"><i class="fa fa-credit-card"></i> Payment Method
										</a>

										<a href="#address-edit" data-toggle="tab"><i class="fa fa-map-marker"></i> address</a>

										<a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i> Account Details</a>

										<a href="login-register.jsp"><i class="fa fa-sign-out"></i> Logout</a>
									</div>
								</div>
								<!-- My Account Tab Menu End -->

								<!-- My Account Tab Content Start -->
								<div class="col-lg-9 mt-15 mt-lg-0">
									<div class="tab-content" id="myaccountContent">
										<!-- Single Tab Content Start -->
										<div class="tab-pane fade show active" id="dashboad" role="tabpanel">
											<div class="myaccount-content">
												<h3>Dashboard</h3>

												<div class="welcome">
													<p>Hello, <strong>Alex Tuntuni</strong> (If Not <strong>Tuntuni !</strong>
														<a href="login-register.jsp" class="logout"> Logout</a>)</p>
												</div>

												<p class="mb-0">From your account dashboard. you can easily check & view your recent orders, manage your shipping and billing addresses and edit your password and account details.</p>
											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="orders" role="tabpanel">
											<div class="myaccount-content">
												<h3>Orders</h3>

												<div class="myaccount-table table-responsive text-center">
													<table class="table table-bordered">
														<thead class="thead-light">
															<tr>
																<th>Order</th>
																<th>Date</th>
																<th>Status</th>
																<th>Total</th>
																<th>Action</th>
															</tr>
														</thead>

														<tbody>
															<tr>
																<td>1</td>
																<td>Aug 22, 2018</td>
																<td>Pending</td>
																<td>$3000</td>
																<td>
																	<a href="cart.jsp" class="btn">View</a>
																</td>
															</tr>
															<tr>
																<td>2</td>
																<td>July 22, 2018</td>
																<td>Approved</td>
																<td>$200</td>
																<td>
																	<a href="cart.jsp" class="btn">View</a>
																</td>
															</tr>
															<tr>
																<td>3</td>
																<td>June 12, 2017</td>
																<td>On Hold</td>
																<td>$990</td>
																<td>
																	<a href="cart.jsp" class="btn">View</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="download" role="tabpanel">
											<div class="myaccount-content">
												<h3>Downloads</h3>

												<div class="myaccount-table table-responsive text-center">
													<table class="table table-bordered">
														<thead class="thead-light">
															<tr>
																<th>Product</th>
																<th>Date</th>
																<th>Expire</th>
																<th>Download</th>
															</tr>
														</thead>

														<tbody>
															<tr>
																<td>Haven - Free Real Estate PSD Template</td>
																<td>Aug 22, 2018</td>
																<td>Yes</td>
																<td>
																	<a href="#" class="btn">Download File</a>
																</td>
															</tr>
															<tr>
																<td>HasTech - Profolio Business Template</td>
																<td>Sep 12, 2018</td>
																<td>Never</td>
																<td>
																	<a href="#" class="btn">Download File</a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="payment-method" role="tabpanel">
											<div class="myaccount-content">
												<h3>Payment Method</h3>

												<p class="saved-message">You Can't Saved Your Payment Method yet.</p>
											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="address-edit" role="tabpanel">
											<div class="myaccount-content">
												<h3>Billing Address</h3>

												<address>
                                            <p><strong>Alex Tuntuni</strong></p>
                                            <p>1355 Market St, Suite 900 <br>
                                                San Francisco, CA 94103</p>
                                            <p>Mobile: (123) 456-7890</p>
                                        </address>

												<a href="#" class="btn d-inline-block"><i class="fa fa-edit"></i> Edit Address</a>
											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="account-info" role="tabpanel">
											<div class="myaccount-content">
												<h3>Account Details</h3>

												<div class="account-details-form">
													<form action="#">
														<div class="row">
															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="first-name" class="required">First Name</label>
																	<input type="text" id="first-name" placeholder="First Name" />
																</div>
															</div>

															<div class="col-lg-6">
																<div class="single-input-item">
																	<label for="last-name" class="required">Last Name</label>
																	<input type="text" id="last-name" placeholder="Last Name" />
																</div>
															</div>
														</div>

														<div class="single-input-item">
															<label for="display-name" class="required">Display Name</label>
															<input type="text" id="display-name" placeholder="Display Name" />
														</div>

														<div class="single-input-item">
															<label for="email" class="required">Email Addres</label>
															<input type="email" id="email" placeholder="Email Address" />
														</div>

														<fieldset>
															<legend>Password change</legend>
															<div class="single-input-item">
																<label for="current-pwd" class="required">Current Password</label>
																<input type="password" id="current-pwd" placeholder="Current Password" />
															</div>

															<div class="row">
																<div class="col-lg-6">
																	<div class="single-input-item">
																		<label for="new-pwd" class="required">New Password</label>
																		<input type="password" id="new-pwd" placeholder="New Password" />
																	</div>
																</div>

																<div class="col-lg-6">
																	<div class="single-input-item">
																		<label for="confirm-pwd" class="required">Confirm Password</label>
																		<input type="password" id="confirm-pwd" placeholder="Confirm Password" />
																	</div>
																</div>
															</div>
														</fieldset>

														<div class="single-input-item">
															<button class="btn">Save Changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->
									</div>
								</div>
								<!-- My Account Tab Content End -->
							</div>
						</div>
						<!-- My Account Page End -->
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