<%@page pageEncoding="UTF-8"%>

<header id="header-area" class="header__3">
    <!-- Start 页眉 -->
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
                <div class="col-md-7 col-lg-6 mt-xs-10">
                    <div class="site-setting-menu">
                        <ul class="nav justify-content-center justify-content-md-end">
                            <li><a href="my-account.jsp">我的账户<%= session.getAttribute("cname")==null?"":session.getAttribute("cname")%></a></li>
                            <li><a href="cart.jsp">购物车</a></li>
                            <li><a href="login-register.jsp">登录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End 页眉 -->

    <!-- Start 顶层购物车、logo及搜索 -->
    <div class="header-middle-area">
        <div class="container">
            <div class="row">
                <!-- Logo  Start -->
                <div class="col-4 col-md-2 col-xl-3 m-auto text-center text-lg-left">
                    <a href="index.html" class="logo-wrap d-block">
                        <img src="assets/img/logo-4.png" alt="Logo" class="img-fluid" />
                    </a>
                </div>
                <!-- Logo  End -->

                <!-- 搜索 Start -->
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
                <!-- 搜索 End -->

                <!-- 购物车 Start -->
                <div class="col-12 col-md-3 col-xl-2 m-auto text-center text-lg-right mt-xs-15">
                    <div class="minicart-wrapper">
                        <%
                            if ( session.getAttribute("cname")==null ){
                        %>
                        <button onclick="location='login-register.jsp'" class="btn btn-minicart">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购物车 <sup class="cart-count">0</sup></button>
                        <div class="minicart-content">
                            <div class="mini-cart-body">
                        <%
                            }else {

                                String cname = session.getAttribute("cname").toString();
                                Connection spcon = SQLTools.getInstance().getConnection();
                                Statement spstmt = spcon.createStatement();
                                ResultSet sprs = spstmt.executeQuery("select a.num,b.gname,b.price,b.imagesid from(select * from shoppingcar where cname ='"+cname+"') as a left join (select * from gcode ) as b on a.gcode = b.gcode");

                                Connection cntcon = SQLTools.getInstance().getConnection();
                                Statement cntstmt = cntcon.createStatement();
                                ResultSet cntrs = cntstmt.executeQuery("select count(*) as cnt from(select * from shoppingcar where cname ='"+cname+"') as a left join (select * from gcode ) as b on a.gcode = b.gcode");
                                cntrs.next();
                        %>

                        <button class="btn btn-minicart">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购物车 <sup class="cart-count"><%= cntrs.getString("cnt")%></sup></button>
                        <div class="minicart-content">
                            <div class="mini-cart-body">
                                <%
                                    cntrs.close() ;
                                    cntstmt.close();
                                    cntcon.close();

                                    while (sprs.next())
                                    {

                                %>
                                    <!-- 购物车商品 Start -->
                                    <div class="single-cart-item d-flex">
                                        <figure class="product-thumb">
                                            <a href="single-product.jsp"><img src="<%= sprs.getString("imagesid")%>" alt="Products" /></a>
                                            <%--<%= sprs.getString("imagesid")%>--%>
                                        </figure>

                                        <div class="product-details">
                                            <h2><a href="single-product.jsp"><%= sprs.getString("gname")%></a></h2>
                                            <div class="cal d-flex align-items-center">
                                                <span class="quantity"><%= sprs.getString("num")%></span>
                                                <span class="multiplication">X</span>
                                                <span class="price"><%= sprs.getString("price")%></span>
                                            </div>
                                        </div>
                                        <a href="#" class="remove-icon"><i class="fa fa-trash-o"></i></a>
                                    </div>
                                    <!-- 购物车商品 End -->
                            <%

                                    }
                                    sprs.close() ;
                                    spstmt.close();
                                    spcon.close();
                             %>
                                <div class="mini-cart-footer">
                                    <a href="checkout.jsp" class="btn">Checkout</a>
                                </div>
                                <%
                                }
                            %>
                                </div>
                        </div>
                    </div>
                </div>
                <!-- 购物车 End -->
            </div>
        </div>
    </div>
    <!-- End 顶层购物车、logo及搜索 -->

    <!-- Start 开始主菜单 -->
    <div class="navigation-area">
        <div class="container">
            <div class="row">
                <!-- 类别列表 Start -->
                <div class="col-10 col-lg-3">
                    <div class="categories-list-wrap">
                        <button class="btn btn-category d-none d-lg-inline-block"><i class="fa fa-bars"></i>&nbsp;&nbsp;产品分类</button>
                        <ul class="category-list-menu" style="display: none;">
                            <!-- 类别列表循环 Start -->
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
                            <%--<li class="category-item-parent">--%>
                                <%--<a href="#" class="category-item btn-more">More Categories</a>--%>
                            <%--</li>--%>
                            <!-- 类别列表循环 End -->
                        </ul>
                    </div>
                </div>
                <!-- 类别列表 End -->

                <!-- 主菜单 Start -->
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
                <!-- 主菜单 End -->
            </div>
        </div>
    </div>
    <!-- End 开始主菜单 -->
</header>
