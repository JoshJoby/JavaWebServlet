<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.SignInServlet" %>
<!doctype html>   
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>amazon | Product Page</title>
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    <link href="assets/css/styleprod.css" rel="stylesheet"/>
    		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
		<link rel="stylesheet" href="assets/css/linearicons.css">

		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
		<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>
		
<header style="background: #ffffff;" id="home" class="welcome-hero">
<div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
	<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <!-- Start Top Search -->
				        <div class="top-search">
				            <div class="container">
				                <div class="input-group">
				                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
				                    <input type="text" class="form-control" placeholder="Search">
				                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
				                </div>
				            </div>
				        </div>
				        <!-- End Top Search -->

				        <div class="container">            
				            <!-- Start Atribute Navigation -->
				            <div class="attr-nav">
				                <ul>
				                	<li class="search">
				                		<a href="#"><span class="lnr lnr-magnifier"></span></a>
				                	</li><!--/.search-->				                	
				                	<li class="nav-setting">
									<a href="SignUp.jsp" class="addMore" title="Sign in!"><div class="lnr lnr-user"></div></a>
				                	</li><!--/.search-->
				                	<li class="nav-setting">
				                	<%if((boolean)request.getAttribute("isAuth")){%>
									<a href="home.jsp" class="addMore" title="Log out!" onclick=<%request.setAttribute("isAuth", false); SignInServlet.isLoggedIn=false;%>><div class="lnr lnr-moon"></div></a>
				                	 <%}%>
				                	</li><!--/.search-->				             
				                    <li class="dropdown">
				                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
				                            <span class="lnr lnr-cart"></span>
											<span class="badge badge-bg-1">2</span>
				                        </a>
				                        <ul class="dropdown-menu cart-list s-cate">
				                            <li class="single-cart-list">
				                                <a href="#" class="photo"><img src="assets/images/collection/arrivals1.png" class="cart-thumb" alt="image" /></a>
				                                <div class="cart-list-txt">
				                                	<h6><a href="#">arm <br> chair</a></h6>
				                                	<p>1 x - <span class="price">$180.00</span></p>
				                                </div><!--/.cart-list-txt-->
				                                <div class="cart-close">
				                                	<span class="lnr lnr-cross"></span>
				                                </div><!--/.cart-close-->
				                            </li><!--/.single-cart-list -->
				                            <li class="single-cart-list">
				                                <a href="#" class="photo"><img src="assets/images/collection/arrivals2.png" class="cart-thumb" alt="image" /></a>
				                                <div class="cart-list-txt">
				                                	<h6><a href="#">single <br> armchair</a></h6>
				                                	<p>1 x - <span class="price">$180.00</span></p>
				                                </div><!--/.cart-list-txt-->
				                                <div class="cart-close">
				                                	<span class="lnr lnr-cross"></span>
				                                </div><!--/.cart-close-->
				                            </li><!--/.single-cart-list -->
				                            <li class="single-cart-list">
				                                <a href="#" class="photo"><img src="assets/images/collection/arrivals3.png" class="cart-thumb" alt="image" /></a>
				                                <div class="cart-list-txt">
				                                	<h6><a href="#">wooden arn <br> chair</a></h6>
				                                	<p>1 x - <span class="price">$180.00</span></p>
				                                </div><!--/.cart-list-txt-->
				                                <div class="cart-close">
				                                	<span class="lnr lnr-cross"></span>
				                                </div><!--/.cart-close-->
				                            </li><!--/.single-cart-list -->
				                            <li class="total">
				                                <span>Total: $0.00</span>
				                                <button class="btn-cart pull-right" onclick="window.location.href='#'">view cart</button>
				                            </li>				                            
				                        </ul>
				                       
				                    </li><!--/.dropdown-->
				                    
				                </ul>
				            </div><!--/.attr-nav-->
				            <!-- End Atribute Navigation -->

				            <!-- Start Header Navigation -->
				            <div class="navbar-header">
				                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
				                    <i class="fa fa-bars"></i>
				                </button>
				                <a class="navbar-brand" href="home.jsp">Chilli<span>Gobi!</span></a>

				            </div><!--/.navbar-header-->
				            <!-- End Header Navigation -->
							
				            <!-- Collect the nav links, forms, and other content for toggling -->
				            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
				                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
				                    <li ><a href="home.jsp">home</a></li>
				                    <li ><a href="home.jsp#new-arrivals">new arrival</a></li>
				                    <li ><a href="home.jsp#feature">features</a></li>
				                    <li ><a href="home.jsp#blog">blog</a></li>
				                    <li ><a href="home.jsp#newsletter">contact</a></li>
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>
			</div>
		</div>
</header>
<hr>

    <section id="product-info">

        <div class="item-image-parent">
            <div class="item-list-vertical">
                <div class="thumb-box">
                    <img src="https://i.ibb.co/VJf6fXm/thumb1.jpg" alt="thumbnail" />
                </div>
                <div class="thumb-box">
                    <img src="https://i.ibb.co/Jt5zc58/thumb2.jpg" alt="thumbnail" />
                </div>
                <div class="thumb-box">
                    <img src="https://i.ibb.co/Yf9LMpy/thumb3.jpg" alt="thumbnail" />
                </div>
                <div class="thumb-box">
                    <img src="https://i.ibb.co/60hPGy2/thumb4.jpg" alt="thumbnail" />
                </div>

            </div>
            <div class="item-image-main">
                <img src="https://i.ibb.co/xYpFY0T/item1.jpg" alt="default" />
            </div>
        </div>

        <div class="item-info-parent">
            <!-- main info -->
            <div class="main-info">
                <h4>EYEBOGLER Regular Fit Men's Cotton T-Shirt</h4>
                <div class="star-rating">
                    <span>★★★★</span>★            
                </div>
                <p>Price: <span id="price">₹ 449.00</span></p>
            </div>
            <!-- Choose -->
            <div class="select-items">
                
                <div class="change-color">
                    <label><b>Colour:</b> Black</label><br>
                    <div class="thumb-box">
                        <img src="https://i.ibb.co/QjkJJk3/select1.jpg" alt="thumbnail" />
                    </div>
                    <div class="thumb-box">
                        <img src="https://i.ibb.co/C297yD0/select2.jpg" alt="thumbnail" />
                    </div>
                </div>
                
                <div class="change-size">
                    <label><b>Size:</b></label><br>
                    <select>
                        <option>S</option>
                        <option>M</option>
                        <option>L</option>
                        <option>XL</option>
                        <option>2XL</option>
                    </select>
                </div>

                <div class="description">
                    <ul>
                        <li>Care Instructions: Machine Wash</li>
                        <li>Fit Type: Classic Fit</li>
                        <li>Color name: Black-White</li>
                        <li>Material: Cotton</li>
                        <li>Pattern: Solid</li>
                    </ul>
                </div>
            </div>
            <!-- Description -->
        </div>
    </section>
    <script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
</body>
</html>