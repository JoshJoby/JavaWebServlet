<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.SignInServlet" %>
<%@page import="SignUpPackage.ProdDB"  %>
<%ProdDB pdb = new ProdDB(); %>
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
						<%
							System.out.println((request.getAttribute("product").toString()));
							%>
				        <div class="container">            
				            <!-- Start Atribute Navigation -->
				            <div class="attr-nav">
				                <ul>
				                	<li class="search">
				                		<a href="#">
				                		<p style="font-size: 12px">Search</p>
				                		</a>
				                	</li><!--/.search-->				                	
				                	<li class="nav-setting">
									<a href="SignUp.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Sign in</p></a>
				                	</li><!--/.search-->
				                	<li class="nav-setting">
				                	
				                	<%if((boolean)request.getAttribute("isAuth")){%>	
				                	<div style="padding-top: 42px">						
									<form name="logout_form" method="POST" action="home.jsp">
									<span>
										<input type="submit" value="Log Out" name="btnLogOut" style="border:none; background: #ffffff; font-size: 12px">
									</span>
									</form>
									</div>	
				                	 <%}%>	
				                	</li><!--/.search-->
				                	<%if(!(boolean)request.getAttribute("isAuth")){%>	
				                	<li>
				                			<a href="#" onclick="alert('Please log in to view cart! ')">
				                            <p style="font-size: 12px">Cart</p>
				                        </a>
				                	</li>	
				                	<%}else if((boolean)request.getAttribute("isAuth")){ %>	             
				                    <li class="dropdown">
				                        <a href="cart.jsp" class="dropdown-toggle" data-toggle="dropdown" >
				                            <p style="font-size: 12px">Cart</p>
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
				                    <%}%>
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
				            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu" >
				                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
				                    <li class="scroll"><a href="#new-arrivals">new arrivals</a></li>
				                    <li class="scroll"><a href="#feature">features</a></li>
				                    <li class="scroll"><a href="#blog">blog</a></li>
				                    <li class="scroll"><a href="#newsletter">contact us</a></li>
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>

			</div>
</header>

    <section id="product-info" style="margin-bottom: 5%">

        <div class="item-image-parent">
            <!--  <div class="item-list-vertical">  -->
            <div style="padding-right: 10%">
                <!-- <div class="thumb-box"> -->
                <div style="padding-bottom: 20%">
                <div style="border: thin solid black">
                    <img src="<%=pdb.getProdImage1((request.getAttribute("product").toString()))%>" alt="thumbnail" width="50" height="50"/>
                </div>
                </div>
                <div style="padding-bottom: 20%">
                <div style="border: thin solid black">
                    <img src="<%=pdb.getProdImage2((request.getAttribute("product").toString()))%>" alt="thumbnail" width="50" height="50"/>
                </div>
                </div>
                <div style="padding-bottom: 20%">
                <div style="border: thin solid black">
                    <img src="<%=pdb.getProdImage3((request.getAttribute("product").toString()))%>" alt="thumbnail" width="50" height="50"/>
                </div>
                </div>

            </div>
            <!-- <div class="item-image-main"> -->
            <div >
                    <img src="<%=pdb.getProdImage1((request.getAttribute("product").toString()))%>" alt="thumbnail" width="464" height="604"/>
            </div>
        </div>

        <div class="item-info-parent">
            <!-- main info -->
            <div class="main-info">
                <h4><%=pdb.getProdName((request.getAttribute("product").toString()))%></h4>
                <div class="star-rating">
                	<%if(pdb.getProdRating(request.getAttribute("product").toString()) == 5){ %>
                    <span>★★★★★</span>     
                    <%}else if(pdb.getProdRating(request.getAttribute("product").toString()) == 4){ %>
                    <span>★★★★</span>★ 
                    <%}else if(pdb.getProdRating(request.getAttribute("product").toString()) == 3){ %>
                    <span>★★★</span>★★
                    <%}else if(pdb.getProdRating(request.getAttribute("product").toString()) == 2){ %>
                    <span>★★</span>★★★ 
                    <%}else if(pdb.getProdRating(request.getAttribute("product").toString()) == 1){ %>
                    <span>★</span>★★★★       
                    <%} %>
                </div>
                <p><span id="price">₹ <%=pdb.getProdPrice((request.getAttribute("product").toString()))%></span></p>
            </div>
            <!-- Choose -->
            <div class="select-items">
                <div class="description">
                    <ul>
                        <li><%=pdb.getProdDesc((request.getAttribute("product").toString()))%></li>

                    </ul>
                </div>
            </div>
            <!-- Description -->
            <hr>
            <form  action="cart.jsp">
                <input type="image" name="submit"
	        		src="https://www.paypalobjects.com/en_US/i/btn/btn_cart_LG.gif"
	        		alt="Add to Cart">
    			<img alt="" width="1" height="1"
        			src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" ></form>
        </div>
    </section>

    
       <hr>    
   
    <section id="feature" class="feature">
			<div class="container">
				<div class="section-header">
					<h2>featured products</h2>
				</div><!--/.section-header-->
				<div class="feature-content">
					<div class="row">
						<div class="col-sm-3">
							<div class="single-feature">
								<img src="assets/images/features/f1.jpg" alt="feature image">
								<div class="single-feature-txt text-center">
									<p>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									</p>
									<h3><a href="#">designed sofa</a></h3>
									<h5>$160.00</h5>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-feature">
								<img src="assets/images/features/f2.jpg" alt="feature image">
								<div class="single-feature-txt text-center">
									<p>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									</p>
									<h3><a href="#">dinning table </a></h3>
									<h5>$200.00</h5>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-feature">
								<img src="assets/images/features/f3.jpg" alt="feature image">
								<div class="single-feature-txt text-center">
									<p>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									</p>
									<h3><a href="#">chair and table</a></h3>
									<h5>$100.00</h5>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="single-feature">
								<img src="assets/images/features/f4.jpg" alt="feature image">
								<div class="single-feature-txt text-center">
									<p>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									</p>
									<h3><a href="#">modern arm chair</a></h3>
									<h5>$299.00</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!--/.container-->

		</section><!--/.feature-->
		<!--feature end -->

		<!--blog start -->
		<section id="blog" class="blog">
			<div class="container">
				<div class="section-header">
					<h2>latest blog</h2>
				</div><!--/.section-header-->
				<div class="blog-content">
					<div class="row">
						<div class="col-sm-4">
							<div class="single-blog">
								<div class="single-blog-img">
									<img src="assets/images/blog/b1.jpg" alt="blog image">
									<div class="single-blog-img-overlay"></div>
								</div>
								<div class="single-blog-txt">
									<h2><a href="#">Why Brands are Looking at Local Language</a></h2>
									<h3>By <a href="#">Robert Norby</a> / 18th March 2018</h3>
									<p>
										Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.... 
									</p>
								</div>
							</div>
							
						</div>
						<div class="col-sm-4">
							<div class="single-blog">
								<div class="single-blog-img">
									<img src="assets/images/blog/b2.jpg" alt="blog image">
									<div class="single-blog-img-overlay"></div>
								</div>
								<div class="single-blog-txt">
									<h2><a href="#">Why Brands are Looking at Local Language</a></h2>
									<h3>By <a href="#">Robert Norby</a> / 18th March 2018</h3>
									<p>
										Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.... 
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="single-blog">
								<div class="single-blog-img">
									<img src="assets/images/blog/b3.jpg" alt="blog image">
									<div class="single-blog-img-overlay"></div>
								</div>
								<div class="single-blog-txt">
									<h2><a href="#">Why Brands are Looking at Local Language</a></h2>
									<h3>By <a href="#">Robert Norby</a> / 18th March 2018</h3>
									<p>
										Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.... 
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!--/.container-->
			
		</section><!--/.blog-->
		<!--blog end -->

		<!-- clients strat -->
		<section id="clients"  class="clients">
			<div class="container">
				<div class="owl-carousel owl-theme" id="client">
						<div class="item">
							<a href="#">
								<img src="assets/images/clients/c1.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="#">
								<img src="assets/images/clients/c2.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="#">
								<img src="assets/images/clients/c3.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="#">
								<img src="assets/images/clients/c4.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
						<div class="item">
							<a href="#">
								<img src="assets/images/clients/c5.png" alt="brand-image" />
							</a>
						</div><!--/.item-->
					</div><!--/.owl-carousel-->

			</div><!--/.container-->

		</section><!--/.clients-->	
		<!-- clients end -->

		<!--newsletter strat -->
		<section id="newsletter"  class="newsletter">
			<div class="container">
				<div class="hm-footer-details">
					<div class="row">
						<div class=" col-md-3 col-sm-6 col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4>information</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><a href="#">about us</a></li><!--/li-->
										<li><a href="#">contact us</a></li><!--/li-->
										<li><a href="#">news</a></li><!--/li-->
										<li><a href="#">store</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
						<div class=" col-md-3 col-sm-6 col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4>collections</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><a href="#">wooden chair</a></li><!--/li-->
										<li><a href="#">royal cloth sofa</a></li><!--/li-->
										<li><a href="#">accent chair</a></li><!--/li-->
										<li><a href="#">bed</a></li><!--/li-->
										<li><a href="#">hanging lamp</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
						<div class=" col-md-3 col-sm-6 col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4>my accounts</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-menu">
									<ul>
										<li><a href="#">my account</a></li><!--/li-->
										<li><a href="#">wishlist</a></li><!--/li-->
										<li><a href="#">Community</a></li><!--/li-->
										<li><a href="#">order history</a></li><!--/li-->
										<li><a href="#">my cart</a></li><!--/li-->
									</ul><!--/ul-->
								</div><!--/.hm-foot-menu-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
						<div class=" col-md-3 col-sm-6  col-xs-12">
							<div class="hm-footer-widget">
								<div class="hm-foot-title">
									<h4>newsletter</h4>
								</div><!--/.hm-foot-title-->
								<div class="hm-foot-para">
									<p>
										Subscribe  to get latest news,update and information.
									</p>
								</div><!--/.hm-foot-para-->
								<div class="hm-foot-email">
									<div class="foot-email-box">
										<input type="text" class="form-control" placeholder="Enter Email Here....">
									</div><!--/.foot-email-box-->
									<div class="foot-email-subscribe">
										<span><i class="fa fa-location-arrow"></i></span>
									</div><!--/.foot-email-icon-->
								</div><!--/.hm-foot-email-->
							</div><!--/.hm-footer-widget-->
						</div><!--/.col-->
					</div><!--/.row-->
				</div><!--/.hm-footer-details-->

			</div><!--/.container-->

		</section><!--/newsletter-->	
		<!--newsletter end -->

		<!--footer start-->
		<footer id="footer"  class="footer">
			<div class="container">
				<div class="hm-footer-copyright text-center">
					<div class="footer-social">
						<a href="#"><i class="fa fa-facebook"></i></a>	
						<a href="#"><i class="fa fa-instagram"></i></a>
						<a href="#"><i class="fa fa-linkedin"></i></a>
						<a href="#"><i class="fa fa-pinterest"></i></a>
						<a href="#"><i class="fa fa-behance"></i></a>	
					</div>
					<p>
						&copy;copyright. designed and developed by <a href="https://www.themesine.com/">themesine</a>
					</p><!--/p-->
				</div><!--/.text-center-->
			</div><!--/.container-->

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div><!--/.scroll-Top-->
			
        </footer><!--/.footer-->
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