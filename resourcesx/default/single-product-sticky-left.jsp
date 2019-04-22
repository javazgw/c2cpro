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

		<title>Single Product :: Tienda - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
									<a href="shop.jsp">Shop</a>
								</li>
								<li>
									<a href="#" class="active">MH02-Gray</a>
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
				<div class="single-product-page-content">
					<div class="row">
						<!-- Product Thumbnail Start -->
						<div class="col-lg-5">
							<div class="product-thumbnail-wrap">
								<div class="product-thumb-gallery sticky-view">
									<a href="assets/img/product-1.jpg" class="single-gallery-item">
										<img src="assets/img/product-1.jpg" alt="Gallery" />
									</a>
									<a href="assets/img/product-2.jpg" class="single-gallery-item">
										<img src="assets/img/product-2.jpg" alt="Gallery" />
									</a>
									<a href="assets/img/product-3.jpg" class="single-gallery-item">
										<img src="assets/img/product-3.jpg" alt="Gallery" />
									</a>
									<a href="assets/img/product-4.jpg" class="single-gallery-item">
										<img src="assets/img/product-4.jpg" alt="Gallery" />
									</a>
								</div>
							</div>
						</div>
						<!-- Product Thumbnail End -->

						<!-- Product Details Start -->
						<div class="col-lg-7 order-first order-lg-last">
							<div class="product-details sidebar-active">
								<h2><a href="single-product.jsp">MH02-Gray</a></h2>

								<div class="rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-half"></i>
									<i class="fa fa-star-o"></i>
								</div>

								<span class="price">$52.00</span>

								<div class="product-info-stock-sku">
									<span class="product-stock-status text-success">In Stock</span>
									<span class="product-sku-status"><strong>SKU</strong> MH03</span>
								</div>

								<p class="products-desc">Ideal for cold-weathered training worked lorem ipsum outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, reprehenderit.</p>

								<div class="shopping-option-item">
									<h4>Color</h4>
									<ul class="color-option-select d-flex">
										<li class="color-item black">
											<div class="color-hvr">
												<span class="color-fill"></span>
												<span class="color-name">Black</span>
											</div>
										</li>

										<li class="color-item green">
											<div class="color-hvr">
												<span class="color-fill"></span>
												<span class="color-name">green</span>
											</div>
										</li>

										<li class="color-item orange">
											<div class="color-hvr">
												<span class="color-fill"></span>
												<span class="color-name">Orange</span>
											</div>
										</li>
									</ul>
								</div>

								<div class="product-quantity d-flex align-items-center">
									<div class="quantity-field">
										<label for="qty">Qty</label>
										<input type="number" id="qty" min="1" max="100" value="1" />
									</div>

									<a href="cart.jsp" class="btn btn-cart-large"><i class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>

								<div class="product-btn-group">
									<a href="wishlist.jsp" class="btn btn-round btn-cart"><i class="fa fa-heart"></i></a>
									<a href="compare.jsp" class="btn btn-round btn-cart"><i class="fa fa-exchange"></i></a>
									<a href="single-product-gruop.html" class="btn btn-round btn-cart"><i class="fa fa-envelope-o"></i></a>
								</div>
							</div>
						</div>
						<!-- Product Details End -->
					</div>

					<div class="row">
						<div class="col-lg-12">
							<!-- Product Full Description Start -->
							<div class="product-full-info-reviews">
								<!-- Single Product tab Menu -->
								<nav class="nav" id="nav-tab">
									<a class="active" id="description-tab" data-toggle="tab" href="#description">Description</a>
									<a id="reviews-tab" data-toggle="tab" href="#reviews">Reviews</a>
								</nav>
								<!-- Single Product tab Menu -->

								<!-- Single Product tab Content -->
								<div class="tab-content" id="nav-tabContent">
									<div class="tab-pane fade show active" id="description">
										<p>Stay comfortable and stay in the race no matter what the weather's up to. The Bruno Compete Hoodie's water-repellent exterior shields you from the elements, while advanced fabric technology inside wicks moisture to keep you dry.Stay comfortable and stay in the race no matter what the weather's up to. The Bruno Compete Hoodie's water-repellent exterior shields you from the elements, while advanced fabric technology inside wicks moisture to keep you dry.Stay comfortable and stay in the race no matter what the weather's up to. The Bruno Compete Hoodie's water-repellent exterior shields you from the elements, while advanced fabric technology inside wicks moisture to keep you dry.</p>

										<ul>
											<li>Adipisicing elitEnim, laborum.</li>
											<li>Lorem ipsum dolor sit</li>
											<li>Dolorem molestiae quod voluptatem! Sint.</li>
											<li>Iure obcaecati odio pariatur quae saepe!</li>
										</ul>
									</div>

									<div class="tab-pane fade" id="reviews">
										<div class="row">
											<div class="col-lg-7">
												<div class="product-ratting-wrap">
													<div class="pro-avg-ratting">
														<h4>4.5 <span>(Overall)</span></h4>
														<span>Based on 9 Comments</span>
													</div>
													<div class="ratting-list">
														<div class="sin-list float-left">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<span>(5)</span>
														</div>
														<div class="sin-list float-left">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<span>(3)</span>
														</div>
														<div class="sin-list float-left">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<span>(1)</span>
														</div>
														<div class="sin-list float-left">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<span>(0)</span>
														</div>
													</div>
													<div class="rattings-wrapper">

														<div class="sin-rattings">
															<div class="ratting-author">
																<h3>Cristopher Lee</h3>
																<div class="ratting-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<span>(5)</span>
																</div>
															</div>
															<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
														</div>

														<div class="sin-rattings">
															<div class="ratting-author">
																<h3>Nirob Khan</h3>
																<div class="ratting-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<span>(5)</span>
																</div>
															</div>
															<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
														</div>

														<div class="sin-rattings">
															<div class="ratting-author">
																<h3>MD.ZENAUL ISLAM</h3>
																<div class="ratting-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<span>(5)</span>
																</div>
															</div>
															<p>enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia res eos qui ratione voluptatem sequi Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci veli</p>
														</div>

													</div>
													<div class="ratting-form-wrapper">
														<h3>Add your Comments</h3>
														<form action="#" method="post">
															<div class="ratting-form row">
																<div class="col-12 mb-4">
																	<h5>Rating:</h5>
																	<div class="ratting-star fix">
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																		<i class="fa fa-star-o"></i>
																	</div>
																</div>
																<div class="col-md-6 col-12 mb-4">
																	<label for="name">Name:</label>
																	<input id="name" placeholder="Name" type="text">
																</div>
																<div class="col-md-6 col-12 mb-4">
																	<label for="email">Email:</label>
																	<input id="email" placeholder="Email" type="text">
																</div>
																<div class="col-12 mb-4">
																	<label for="your-review">Your Review:</label>
																	<textarea name="review" id="your-review" placeholder="Write a review"></textarea>
																</div>
																<div class="col-12">
																	<input value="add review" type="submit">
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Single Product tab Content -->
							</div>
							<!-- Product Full Description End -->
						</div>
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