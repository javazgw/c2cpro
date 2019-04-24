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

		<title>Shopping Cart - Digital Products Store eCommerce Bootstrap 4 Template</title>

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
		<%
			if(session.getAttribute("cname")==null){
		%>
		<jsp:forward page="login-register.jsp" />;
		<%
		}else {
		%>

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
									<a href="shop.jsp" class="active">购物车</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--== End 页面导航 ==-->

		<!--== 页面内容封装 Start ==-->
		<div id="page-content-wrapper">
			<div class="container">
				<!-- 购物车页面内容 Start -->
				<div class="row">
					<div class="col-lg-12">
						<!-- 购物车列表区 Start -->
						<div class="cart-table table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="pro-thumbnail">缩略图</th>
										<th class="pro-title">名称</th>
										<th class="pro-price">价格</th>
										<th class="pro-quantity">数量</th>
										<th class="pro-subtotal">合计</th>
										<th class="pro-remove">移除</th>
									</tr>
								</thead>

								<%
									String cname = session.getAttribute("cname").toString();
									Connection cartcon = SQLTools.getInstance().getConnection();
									Statement cartstmt = cartcon.createStatement();
									ResultSet cartrs = cartstmt.executeQuery("select a.num,b.gname,b.price from(select * from shoppingcar where cname ='"+cname+"') as a left join (select * from gcode ) as b on a.gcode = b.gcode");
									while (cartrs.next())
									{
								%>

								<!-- 购物车列表 End -->
								<tbody>
									<tr>
										<td class="pro-thumbnail">
											<a href="#"><img class="img-fluid" src="assets/img/product-1.jpg" alt="Product" /></a>
										</td>
										<td class="pro-title">
											<a href="#"><%= cartrs.getString("gname")%></a>
										</td>
										<td class="pro-price"><span><%= cartrs.getString("price")%></span></td>
										<td class="pro-quantity">
											<%
												request.setAttribute("num",cartrs.getString("num"));
												request.setAttribute("price",cartrs.getString("price"));
											%>
											<div class="pro-qty"><input type="text" value="${num}"></div>
										</td>
										<td class="pro-subtotal"><span>${(price * num)}</span></td>
										<td class="pro-remove">
											<a href="#"><i class="fa fa-trash-o"></i></a>
										</td>
									</tr>
								</tbody>
								<!-- 购物车列表 End -->

								<%
									}
										cartrs.close() ;
										cartstmt.close();
										cartcon.close();
								%>

							</table>
						</div>
						<!-- 购物车列表区 End -->

						<!-- 购物车更新选项 Start -->
						<div class="cart-update-option d-block d-lg-flex">
							<div class="apply-coupon-wrapper">
								<form action="#" method="post" class=" d-block d-md-flex">
									<input type="text" placeholder="Enter Your Coupon Code" />
									<button class="btn">Apply Coupon</button>
								</form>
							</div>
							<div class="cart-update">
								<a href="#" class="btn">Update Cart</a>
							</div>
						</div>
						<!-- 购物车更新选项 End -->
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6 ml-auto">
						<!-- Cart Calculation Area -->
						<div class="cart-calculator-wrapper">
							<h3>Cart Totals</h3>
							<div class="cart-calculate-items">
								<div class="table-responsive">
									<table class="table table-bordered">
										<tr>
											<td>Sub Total</td>
											<td>$230</td>
										</tr>
										<tr>
											<td>Shipping</td>
											<td>$70</td>
										</tr>
										<tr>
											<td>Total</td>
											<td class="total-amount">$300</td>
										</tr>
									</table>
								</div>
							</div>
							<a href="checkout.jsp" class="btn">Proceed To Checkout</a>
						</div>
					</div>
				</div>
				<!-- 购物车页面内容 End -->
			</div>
		</div>
		<!--== 页面内容封装 End ==-->


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
<%
	}
%>