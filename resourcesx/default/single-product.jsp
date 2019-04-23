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

		<!--== Start 页面导航 ==-->
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
									<a href="shop.jsp">商店</a>
								</li>
								<li>
									<a href="#" class="active">${param.gname}</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--== End 页面导航 ==-->

		<!--== 产品介绍打包区域 Start ==-->
		<div id="page-content-wrapper">
			<div class="container">
				<div class="row">
					<%
                        String gcode = request.getParameter("gcode");
//						String name = request.getContextPath();
						Connection gconproduct = SQLTools.getInstance().getConnection();
						Statement gstmtproduct = gconproduct.createStatement();
						ResultSet grsproduct = gstmtproduct.executeQuery("select * from gcode where gcode = '"+gcode+"'");
						System.out.println("select * from gcode where gcode = '"+gcode+"'");
						if (grsproduct.next())
						{
					%>
					<!-- 单一产品介绍页 Start -->
					<div class="col-lg-12">
						<div class="single-product-page-content">
							<div class="row">
								<!-- 产品缩略图 Start -->
								<div class="col-lg-5">
									<div class="product-thumbnail-wrap">
										<div class="product-thumb-carousel owl-carousel">
											<div class="single-thumb-item">
												<a href="single-product.jsp"><img class="img-fluid" src="assets/img/single-pro-1.jpg" alt="Product" /></a>
											</div>

											<div class="single-thumb-item">
												<a href="single-product.jsp"><img class="img-fluid" src="assets/img/single-pro-2.jpg" alt="Product" /></a>
											</div>

											<div class="single-thumb-item">
												<a href="single-product.jsp"><img class="img-fluid" src="assets/img/single-pro-3.jpg" alt="Product" /></a>
											</div>

											<div class="single-thumb-item">
												<a href="single-product.jsp"><img class="img-fluid" src="assets/img/single-pro-4.jpg" alt="Product" /></a>
											</div>
										</div>
									</div>
								</div>
								<!-- 产品缩略图 End -->

								<!-- 产品详情 Start -->
								<div class="col-lg-7">
									<div class="product-details">
										<h2><a><%= grsproduct.getString("gname")%></a></h2>

										<div class="rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-half"></i>
											<i class="fa fa-star-o"></i>
										</div>

										<span class="price"><%= grsproduct.getString("price")%></span>

										<div class="product-info-stock-sku">
											<span class="product-stock-status text-success">有现货</span>
											<span class="product-sku-status"><strong>品牌</strong> <%= grsproduct.getString("gname")%></span>
										</div>

										<p class="products-desc"><%= grsproduct.getString("descript")%>.</p>

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

											<a href="cart.jsp" class="btn btn-cart-large"><i class="fa fa-shopping-cart"></i> Add to Cart</a>
										</div>

										<div class="product-btn-group">
											<a href="wishlist.jsp" class="btn btn-round btn-cart"><i class="fa fa-heart"></i></a>
											<%--<a href="compare.jsp" class="btn btn-round btn-cart"><i class="fa fa-exchange"></i></a>--%>
											<%--<a href="single-product-gruop.html" class="btn btn-round btn-cart"><i class="fa fa-envelope-o"></i></a>--%>
										</div>
									</div>
								</div>
								<!-- 产品详情 End -->
							</div>

							<div class="row">
								<div class="col-lg-12">
									<!-- 产品描述 Start -->
									<div class="product-full-info-reviews">
										<!-- 产品描述评价菜单 -->
										<nav class="nav" id="nav-tab">
											<a class="active" id="description-tab" data-toggle="tab" href="#description">Description</a>
											<a id="reviews-tab" data-toggle="tab" href="#reviews">Reviews</a>
										</nav>
										<!-- 产品描述评价菜单 -->

										<!-- 产品描述评价 -->
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
										<!-- 产品描述评价 -->
									</div>
									<!-- 产品描述 End -->
								</div>
							</div>
						</div>
					</div>
					<!-- 单一产品介绍页 End -->
					<%
						}
						rs.close() ;
						stmt.close();
						con.close();
					%>
				</div>
			</div>
		</div>
		<!--== 产品介绍打包区域 End ==-->


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