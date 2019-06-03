﻿<%@ page import="java.sql.Connection" %>
<%@ page import="com.ht.c2c.tools.SQLTools" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.math.BigDecimal" %>
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
                                    int i = 1;
									while (cartrs.next())
									{
								%>

								<!-- 购物车列表 End -->
								<tbody>
									<tr id="itemid<%= i%>">
										<td class="pro-thumbnail">
											<a href="#"><img class="img-fluid" src="assets/img/product-1.jpg" alt="Product" /></a>
										</td>
										<td class="pro-title">
											<a href="#"><%= cartrs.getString("gname")%></a>
										</td>
										<td class="pro-price"><span class="price"><%= cartrs.getString("price")%></span></td>
										<td class="pro-quantity">
											<div class="pro-qty"><input class="num" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else if(this.value.length>4){this.value=this.value.substr(0,4)}else if (this.value.length==0){this.value=1} else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"  type="text" value="<%= cartrs.getString("num")%>"></div>
										</td>
										<td class="pro-subtotal"><span class="mod"></span></td>
										<td class="pro-remove">
											<i data-id="itemid<%= i%>" onclick="del(this)" class="fa fa-trash-o"></i>
										</td>
									</tr>
								</tbody>
								<!-- 购物车列表 End -->

								<%
                                            i++;
									}
										cartrs.close() ;
										cartstmt.close();
										cartcon.close();
									}
								%>

							</table>
						</div>
						<!-- 购物车列表区 End -->

						<!-- 购物车更新选项 Start -->
						<div class="cart-update-option d-block d-lg-flex">
							<div class="apply-coupon-wrapper"></div>
							<div class="cart-update">
                                <script>
                                    function alt(){
                                        var n = get("num");
                                        var p = get("price");
                                        var m = get("mod");
                                        var tottt = 0;
                                        for (var i = 0; i < m.length; i++){
                                            tottt +=parseInt(p[i].innerHTML*n[i].value*100)/100;
                                            //alert('num='+n[i].value+'...price='+p[i].innerHTML+'...mod='+m[i].innerHTML)
                                            alert(tottt)
                                        }
                                    };
                                </script>
								<a href="#" class="btn" onclick="alt()">更新购物车</a>
							</div>
						</div>
						<!-- 购物车更新选项 End -->
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6 ml-auto">
						<!-- Cart Calculation Area -->
						<div class="cart-calculator-wrapper">
							<h3> &nbsp;&nbsp;总计</h3>
							<div class="cart-calculate-items">
								<div class="table-responsive">
									<table class="table table-bordered">
										<tr>
											<td>&nbsp;小 计</td>
											<td id="tot"></td>
										</tr>
										<tr>
											<td>&nbsp;邮 费</td>
											<td>$70</td>
										</tr>
										<tr>
											<td>&nbsp;合 计</td>
											<td class="total-amount">$300</td>
										</tr>
									</table>
								</div>
							</div>
							<a href="checkout.jsp" class="btn">结算</a>
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
        <script language="javascript" type="text/javascript">
            function get(cl) {
                return document.getElementsByClassName(cl);
            }
            $(document).ready(function(){
                var n = get("num");
                var p = get("price");
                var m = get("mod");
                for (var tot = 0, i = 0; i < m.length; i++){
                    var reg = n[i].value*p[i].innerHTML;
                    reg = reg.toFixed(2);
                    reg = parseFloat(reg)
                    m[i].innerHTML = reg.toLocaleString();
                    tot +=parseInt(p[i].innerHTML*n[i].value*100)/100;
                }
                document.getElementById("tot").innerText = tot;
                $("input").blur(function() {
                    for (var tott = 0,i = 0; i < m.length; i++){
                        var reg = n[i].value*p[i].innerHTML;
                        reg = reg.toFixed(2);
                        reg = parseFloat(reg)
                        m[i].innerHTML = reg.toLocaleString();
                        tott +=parseInt(p[i].innerHTML*n[i].value*100)/100;
                    }
                    document.getElementById("tot").innerText = tott;
                });
            });
            function del(obj){
                var id=$(obj).data("id");
                $("#"+id).remove();
                var n = get("num");
                var p = get("price");
                var m = get("mod");
                for (var tot = 0, i = 0; i < m.length; i++){
                    var reg = n[i].value*p[i].innerHTML;
                    reg = reg.toFixed(2);
                    reg = parseFloat(reg)
                    m[i].innerHTML = reg.toLocaleString();
                    tot +=parseInt(p[i].innerHTML*n[i].value*100)/100;
                }
                document.getElementById("tot").innerText = tot;
            }
        </script>
	</body>

</html>