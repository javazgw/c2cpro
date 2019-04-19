﻿﻿<%@ page import="java.sql.Connection" %>
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

	<title>Tienda Layout 3 - Digital Products Store eCommerce Bootstrap 4 Template</title>

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

<!--== Start Header Section ==-->
<header id="header-area" class="header__3">
	<!-- Start PreHeader Area -->
	<div class="preheader-area">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-lg-6">
					<div class="preheader-contact-info d-flex align-items-center justify-content-between justify-content-md-start">
						<div class="single-contact-info">
									<span class="contact-icon">
                                <i class="fa fa-envelope"></i>
                            </span>
							<a href="mailto:your@example.com" class="contact-text">
								<strong>Email:</strong> Ht@email.com
							</a>
						</div>
						<div class="single-contact-info">
									<span class="contact-icon">
                                <i class="fa fa-phone"></i>
                            </span>
							<a href="" class="contact-text">
								<strong>Phone:</strong> 0759-1234567
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End PreHeader Area -->

	<!-- Start Header Middle Area -->
	<div class="header-middle-area">
		<div class="container">
			<div class="row">
				<!-- Logo Area Start -->
				<div class="col-4 col-md-2 col-xl-3 m-auto text-center text-lg-left">
					<a href="index.html" class="logo-wrap d-block">
						<img src="assets/img/logo-4.png" alt="Logo" class="img-fluid" />
					</a>
				</div>
				<!-- Logo Area End -->

				<!-- Search Box Area Start -->
				<div class="col-8 col-md-7 col- m-auto ">
					<div class="search-box-wrap">
						<form class="search-form d-flex" action="#" method="get">
							<input type="search" name="search" placeholder="输入并按Enter键" />
							<button class="btn btn-search"><img src="assets/img/icons/icon-search.png"
																alt="Search Icon"/>
							</button>
						</form>
					</div>
				</div>
				<!-- Search Box Area End -->

				<!-- Mini Cart Area Start -->
				<div class="col-12 col-md-3 col-xl-2 m-auto text-center text-lg-right mt-xs-15">
					<div class="minicart-wrapper">
						<button class="btn btn-minicart">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购物车 <sup class="cart-count">3</sup></button>
						<div class="minicart-content">
							<div class="mini-cart-body">
								<!-- Single Cart Item Start -->
								<div class="single-cart-item d-flex">
									<figure class="product-thumb">
										<a href="single-product.html"><img src="assets/img/product-1.jpg" alt="Products" /></a>
									</figure>

									<div class="product-details">
										<h2><a href="single-product.html">Sprite Yoga Companion</a></h2>
										<div class="cal d-flex align-items-center">
											<span class="quantity">3</span>
											<span class="multiplication">X</span>
											<span class="price">$77.00</span>
										</div>
									</div>
									<a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
								</div>
								<!-- Single Cart Item End -->

								<!-- Single Cart Item Start -->
								<div class="single-cart-item d-flex">
									<figure class="product-thumb">
										<a href="single-product.html"><img src="assets/img/product-2.jpg" alt="Products" /></a>
									</figure>
									<div class="product-details">
										<h2><a href="single-product.html">Yoga Companion Kit</a></h2>
										<div class="cal d-flex align-items-center">
											<span class="quantity">2</span>
											<span class="multiplication">X</span>
											<span class="price">$6.00</span>
										</div>
									</div>
									<a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
								</div>
								<!-- Single Cart Item End -->

								<!-- Single Cart Item Start -->
								<div class="single-cart-item d-flex">
									<figure class="product-thumb">
										<a href="single-product.html"><img src="assets/img/product-3.jpg" alt="Products" /></a>
									</figure>
									<div class="product-details">
										<h2><a href="#">Sprite Yoga Companion Kit</a></h2>
										<div class="cal d-flex align-items-center">
											<span class="quantity">1</span>
											<span class="multiplication">X</span>
											<span class="price">$116.00</span>
										</div>
									</div>
									<a href="single-product.html" class="remove-icon"><i class="fa fa-trash-o"></i></a>
								</div>
								<!-- Single Cart Item End -->
							</div>
							<div class="mini-cart-footer">
								<a href="checkout.html" class="btn">Checkout</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Mini Cart Area End -->
			</div>
		</div>
	</div>
	<!-- End Header Middle Area -->

	<!-- Start Main Menu Area -->
	<div class="navigation-area">
		<div class="container">
			<div class="row">
				<!-- Categories List Start -->
				<div class="col-10 col-lg-3">
					<div class="categories-list-wrap">
						<button class="btn btn-category d-none d-lg-inline-block"><i class="fa fa-bars"></i>&nbsp;&nbsp;产品分类</button>
						<ul class="category-list-menu">

							<%
								Connection con = SQLTools.getInstance().getConnection();
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from gcodetype");

								while (rs.next())
								{

							%>
							<li class="category-item-parent ">
								<a href="#" class="category-item arrow-toggle">
									<img src="<%= rs.getString("imagepath")%>" alt="Computer" />
									<span><%= rs.getString("typename")%></span>
								</a>

							</li>

							<%
								}

								rs.close() ;
								stmt.close();
								con.close();
							%>
							<li class="category-item-parent">
								<a href="#" class="category-item btn-more">More Categories</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- Categories List End -->

				<!-- Main Menu Start -->
				<div class="col-2 col-lg-9 d-none d-lg-block">
					<div class="main-menu-wrap">
						<nav class="mainmenu">
							<ul class="main-navbar clearfix">
								<li>
									<a href="index3.jsp">主页</a>
								</li>
								<li class="dropdown-show">
									<a href="#" class="arrow-toggle">商城</a>
									<ul class="mega-menu-wrap dropdown-nav">
										<li class="mega-menu-item">
											<a href="shop.html" class="mega-item-title">Shop PageLayout
											</a>
											<ul>
												<li>
													<a href="shop-3-grid.html">Shop 3 Column</a>
												</li>
												<li>
													<a href="shop-4-grid.html">Shop 4 Column</a>
												</li>
												<li>
													<a href="shop.html">Shop Left Sidebar</a>
												</li>
												<li>
													<a href="shop-list.html">Shop Lsiting View</a>
												</li>
												<li>
													<a href="shop-right-sidebar.html">Shop Right Sidebar</a>
												</li>
												<li>
													<a href="shop-list-left-sidebar.html">Shop Lsit left Sidebar</a>
												</li>
												<li>
													<a href="shop-list-right-sidebar.html">Shop Lsit Right Sidebar</a>
												</li>
											</ul>
										</li>

										<li class="mega-menu-item">
											<a href="single-product.html" class="mega-item-title">Single Products Style</a>
											<ul>
												<li>
													<a href="single-product-carousel.html">Single Product Carousel</a>
												</li>
												<li>
													<a href="single-product-sticky-left.html">Single Product Sticky Left
													</a>
												</li>
												<li>
													<a href="single-product-sticky-right.html">Single Product Sticky Right
													</a>
												</li>
												<li>
													<a href="single-product-gallery-left.html">Single Product Gallery Left
													</a>
												</li>
												<li>
													<a href="single-product-gallery-right.html">Single Product Gallery Right
													</a>
												</li>
												<li>
													<a href="single-product-tab-style-top.html">Single Product Tab Style Top
													</a>
												</li>
												<li>
													<a href="single-product-tab-style-left.html">Single Product Tab Style Left</a>
												</li>
												<li>
													<a href="single-product-tab-style-right.html">Single Product Tab Style Right</a>
												</li>
											</ul>
										</li>

										<li class="mega-menu-item">
											<a href="single-product.html" class="mega-item-title">Single Products
											</a>
											<ul>
												<li>
													<a href="single-product.html">Single Product</a>
												</li>
												<li>
													<a href="single-product-sale.html">Single Product Sale</a>
												</li>
												<li>
													<a href="single-product-group.html">Single Product Group</a>
												</li>
												<li>
													<a href="single-product-normal.html">Single Product Normal</a>
												</li>
												<li>
													<a href="single-product-affiliate.html">Single Product Affiliate </a>
												</li>
											</ul>
										</li>
									</ul>
								</li>
								<li class="dropdown-show">
									<a href="#" class="arrow-toggle">商城1</a>
									<ul class="mega-menu-wrap dropdown-nav">
										<li class="mega-menu-item">
											<a href="shop-list.html" class="mega-item-title">Shirt</a>
											<ul>
												<li>
													<a href="shop.html">Tops & Tees</a>
												</li>
												<li>
													<a href="shop.html">Polo Short Sleeve</a>
												</li>
												<li>
													<a href="shop.html">Graphic T-Shirts</a>
												</li>
												<li>
													<a href="shop.html">Jackets & Coats</a>
												</li>
												<li>
													<a href="shop.html">Fashion Jackets</a>
												</li>
											</ul>
										</li>

										<li class="mega-menu-item">
											<a href="shop-list.html" class="mega-item-title">Jeans</a>
											<ul>
												<li>
													<a href="shop.html">Crochet</a>
												</li>
												<li>
													<a href="shop.html">Sleeveless</a>
												</li>
												<li>
													<a href="shop.html">Stripes</a>
												</li>
												<li>
													<a href="shop.html">Sweaters</a>
												</li>
												<li>
													<a href="shop.html">Hoodies</a>
												</li>
											</ul>
										</li>

										<li class="mega-menu-item">
											<a href="shop-list.html" class="mega-item-title">Shoes</a>
											<ul>
												<li>
													<a href="shop.html">Tops & Tees</a>
												</li>
												<li>
													<a href="shop.html">Polo Short Sleeve</a>
												</li>
												<li>
													<a href="shop.html">Graphic T-Shirts</a>
												</li>
												<li>
													<a href="shop.html">Jackets & Coats</a>
												</li>
												<li>
													<a href="shop.html">Fashion Jackets</a>
												</li>
											</ul>
										</li>

										<li class="mega-menu-item">
											<a href="shop-list.html" class="mega-item-title">Watches</a>
											<ul>
												<li>
													<a href="shop.html">Crochet</a>
												</li>
												<li>
													<a href="shop.html">Sleeveless</a>
												</li>
												<li>
													<a href="shop.html">Stripes</a>
												</li>
												<li>
													<a href="shop.html">Sweaters</a>
												</li>
												<li>
													<a href="shop.html">Hoodies</a>
												</li>
											</ul>
										</li>
									</ul>
								</li>
								<li class="dropdown-show">
									<a href="#" class="arrow-toggle">商城2</a>
									<ul class="dropdown-nav">
										<li>
											<a href="cart.html">Shopping Cart</a>
										</li>
										<li>
											<a href="checkout.html">Checkout</a>
										</li>
										<li>
											<a href="compare.html">Compare</a>
										</li>
										<li>
											<a href="wishlist.html">Wishlist</a>
										</li>
										<li>
											<a href="login-register.html">Login & Register</a>
										</li>
										<li>
											<a href="my-account.html">My Account</a>
										</li>
										<li>
											<a href="404.html">404 Error</a>
										</li>
									</ul>
								</li>
								<li class="dropdown-show">
									<a href="#" class="arrow-toggle">商城3</a>
									<ul class="dropdown-nav">
										<li>
											<a href="blog.html">Blog Left Sidebar</a>
										</li>
										<li>
											<a href="blog-right-sidebar.html">Blog Right Sidebar</a>
										</li>
										<li>
											<a href="blog-grid.html">Blog Grid Layout</a>
										</li>
										<li>
											<a href="single-blog.html">Single Blog</a>
										</li>
										<li>
											<a href="single-blog-right-sidebar.html">Single Blog Right Sidebar</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="about.html">关于我们</a>
								</li>
								<li>
									<a href="contact.html">联系我们</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Main Menu End -->
			</div>
		</div>
	</div>
	<!-- End Main Menu Area -->
</header>
<!--== End Header Section ==-->



<!--== Start Product Content Wrapper ==-->
<div id="product-container-wrapper">
	<div class="container">
		<div class="row">
			<!-- Sidebar Content Start -->
			<div class="col-lg-3 order-last order-lg-first">
				<div id="home-sidebar-wrap">
					<!-- Sidebar Banner Start -->
					<div class="single-home-sidebar d-none d-lg-block">
						<div class="sidebar-body">
							<a href="shop.html" class="d-bock">
								<img src="assets/img/home3-sidebar-banner.jpg" alt="Banner" />
							</a>
						</div>
					</div>
					<!-- Sidebar Banner End -->

					<!-- Most viewed Product Start -->
					<div class="single-home-sidebar">
						<h3 class="title">MostViewed</h3>
						<div class="sidebar-body">
							<div class="sidebar-product-carousel owl-carousel">
								<div class="sidebar-carousel-item">
									<div class="product-small-list">
										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-1.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-3.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-2.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-3.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-4.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-5.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->
									</div>
								</div>

								<div class="sidebar-carousel-item">
									<div class="product-small-list">
										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-1.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-2.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-3.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-4.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-5.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->
									</div>
								</div>

								<div class="sidebar-carousel-item">
									<div class="product-small-list">
										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-1.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-2.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-3.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-4.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">MH02-Gray</a>
												</h2>
												<span class="pro-price">$20.11</span>
											</div>
										</div>
										<!-- Single Product End -->

										<!-- Single Product Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.html" class="product-thumb">
												<img src="assets/img/product-5.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.html">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- Single Product End -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Most viewed Product End -->

					<!-- Recent Post Start -->
					<div class="single-home-sidebar">
						<div class="section-title">
							<h2>Recent Posts</h2>
						</div>

						<div class="sidebar-body">
							<div class="recent-post-content">
								<div class="sidebar-post-carousel owl-carousel">
									<!-- Single Recent Post Start -->
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.html"><img src="assets/img/blog-thumb-1.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.html"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.html">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.html">20 June, 2018</a>
												<a href="single-blog.html">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum.</p>
										</div>
									</div>
									<!-- Single Recent Post End -->

									<!-- Single Recent Post Start -->
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.html"><img src="assets/img/blog-thumb-1.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.html"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.html">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.html">20 June, 2018</a>
												<a href="single-blog.html">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum.</p>
										</div>
									</div>
									<!-- Single Recent Post End -->
								</div>
							</div>
						</div>
					</div>
					<!-- Recent Post End -->

					<!-- Client Reviews Start -->
					<div class="single-home-sidebar">
						<div class="section-title">
							<h2>Client Says</h2>
						</div>

						<div class="sidebar-body">
							<div class="reviews-content">
								<div class="reviews-carousel owl-carousel">
									<!-- Single Reviews Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-1.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Stefano Colombarolli <span class="client-designation">Akamla Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- Single Reviews End -->

									<!-- Single Reviews Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-2.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Alex Tuntuni <span class="client-designation">Product Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- Single Reviews End -->

									<!-- Single Reviews Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-3.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Stefano Colombarolli <span class="client-designation">Akamla Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- Single Reviews End -->
								</div>
							</div>
						</div>
					</div>
					<!-- Client Reviews End -->
				</div>
			</div>
			<!-- Sidebar Content End -->

			<!-- Product Content Area Wrap -->
			<div class="col-lg-9" style="margin-top: 10px">

				<%


				%>

				<!-- Single Product Start -->
				<div class="col-lg-4 col-sm-6">
					<div class="single-product-item">
						<figure class="product-thumb">
							<a href="single-product.html"><img src="assets/img/product-1.jpg" alt="Product"></a>
							<a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i class="fa fa-eye"></i></a>
						</figure>
						<div class="product-details">
							<h2 class="product-title"><a href="single-product.html">Rival Field
								Messenger</a></h2>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<span class="product-price">$40.99</span>

							<p class="pro-desc">Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.</p>

							<div class="product-meta">
								<a href="#" class="btn btn-round btn-cart" title="Add to Cart"><i class="fa fa-shopping-cart"></i></a>
								<a href="wishlist.html" class="btn btn-round btn-cart" title="Add to Wishlist"><i class="fa fa-heart"></i></a>
								<a href="compare.html" class="btn btn-round btn-cart" title="Add to Compare"><i class="fa fa-exchange"></i></a>
							</div>
						</div>
					</div>
				</div>
				<!-- Single Product End -->


		</div>
	</div>
</div>
<!--== End Product Content Wrapper ==-->

<!-- Start Popular Categories -->
<section id="popular-category" class="pt-20 pt-xs-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="section-title">
					<h2>Popular Categories</h2>
				</div>
			</div>
		</div>

		<div class="popular-cate-wrap">
			<div class="row">
				<!-- Single Popular Category -->
				<div class="col-lg-6">
					<div class="single-popular-category">
						<dl class="popular-cat-list">
							<dt>Computer</dt>
							<dd>
								<a href="#">Laptop</a>
							</dd>
							<dd>
								<a href="#">Ram/Rom</a>
							</dd>
							<dd>
								<a href="#">Monitors</a>
							</dd>
						</dl>
					</div>
				</div>
				<!-- Single Popular Category End -->

				<!-- Single Popular Category -->
				<div class="col-lg-6">
					<div class="single-popular-category pop-cat-2">
						<dl class="popular-cat-list">
							<dt>Smart Phones</dt>
							<dd>
								<a href="#">Headphone</a>
							</dd>
							<dd>
								<a href="#">Earphone</a>
							</dd>
							<dd>
								<a href="#">Charger</a>
							</dd>
						</dl>
					</div>
				</div>
				<!-- Single Popular Category End -->

				<!-- Single Popular Category -->
				<div class="col-lg-6">
					<div class="single-popular-category pop-cat-3">
						<dl class="popular-cat-list">
							<dt>Camera</dt>
							<dd>
								<a href="#">Memory</a>
							</dd>
							<dd>
								<a href="#">Flash</a>
							</dd>
							<dd>
								<a href="#">Lens</a>
							</dd>
						</dl>
					</div>
				</div>
				<!-- Single Popular Category End -->

				<!-- Single Popular Category -->
				<div class="col-lg-6">
					<div class="single-popular-category pop-cat-4">
						<dl class="popular-cat-list">
							<dt>Desktop</dt>
							<dd>
								<a href="#">Keyboard</a>
							</dd>
							<dd>
								<a href="#">Speaker</a>
							</dd>
							<dd>
								<a href="#">Ram</a>
							</dd>
						</dl>
					</div>
				</div>
				<!-- Single Popular Category End -->
			</div>
		</div>
	</div>
</section>
<!-- End Popular Categories -->

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

<!--== Start Footer Area ==-->
<footer id="footer-area">
	<!-- Footer Widget Area Start -->
	<div class="footer-widget-area">
		<div class="container">
			<div class="footer-widget-content">
				<div class="row">
					<!-- Single Widget-item Start -->
					<div class="col-lg-3 col-sm-6">
						<div class="single-widget-item">
							<h3 class="widget-title">About Market</h3>
							<div class="widget-body">
								<ul class="footer-list">
									<li>
										<a href="#">My Account</a>
									</li>
									<li>
										<a href="#">Order History</a>
									</li>
									<li>
										<a href="#">Returns</a>
									</li>
									<li>
										<a href="#">Specials</a>
									</li>
									<li>
										<a href="#">Site Map</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Single Widget-item End -->

					<!-- Single Widget-item Start -->
					<div class="col-lg-3 col-sm-6">
						<div class="single-widget-item">
							<h3 class="widget-title">Customer Service</h3>
							<div class="widget-body">
								<ul class="footer-list">
									<li>
										<a href="#">Returns</a>
									</li>
									<li>
										<a href="#">Order History</a>
									</li>
									<li>
										<a href="#">My Account</a>
									</li>
									<li>
										<a href="#">Site Map</a>
									</li>
									<li>
										<a href="#">Specials</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Single Widget-item End -->

					<!-- Single Widget-item Start -->
					<div class="col-lg-3 col-sm-6">
						<div class="single-widget-item">
							<h3 class="widget-title">Information</h3>
							<div class="widget-body">
								<ul class="footer-list">
									<li>
										<a href="#">Order History</a>
									</li>
									<li>
										<a href="#">Site Map</a>
									</li>
									<li>
										<a href="#">Returns</a>
									</li>
									<li>
										<a href="#">Specials</a>
									</li>
									<li>
										<a href="#">My Account</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Single Widget-item End -->

					<!-- Single Widget-item Start -->
					<div class="col-lg-3 col-sm-6">
						<div class="single-widget-item">
							<h3 class="widget-title">Contact Us</h3>
							<div class="widget-body">
								<div class="contact-info">
									<div class="single-contact-info">
												<span class="contact-icon">
                                        <i class="fa fa-home"></i>
                                    </span>
										<a href="mailto:your@example.com" class="contact-text">
											<strong>Address:</strong> 15/C, Uttara, Dhaka
										</a>
									</div>
									<div class="single-contact-info">
												<span class="contact-icon">
                                        <i class="fa fa-phone"></i>
                                    </span>
										<a href="mailto:your@example.com" class="contact-text">
											<strong>Phone:</strong> (+1) 866-540-3229
										</a>
									</div>
									<div class="single-contact-info">
												<span class="contact-icon">
                                        <i class="fa fa-envelope"></i>
                                    </span>
										<a href="mailto:your@example.com" class="contact-text">
											<strong>Email:</strong> your@email.here
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Single Widget-item End -->
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Widget Area End -->

	<!-- Footer Bottom Area -->
	<div class="footer-bttom-area">
		<div class="container">
			<div class="row">
				<!-- Copyright Text Area -->
				<div class="col-md-6 m-auto text-center text-md-left order-last order-md-first">
					<p>Copyright © 2018
						<a href="http://www.bootstrapmb.com/">HasTech</a>. All rights reserved.</p>
				</div>
				<!-- Copyright Text Area -->

				<!-- Payment Method Area -->
				<div class="col-md-6 m-auto text-center text-md-right">
					<div class="payment-support">
						<img src="assets/img/payment.png" alt="Payment" class="d-inline-block" />
					</div>
				</div>
				<!-- Payment Method Area -->
			</div>
		</div>
	</div>
	<!-- Footer Bottom Area -->
</footer>
<!--== End Footer Area ==-->

<!-- Scroll to Top Start -->
<a href="#" class="scrolltotop"><i class="fa fa-angle-up"></i></a>
<!-- Scroll to Top End -->

<!--== Product Quick View Modal Area Wrap ==-->
<div class="modal" id="quickView" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true"><img src="assets/img/icons/cancel.png" alt="Close" class="img-fluid"/></span>
			</button>
			<div class="modal-body">
				<div class="quick-view-content single-product-page-content">
					<div class="row">
						<!-- Product Thumbnail Start -->
						<div class="col-lg-5 col-md-6">
							<div class="product-thumbnail-wrap">
								<div class="product-thumb-carousel owl-carousel">
									<div class="single-thumb-item">
										<a href="single-product.html"><img class="img-fluid" src="assets/img/single-pro-1.jpg" alt="Product" /></a>
									</div>

									<div class="single-thumb-item">
										<a href="single-product.html"><img class="img-fluid" src="assets/img/single-pro-2.jpg" alt="Product" /></a>
									</div>

									<div class="single-thumb-item">
										<a href="single-product.html"><img class="img-fluid" src="assets/img/single-pro-3.jpg" alt="Product" /></a>
									</div>

									<div class="single-thumb-item">
										<a href="single-product.html"><img class="img-fluid" src="assets/img/single-pro-4.jpg" alt="Product" /></a>
									</div>
								</div>
							</div>
						</div>
						<!-- Product Thumbnail End -->

						<!-- Product Details Start -->
						<div class="col-lg-7 col-md-6 mt-5 mt-md-0">
							<div class="product-details">
								<h2><a href="single-product.html">Crown Summit Backpack</a></h2>

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
									<span class="product-sku-status ml-5"><strong>SKU</strong> MH03</span>
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

									<a href="cart.html" class="btn">Add to Cart</a>
								</div>
							</div>
						</div>
						<!-- Product Details End -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--== Product Quick View Modal Area End ==-->

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