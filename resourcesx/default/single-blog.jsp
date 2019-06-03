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

		<title>Blog Details Right Sidebar - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
												<a href="single-product.jsp"><img src="assets/img/product-1.jpg" alt="Products" /></a>
											</figure>

											<div class="product-details">
												<h2><a href="single-product.jsp">Sprite Yoga Companion</a></h2>
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
												<a href="single-product.jsp"><img src="assets/img/product-2.jpg" alt="Products" /></a>
											</figure>
											<div class="product-details">
												<h2><a href="single-product.jsp">Yoga Companion Kit</a></h2>
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
												<a href="single-product.jsp"><img src="assets/img/product-3.jpg" alt="Products" /></a>
											</figure>
											<div class="product-details">
												<h2><a href="#">Sprite Yoga Companion Kit</a></h2>
												<div class="cal d-flex align-items-center">
													<span class="quantity">1</span>
													<span class="multiplication">X</span>
													<span class="price">$116.00</span>
												</div>
											</div>
											<a href="single-product.jsp" class="remove-icon"><i class="fa fa-trash-o"></i></a>
										</div>
										<!-- Single Cart Item End -->
									</div>
									<div class="mini-cart-footer">
										<a href="checkout.jsp" class="btn">Checkout</a>
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
			<div class="navigation-area" id="fixheader">
				<div class="container">
					<div class="row">
						<!-- Categories List Start -->
						<div class="col-10 col-lg-3">
							<div class="categories-list-wrap">
								<button class="btn btn-category d-none d-lg-inline-block"><i class="fa fa-bars"></i>&nbsp;&nbsp;产品分类</button>
								<ul class="category-list-menu" style="display: none;">
									<li class="category-item-parent dropdown-show">
										<a href="#" class="category-item arrow-toggle">
											<img src="assets/img/icons/desktop.png" alt="Computer" />
											<span>电脑</span>
										</a>
										<ul class="mega-menu-wrap dropdown-nav">
											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Laptop</a>
												<ul>
													<li>
														<a href="#">Has Laptop Price</a>
													</li>
													<li>
														<a href="#">Has Laptop Ram</a>
													</li>
													<li>
														<a href="#">Has Laptop Rom</a>
													</li>
													<li>
														<a href="#">Has Laptop SSD</a>
													</li>
												</ul>
											</li>

											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Desktop</a>
												<ul>
													<li>
														<a href="#">Has Laptop Price</a>
													</li>
													<li>
														<a href="#">Has Laptop Ram</a>
													</li>
													<li>
														<a href="#">Has Laptop Rom</a>
													</li>
													<li>
														<a href="#">Has Laptop SSD</a>
													</li>
												</ul>
											</li>

											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Notebook</a>
												<ul>
													<li>
														<a href="#">Has Laptop Price</a>
													</li>
													<li>
														<a href="#">Has Laptop Ram</a>
													</li>
													<li>
														<a href="#">Has Laptop Rom</a>
													</li>
													<li>
														<a href="#">Has Laptop SSD</a>
													</li>
												</ul>
											</li>
										</ul>
									</li>

									<li class="category-item-parent dropdown-show">
										<a href="#" class="category-item arrow-toggle">
											<img src="assets/img/icons/mobile.png" alt="Mobile" />
											<span>手机</span>
										</a>
										<ul class="mega-menu-wrap dropdown-nav">
											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Sumsang</a>
												<ul>
													<li>
														<a href="#">Sumsang S6</a>
													</li>
													<li>
														<a href="#">Sumsang S7</a>
													</li>
													<li>
														<a href="#">Sumsang Prime</a>
													</li>
													<li>
														<a href="#">Sumsang A6</a>
													</li>
												</ul>
											</li>

											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Ziaomi</a>
												<ul>
													<li>
														<a href="#">Ziaomi A2 Pro</a>
													</li>
													<li>
														<a href="#">Ziaomi MIX 2</a>
													</li>
													<li>
														<a href="#">Ziaomi F1</a>
													</li>
													<li>
														<a href="#">Ziaomi Prime</a>
													</li>
												</ul>
											</li>

											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Jamila</a>
												<ul>
													<li>
														<a href="#">Jamila G100</a>
													</li>
													<li>
														<a href="#">Jamila i120</a>
													</li>
													<li>
														<a href="#">Jamila i15</a>
													</li>
													<li>
														<a href="#">Jamila L62</a>
													</li>
												</ul>
											</li>

											<li class="mega-menu-item">
												<a href="#" class="mega-item-title">Nakoa</a>
												<ul>
													<li>
														<a href="#">Nakoa Lamia 820</a>
													</li>
													<li>
														<a href="#">Nakoa 888 Pro</a>
													</li>
													<li>
														<a href="#">Nakoa 81 Sirocco</a>
													</li>
													<li>
														<a href="#">Nakoa Lamia 1520</a>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li class="category-item-parent">
										<a href="#" class="category-item">
											<img src="assets/img/icons/camera.png" alt="Camera" />
											<span>相机</span>
										</a>
									</li>
									<li class="category-item-parent">
										<a href="#" class="category-item">
											<img src="assets/img/icons/fan.png" alt="Camera" />
											<span>家电</span>
										</a>
									</li>
									<li class="category-item-parent">
										<a href="#" class="category-item">
											<img src="assets/img/icons/games.png" alt="Camera" />
											<span>游戏娱乐</span>
										</a>
									</li>
									<li class="category-item-parent">
										<a href="#" class="category-item">
											<img src="assets/img/icons/tv.png" alt="Camera" />
											<span>电视机</span>
										</a>
									</li>
									<li class="category-item-parent">
										<a href="#" class="category-item">
											<img src="assets/img/icons/desktop.png" alt="Computer" />
											<span>电脑1</span>
										</a>
									</li>
									<li class="category-item-parent hidden">
										<a href="#" class="category-item">
											<img src="assets/img/icons/mobile.png" alt="Mobile" />
											<span>电脑2</span>
										</a>
									</li>
									<li class="category-item-parent hidden">
										<a href="#" class="category-item">
											<img src="assets/img/icons/camera.png" alt="Camera" />
											<span>电脑3</span>
										</a>
									</li>
									<li class="category-item-parent hidden">
										<a href="#" class="category-item">
											<img src="assets/img/icons/fan.png" alt="Camera" />
											<span>电脑4</span>
										</a>
									</li>
									<li class="category-item-parent hidden">
										<a href="#" class="category-item">
											<img src="assets/img/icons/games.png" alt="Camera" />
											<span>电脑5</span>
										</a>
									</li>
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
													<a href="shop.jsp" class="mega-item-title">Shop PageLayout
													</a>
													<ul>
														<li>
															<a href="shop-3-grid.jsp">Shop 3 Column</a>
														</li>
														<li>
															<a href="shop-4-grid.jsp">Shop 4 Column</a>
														</li>
														<li>
															<a href="shop.jsp">Shop Left Sidebar</a>
														</li>
														<li>
															<a href="shop-list.jsp">Shop Lsiting View</a>
														</li>
														<li>
															<a href="shop-right-sidebar.jsp">Shop Right Sidebar</a>
														</li>
														<li>
															<a href="shop-list-left-sidebar.jsp">Shop Lsit left Sidebar</a>
														</li>
														<li>
															<a href="shop-list-right-sidebar.jsp">Shop Lsit Right Sidebar</a>
														</li>
													</ul>
												</li>

												<li class="mega-menu-item">
													<a href="single-product.jsp" class="mega-item-title">Single Products Style</a>
													<ul>
														<li>
															<a href="single-product-carousel.jsp">Single Product Carousel</a>
														</li>
														<li>
															<a href="single-product-sticky-left.jsp">Single Product Sticky Left
															</a>
														</li>
														<li>
															<a href="single-product-sticky-right.jsp">Single Product Sticky Right
															</a>
														</li>
														<li>
															<a href="single-product-gallery-left.jsp">Single Product Gallery Left
															</a>
														</li>
														<li>
															<a href="single-product-gallery-right.jsp">Single Product Gallery Right
															</a>
														</li>
														<li>
															<a href="single-product-tab-style-top.jsp">Single Product Tab Style Top
															</a>
														</li>
														<li>
															<a href="single-product-tab-style-left.jsp">Single Product Tab Style Left</a>
														</li>
														<li>
															<a href="single-product-tab-style-right.jsp">Single Product Tab Style Right</a>
														</li>
													</ul>
												</li>

												<li class="mega-menu-item">
													<a href="single-product.jsp" class="mega-item-title">Single Products
													</a>
													<ul>
														<li>
															<a href="single-product.jsp">Single Product</a>
														</li>
														<li>
															<a href="single-product-sale.jsp">Single Product Sale</a>
														</li>
														<li>
															<a href="single-product-group.jsp">Single Product Group</a>
														</li>
														<li>
															<a href="single-product-normal.jsp">Single Product Normal</a>
														</li>
														<li>
															<a href="single-product-affiliate.jsp">Single Product Affiliate </a>
														</li>
													</ul>
												</li>
											</ul>
										</li>
										<li class="dropdown-show">
											<a href="#" class="arrow-toggle">商城1</a>
											<ul class="mega-menu-wrap dropdown-nav">
												<li class="mega-menu-item">
													<a href="shop-list.jsp" class="mega-item-title">Shirt</a>
													<ul>
														<li>
															<a href="shop.jsp">Tops & Tees</a>
														</li>
														<li>
															<a href="shop.jsp">Polo Short Sleeve</a>
														</li>
														<li>
															<a href="shop.jsp">Graphic T-Shirts</a>
														</li>
														<li>
															<a href="shop.jsp">Jackets & Coats</a>
														</li>
														<li>
															<a href="shop.jsp">Fashion Jackets</a>
														</li>
													</ul>
												</li>

												<li class="mega-menu-item">
													<a href="shop-list.jsp" class="mega-item-title">Jeans</a>
													<ul>
														<li>
															<a href="shop.jsp">Crochet</a>
														</li>
														<li>
															<a href="shop.jsp">Sleeveless</a>
														</li>
														<li>
															<a href="shop.jsp">Stripes</a>
														</li>
														<li>
															<a href="shop.jsp">Sweaters</a>
														</li>
														<li>
															<a href="shop.jsp">Hoodies</a>
														</li>
													</ul>
												</li>

												<li class="mega-menu-item">
													<a href="shop-list.jsp" class="mega-item-title">Shoes</a>
													<ul>
														<li>
															<a href="shop.jsp">Tops & Tees</a>
														</li>
														<li>
															<a href="shop.jsp">Polo Short Sleeve</a>
														</li>
														<li>
															<a href="shop.jsp">Graphic T-Shirts</a>
														</li>
														<li>
															<a href="shop.jsp">Jackets & Coats</a>
														</li>
														<li>
															<a href="shop.jsp">Fashion Jackets</a>
														</li>
													</ul>
												</li>

												<li class="mega-menu-item">
													<a href="shop-list.jsp" class="mega-item-title">Watches</a>
													<ul>
														<li>
															<a href="shop.jsp">Crochet</a>
														</li>
														<li>
															<a href="shop.jsp">Sleeveless</a>
														</li>
														<li>
															<a href="shop.jsp">Stripes</a>
														</li>
														<li>
															<a href="shop.jsp">Sweaters</a>
														</li>
														<li>
															<a href="shop.jsp">Hoodies</a>
														</li>
													</ul>
												</li>
											</ul>
										</li>
										<li class="dropdown-show">
											<a href="#" class="arrow-toggle">商城2</a>
											<ul class="dropdown-nav">
												<li>
													<a href="cart.jsp">Shopping Cart</a>
												</li>
												<li>
													<a href="checkout.jsp">Checkout</a>
												</li>
												<li>
													<a href="compare.jsp">Compare</a>
												</li>
												<li>
													<a href="wishlist.jsp">Wishlist</a>
												</li>
												<li>
													<a href="login-register.jsp">Login & Register</a>
												</li>
												<li>
													<a href="my-account.jsp">My Account</a>
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
													<a href="blog.jsp">Blog Left Sidebar</a>
												</li>
												<li>
													<a href="blog-right-sidebar.jsp">Blog Right Sidebar</a>
												</li>
												<li>
													<a href="blog-grid.jsp">Blog Grid Layout</a>
												</li>
												<li>
													<a href="single-blog.jsp">Single Blog</a>
												</li>
												<li>
													<a href="single-blog-right-sidebar.jsp">Single Blog Right Sidebar</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="about.jsp">关于我们</a>
										</li>
										<li>
											<a href="contact.jsp">联系我们</a>
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
									<a href="blog.jsp">Blog</a>
								</li>
								<li>
									<a href="single-blog.jsp" class="active">Blog Details Right Sidebar</a>
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
					<!-- Sidebar Area Start -->
					<div class="col-lg-4 order-last order-lg-first">
						<div id="sidebar-area-wrap">
							<!-- Single Sidebar Item Start -->
							<div class="single-sidebar-wrap">
								<h2 class="sidebar-title">Search</h2>
								<div class="sidebar-body">
									<div class="sidebar-search">
										<form action="#">
											<input type="search" placeholder="type keyword" />
											<button type="submit"><i class="fa fa-search"></i></button>
										</form>
									</div>
								</div>
							</div>
							<!-- Single Sidebar Item End -->

							<!-- Single Sidebar Item Start -->
							<div class="single-sidebar-wrap">
								<h2 class="sidebar-title">Recent Post</h2>
								<div class="sidebar-body">
									<div class="recent-post-sidebar">
										<!-- Single Recent Posts Start -->
										<div class="single-post-item d-flex">
											<a href="single-blog.jsp" class="post-thumb">
												<img src="assets/img/blog-thumb-1.jpg" alt="Blog" />
											</a>
											<div class="product-details">
												<h2><a href="single-blog.jsp">Lorem ipsum onsectetur adipisicing</a></h2>
												<span class="date">20, Aug 2018</span>
												<a href="#" class="btn-readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
											</div>
										</div>
										<!-- Single Recent Posts End -->

										<!-- Single Recent Posts Start -->
										<div class="single-post-item d-flex">
											<a href="single-blog.jsp" class="post-thumb">
												<img src="assets/img/blog-thumb-2.jpg" alt="Blog" />
											</a>
											<div class="product-details">
												<h2><a href="single-blog.jsp">Dolor iorem ipsum  sit amet</a></h2>
												<span class="date">10, Aug 2018</span>
												<a href="#" class="btn-readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
											</div>
										</div>
										<!-- Single Recent Posts End -->

										<!-- Single Recent Posts Start -->
										<div class="single-post-item d-flex">
											<a href="single-blog.jsp" class="post-thumb">
												<img src="assets/img/blog-thumb-3.jpg" alt="Blog" />
											</a>
											<div class="product-details">
												<h2><a href="single-blog.jsp">Mirum Est Notare Quam</a></h2>
												<span class="date">8, Aug 2018</span>
												<a href="#" class="btn-readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
											</div>
										</div>
										<!-- Single Recent Posts End -->

										<!-- Single Recent Posts Start -->
										<div class="single-post-item d-flex">
											<a href="single-blog.jsp" class="post-thumb">
												<img src="assets/img/blog-thumb-4.jpg" alt="Blog" />
											</a>
											<div class="product-details">
												<h2><a href="single-blog.jsp">Lorem ipsum onsectetur adipisicing</a></h2>
												<span class="date">20, Aug 2018</span>
												<a href="#" class="btn-readmore">Read More <i class="fa fa-long-arrow-right"></i></a>
											</div>
										</div>
										<!-- Single Recent Posts End -->
									</div>
								</div>
							</div>
							<!-- Single Sidebar Item End -->

							<!-- Single Sidebar Item Start -->
							<div class="single-sidebar-wrap">
								<h2 class="sidebar-title">Top Categories</h2>
								<div class="sidebar-body">
									<ul class="sidebar-list">
										<li>
											<a href="#">Tops &amp; Tees <span>(10)</span></a>
										</li>
										<li>
											<a href="#">Polo Short Sleeve <span>(09)</span></a>
										</li>
										<li>
											<a href="#">Graphic T-Shirts <span>(55)</span></a>
										</li>
										<li>
											<a href="#">Jackets &amp; Coats <span>(99)</span></a>
										</li>
										<li>
											<a href="#">Fashion Jackets <span>(14)</span></a>
										</li>
									</ul>
								</div>
							</div>
							<!-- Single Sidebar Item End -->

							<!-- Single Sidebar Item Start -->
							<div class="single-sidebar-wrap">
								<h2 class="sidebar-title">Popular Tags</h2>
								<div class="sidebar-body">
									<ul class="tags">
										<li>
											<a href="#">Tops</a>
										</li>
										<li>
											<a href="#">Tees</a>
										</li>
										<li>
											<a href="#">Polo</a>
										</li>
										<li>
											<a href="#">T-Shirts</a>
										</li>
										<li>
											<a href="#">Fashion</a>
										</li>
										<li>
											<a href="#">Jeans</a>
										</li>
										<li>
											<a href="#">Pants</a>
										</li>
										<li>
											<a href="#">Necessitatibus</a>
										</li>
										<li>
											<a href="#">Jackets</a>
										</li>
										<li>
											<a href="#">Coats</a>
										</li>
									</ul>
								</div>
							</div>
							<!-- Single Sidebar Item End -->
						</div>
					</div>
					<!-- Sidebar Area Start -->

					<!-- Single Blog Page Content -->
					<div class="col-lg-8">
						<article class="single-blog-content-wrap">
							<div class="post-header">
								<figure class="post-thumbnail">
									<img src="assets/img/single-blog.jpg" class="img-fluid" alt="Blog" />
								</figure>

								<div class="post-meta">
									<h2>Financial Investment: The Right Way</h2>
									<div class="post-info">
										<a href="#"><i class="fa fa-user"></i> Albert Flores</a>
										<a href="#"><i class="fa fa-calendar"></i> 08/20/2018</a>
									</div>
								</div>
							</div>

							<div class="post-content">
								<p>Lorem ipsum dolor sit amet, consectetur adipisici elit. Culpa, dolorem earum eius eum, exercitationem explicabo facilis harum sillo ipsum isted odio placeated quaerated quisquam ratione suscipit tempora temporibus veniam. Ab ad aliquam amet at blanditiis delectus distinctio dolorem eaque eum, eveniet id, non nulla obcaecati perferendis ratione repellat sapiente soluta.</p>

								<p>Lorem ipsum dolor sit amet, consectetur adipisici elit. Culpa, dolorem earum eius eum, exercitationem explicabo facilis harum sillo ipsum isted odio placeated quaerated quisquam ratione suscipit tempora temporibus veniam. Ab ad aliquam amet at blanditiis delectus distinctio dolorem eaque eum, eveniet id, non nulla obcaecati perferendis ratione repellat sapiente soluta.</p>

								<blockquote class="blockquote">
									<p>Placeated quaerated quisquam rationed suscipite tempora temporibus veniam. Ab ad aliquam amet at blanditiis delectus distinctio dolorem eaque eum, eveniet id, non nulla obcaecati perferendis ratione repellat sapiente soluta</p>
								</blockquote>

								<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as posed to using Content here, content here', making it look like readable</p>

								<img src="assets/img/single-blog-2.jpg" class="img-fluid" alt="Blog" />

								<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as posed to using Content here, content here', making it look like readable</p>
							</div>

							<div class="post-footer d-block d-sm-flex justify-content-sm-between align-items-center">
								<ul class="tags">
									<li>
										<a href="#">Fashion</a>
									</li>
									<li>
										<a href="#">Sale</a>
									</li>
									<li>
										<a href="#">Investment</a>
									</li>
								</ul>

								<div class="post-share mt-3 mt-sm-0">
									<a href="#"><i class="fa fa-facebook"></i></a>
									<a href="#"><i class="fa fa-twitter"></i></a>
									<a href="#"><i class="fa fa-reddit"></i></a>
									<a href="#"><i class="fa fa-digg"></i></a>
								</div>
							</div>
						</article>

						<!-- Comment Area Start -->
						<div class="comment-area-wrapper">
							<div class="comments-preview-area comment-single-item">
								<h2>Comments (3)</h2>

								<div class="single-comment d-block d-md-flex">
									<div class="comment-author">
										<a href="#"><img src="assets/img/author-1.jpg" class="img-fluid" alt="Comment User" /></a>
									</div>
									<div class="comment-info mt-3 mt-md-0">
										<div class="comment-info-top d-flex justify-content-between">
											<h3>Houdai Man</h3>
											<a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
										</div>
										<a href="#" class="comment-date">19 JULY 2017, 10:05 PM</a>
										<p>On the other hand, we with righteous indignation and dislike men ware sobeguil andlo demized by the charms of pleasure of the moment.</p>
									</div>
								</div>

								<div class="single-comment reply d-block d-md-flex">
									<div class="comment-author">
										<a href="#"><img src="assets/img/author-2.jpg" class="img-fluid" alt="Comment User" /></a>
									</div>
									<div class="comment-info mt-3 mt-md-0">
										<div class="comment-info-top d-flex justify-content-between">
											<h3>Alex Tuntuni</h3>
											<a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
										</div>
										<a href="#" class="comment-date">19 JULY 2017, 10:05 PM</a>
										<p>On the other hand indignation and dislike men ware sobeguil andlo demized by the charms of pleasure of the moment.</p>
									</div>
								</div>

								<div class="single-comment d-block d-md-flex">
									<div class="comment-author">
										<a href="#"><img src="assets/img/author-3.jpg" class="img-fluid" alt="Comment User" /></a>
									</div>
									<div class="comment-info mt-3 mt-md-0">
										<div class="comment-info-top d-flex justify-content-between">
											<h3>Dig Kamla</h3>
											<a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
										</div>
										<a href="#" class="comment-date">19 JULY 2017, 10:05 PM</a>
										<p>On the other hand, we with righteous indignation and dislike men ware sobeguil andlo demized by the charms of pleasure of the moment.</p>
									</div>
								</div>
							</div>

							<div class="leave-comment-area comment-single-item">
								<h2>Leave a Comment</h2>
								<div class="comment-form-wrap">
									<form action="#" method="get">
										<div class="row">
											<div class="col-lg-6">
												<div class="single-input-item">
													<input type="text" placeholder="Name" required/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="single-input-item">
													<input type="email" placeholder="Email Address" required/>
												</div>
											</div>
										</div>

										<div class="single-input-item">
											<input type="url" placeholder="Website" required/>
										</div>

										<div class="single-input-item">
											<textarea name="comment" id="comment" cols="30" rows="6" placeholder="Write your Comment"></textarea>
										</div>

										<div class="single-input-item">
											<button type="submit" class="btn">Submit Comment</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Single Blog Page Content -->
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