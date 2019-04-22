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

		<title>Blog Grid 3 Column - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
									<a href="shop.jsp" class="active">Blog Grid 3 Column</a>
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
					<!-- Blog Content Start -->
					<div class="col-lg-12">
						<div class="blog-content-wrapper">
							<div class="row">
								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-1.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->

								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-2.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->

								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-3.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->

								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-4.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->

								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-1.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->

								<!-- Single Recent Post Start -->
								<div class="col-md-6">
									<div class="single-blog-wrap">
										<figure class="blog-thumb">
											<a href="single-blog.jsp"><img src="assets/img/blog-thumb-3.jpg" alt="Blog" /></a>
											<figcaption class="blog-icon">
												<a href="single-blog.jsp"><i class="fa fa-file-image-o"></i></a>
											</figcaption>
										</figure>

										<div class="blog-details">
											<h3><a href="single-blog.jsp">Mirum est notare quam</a></h3>
											<div class="post-meta">
												<a href="single-blog.jsp">20 June, 2018</a>
												<a href="single-blog.jsp">Post By: Tuntuni</a>
											</div>
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, voluptatibus.</p>

											<a href="single-blog.jsp" class="btn-readmore mt-15 d-block">Read More <i class="fa fa-long-arrow-right"></i></a>

										</div>
									</div>
								</div>
								<!-- Single Recent Post End -->
							</div>

							<div class="row">
								<!-- Pagination Area Start -->
								<div class="col-lg-12">
									<nav class="page-pagination">
										<ul class="pagination justify-content-center">
											<li>
												<a href="#" aria-label="Previous">&laquo;</a>
											</li>
											<li>
												<a class="current" href="#">1</a>
											</li>
											<li>
												<a href="#">2</a>
											</li>
											<li>
												<a href="#">3</a>
											</li>
											<li>
												<a href="#">..</a>
											</li>
											<li>
												<a href="#">99</a>
											</li>
											<li>
												<a href="#" aria-label="Next">&raquo;</a>
											</li>
										</ul>
									</nav>
								</div>
								<!-- Pagination Area End -->
							</div>
						</div>
					</div>
					<!-- Blog Content End -->
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