<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

<%@ include file="header.jsp" %>

<div id="product-container-wrapper">
<!--== Start 产品展示区 ==-->
	<div class="container">
		<div class="row">
			<!-- 侧栏内容 Start -->
			<div class="col-lg-3 order-last order-lg-first">
				<div id="home-sidebar-wrap">
					<!-- 侧栏海报 Start -->
					<div class="single-home-sidebar d-none d-lg-block">
						<div class="sidebar-body">
							<a href="shop.jsp" class="d-bock">
								<img src="assets/img/home3-sidebar-banner.jpg" alt="Banner" />
							</a>
						</div>
					</div>
					<!-- 侧栏海报 End -->

					<!-- 侧栏热门产品 Start -->
					<div class="single-home-sidebar">
						<h3 class="title">MostViewed</h3>
						<div class="sidebar-body">
							<div class="sidebar-product-carousel owl-carousel">
								<div class="sidebar-carousel-item">
									<div class="product-small-list">
										<!-- 热门产品 Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.jsp" class="product-thumb">
												<img src="assets/img/product-1.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.jsp">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- 热门产品 End -->

										<!-- 热门产品 Start -->
										<div class="single-pro-item d-flex">
											<a href="single-product.jsp" class="product-thumb">
												<img src="assets/img/product-3.jpg" alt="Product" />
											</a>
											<div class="pro-details">
												<h2>
													<a href="single-product.jsp">Compete Hoodie</a>
												</h2>
												<span class="pro-price">$30.33</span>
											</div>
										</div>
										<!-- 热门产品 End -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 侧栏热门产品 End -->

					<!-- 近期动态 Start -->
					<div class="single-home-sidebar">
						<div class="section-title">
							<h2>Recent Posts</h2>
						</div>

						<div class="sidebar-body">
							<div class="recent-post-content">
								<div class="sidebar-post-carousel owl-carousel">
									<!-- 单个最近发布 Start -->
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
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum.</p>
										</div>
									</div>
									<!-- 单个最近发布 End -->

									<!-- 单个最近发布 Start -->
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
											<p>Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum.</p>
										</div>
									</div>
									<!-- 单个最近发布 End -->
								</div>
							</div>
						</div>
					</div>
					<!-- 近期动态 End -->

					<!-- 客户评论 Start -->
					<div class="single-home-sidebar">
						<div class="section-title">
							<h2>Client Says</h2>
						</div>

						<div class="sidebar-body">
							<div class="reviews-content">
								<div class="reviews-carousel owl-carousel">
									<!-- 单一评论 Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-1.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Stefano Colombarolli <span class="client-designation">Akamla Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- 单一评论 End -->

									<!-- 单一评论 Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-2.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Alex Tuntuni <span class="client-designation">Product Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- 单一评论 End -->

									<!-- 单一评论 Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-3.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Stefano Colombarolli <span class="client-designation">Akamla Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- 单一评论 End -->
									<!-- 单一评论 Start -->
									<div class="single-reviews">
										<a href="#" class="client-thumb">
											<img src="assets/img/client-3.jpg" alt="Cliebt" />
										</a>
										<a href="#" class="client-name">Stefano Colombarolli <span class="client-designation">Akamla Manager</span></a>

										<p class="client-quote">All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you !</p>
									</div>
									<!-- 单一评论 End -->
								</div>
							</div>
						</div>
					</div>
					<!-- 客户评论 End -->
				</div>
			</div>
			<!-- 侧栏内容 End -->

			<!-- Start 产品展示区 -->
			<div class="col-lg-9 order-first order-lg-last" style="margin-top: 10px">
				<div class="shop-page-content-wrap">
					<div class="shop-page-products-wrap">
						<div class="products-wrapper">
							<div class="row">
								<!-- 产品循环 Start -->
								<%




									int curpage = request.getParameter("curpage")==null?1:Integer.parseInt(request.getParameter("curpage"));
									int onepagenum=request.getParameter("onepagenum")==null?12:Integer.parseInt(request.getParameter("onepagenum"));;
									String pageurl = "index3.jsp?1=1";
									String totalsql = "select count(*) as c from gcode ";
									String sql = "select * from gcode limit "+(curpage-1)*onepagenum+","+onepagenum;

									Connection con1 = SQLTools.getInstance().getConnection();
									Statement stmt1 = con1.createStatement();
									ResultSet rs1 = stmt1.executeQuery(sql);

									while (rs1.next())
									{

								%>
								<!-- 单一产品 Start -->
								<div class="col-lg-4 col-sm-6">
									<div class="single-product-item">
										<figure class="product-thumb">
											<a href="single-product.jsp?code=<%= rs1.getString("gcode")%>&name=<%= rs1.getString("gname")%>"><img src="assets/img/product-1.jpg" alt="Product"></a>
										</figure>
										<div class="product-details">
											<h2 class="product-title"><a href="single-product.jsp?code=<%= rs1.getString("gcode")%>&name=<%= rs1.getString("gname")%>"><%= rs1.getString("gname")%></a></h2>
											<div class="rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<span class="product-price">¥<%= rs1.getString("price")%></span>
											<div class="product-meta">
												<a href="#" onclick="javascript:addtocar(<%= rs1.getString("gcode")%>)" class="btn btn-round btn-cart" title="Add to Cart"><i class="fa fa-shopping-cart"></i></a>
												<%--<a href="wishlist.jsp" class="btn btn-round btn-cart" title="Add to Wishlist"><i class="fa fa-heart"></i></a>--%>
												<%--<a href="compare.jsp" class="btn btn-round btn-cart" title="Add to Compare"><i class="fa fa-exchange"></i></a>--%>
											</div>
										</div>
									</div>
								</div>
								<!-- 单一产品 End -->
								<%
									}
									rs1.close() ;
									stmt1.close();
									con1.close();
								%>
								<!-- 产品循环 End -->
							</div>
						</div>
					</div>




					<jsp:include page='<%= "/public/page.jsp?pageurl="+pageurl+"&sql="+totalsql%>' ></jsp:include>


				</div>
			</div>
			<!-- End 产品展示区 -->


	</div>
</div>
<!--== End 产品展示区 ==-->

<!-- Start 热门类别 -->
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
<!-- End 热门类别  -->

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
</div>

<script>
	function  addtocar(gcode) {
        $.post( '/cc?action=addshopingcar&gcode='+gcode+"&num=1", function(data) {

                if(data.type==1001)
                {
                    
                }
                else {
                    log(data.msg);
                }
            },
            'json' // I expect a JSON response
        );
    }
</script>
</body>

</html>