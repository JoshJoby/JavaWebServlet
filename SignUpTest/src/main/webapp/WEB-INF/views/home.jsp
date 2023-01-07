<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.HomeServlet" %>
<%@page import="SignUpPackage.SignInServlet" %>
<%@page import="SignUpPackage.ProdDB"  %>
<%@page import="SignUpPackage.CartDB"  %>
<%@page import="java.util.LinkedList" %>
<%@page import="SignUpPackage.CartModel" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Calendar" %>


<%ProdDB pdb = new ProdDB(); 
CartDB cdb = new CartDB();

if(!SignInServlet.isLoggedIn) {
	System.out.println("Logged out!");
	HomeServlet.chosenProds.clear();
	CartDB.existingProds.clear();
	SignInServlet.userEmail = null;
}
else if(SignInServlet.userEmail!=null && HomeServlet.chosenProds.size() == 0) {
	cdb.getExistingUserProducts(SignInServlet.userEmail);
	HomeServlet.chosenProds = (LinkedList<CartModel>) CartDB.existingProds.clone();
}
%>

    
<!doctype html>
<html class="no-js" lang="en">
    <head> 
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        
        <!-- title of site -->
        <title>Furniture</title>

        <!-- For favicon png -->
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
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    
	
	<body>
		<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
         <%
			if((request.getParameter("btnLogOut") == null) ? false : true){
				request.setAttribute("isAuth", false);
				SignInServlet.isLoggedIn=false;
				response.sendRedirect("index.jsp");

			}
		%>	
		
		
		
		<form id="formCart" action="prod.jsp" method="get"></form>
		<form id="formAddToCart" action="Redirect.jsp" method="get"></form>
	
	
		<!--welcome-hero start -->
		<header id="home" class="welcome-hero" >

			<div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
				<!--/.carousel-indicator -->
				 <ol class="carousel-indicators">
					<li data-target="#header-carousel" data-slide-to="0" class="active"><span class="small-circle"></span></li>
					<li data-target="#header-carousel" data-slide-to="1"><span class="small-circle"></span></li>
					<li data-target="#header-carousel" data-slide-to="2"><span class="small-circle"></span></li>
				</ol><!-- /ol-->
				<!--/.carousel-indicator -->

				<!--/.carousel-inner -->
					<div style="text-align: center; position: absolute; top: 150px; left: 190px; font-size: 30px; color: #000000">
					<% 
					Calendar c = Calendar.getInstance();
					int timeOfDay = c.get(Calendar.HOUR_OF_DAY);
					if((boolean)request.getAttribute("isAuth")){
						if(timeOfDay >= 0 && timeOfDay < 12){%>
							<div> Good Morning, <%=request.getAttribute("name")%>!</div>
						<%}else if(timeOfDay >= 12 && timeOfDay < 16){%>
						<div> Good Afternoon, <%=request.getAttribute("name")%>!</div>
						<%}else if(timeOfDay >= 16 && timeOfDay < 24){%>
						<div>Good Evening, <%=request.getAttribute("name")%>!</div>
						<%}
					}else{ %><p>&nbsp</p><%} %>

				</div>	
				<div class="carousel-inner" role="listbox">
					<!-- .item -->
					<div class="item active">
						<div class="single-slide-item slide1">
							<div class="container">
							
								<div class="welcome-hero-content">

									<div class="row">
							
										<div class="col-sm-7">									
											<div class="single-welcome-hero">
												<div class="welcome-hero-txt">
													<h2><%=pdb.getProdName("product2")%></h2>
													<p>
															<%=pdb.getProdDesc("product2")%>	
													</p>
													<div class="packages-price">
														<p>
														 ₹ <%=pdb.getProdPrice("product2")%>
														</p>
													</div>
													<button class="btn-cart welcome-add-cart"  type="submit" name="buttonProdCart" value="product2" form="formAddToCart" >
													
													
														<span class="lnr lnr-plus-circle"></span>
														add <span>to</span> cart
													</button>
													<button class="btn-cart welcome-add-cart welcome-more-info"  type="submit" name="buttonProd" value="product2" form="formCart">
														more info
													</button>
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
										<div class="col-sm-5">
											<div class="single-welcome-hero">
												<div class="welcome-hero-img">
													<img src="<%=pdb.getProdImage1("product2")%>" alt="slider image">
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
									</div><!--/.row-->
								</div><!--/.welcome-hero-content-->
							</div><!-- /.container-->
						</div><!-- /.single-slide-item-->

					</div><!-- /.item .active-->

					<div class="item">
						<div class="single-slide-item slide2">
							<div class="container">
								<div class="welcome-hero-content">
									<div class="row">
										<div class="col-sm-7">
											<div class="single-welcome-hero">
												<div class="welcome-hero-txt">
													<h2><%=pdb.getProdName("product3")%></h2>
													<p>
															<%=pdb.getProdDesc("product3")%>	
													</p>
													<div class="packages-price">
														<p>
														 ₹ <%=pdb.getProdPrice("product3")%>
														</p>
													</div>
													<button class="btn-cart welcome-add-cart" type="submit" name="buttonProdCart" value="product3" form="formAddToCart">
														<span class="lnr lnr-plus-circle"></span>
														add <span>to</span> cart
													</button>
													<button class="btn-cart welcome-add-cart welcome-more-info" type="submit" name="buttonProd" value="product3" form="formCart">
														more info
													</button>
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
										
										
        
										
										<div class="col-sm-5">
											<div class="single-welcome-hero">
												<div class="welcome-hero-img">
													<img src="<%=pdb.getProdImage1("product3")%>" alt="slider image">
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
									</div><!--/.row-->
								</div><!--/.welcome-hero-content-->
							</div><!-- /.container-->
						</div><!-- /.single-slide-item-->

					</div><!-- /.item .active-->

					<div class="item">
						<div class="single-slide-item slide3">
							<div class="container">
								<div class="welcome-hero-content">
									<div class="row">
										<div class="col-sm-7">
											<div class="single-welcome-hero">
												<div class="welcome-hero-txt">
													<h2><%=pdb.getProdName("product1")%></h2>
													<p>
														<%=pdb.getProdDesc("product1")%>
													</p>
													<div class="packages-price">
														<p>
														 ₹ <%=pdb.getProdPrice("product1")%>
														</p>
													</div>
													<button class="btn-cart welcome-add-cart" type="submit" name="buttonProdCart" value="product1" form="formAddToCart">
														<span class="lnr lnr-plus-circle"></span>
														add <span>to</span> Cart
													</button>
													<button class="btn-cart welcome-add-cart welcome-more-info" type="submit" name="buttonProd" value="product1" form="formCart">
														more info
													</button>
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
										<div class="col-sm-5">
											<div class="single-welcome-hero">
												<div class="welcome-hero-img">
													<img src="<%=pdb.getProdImage1("product1")%>" alt="slider image">
												</div><!--/.welcome-hero-txt-->
											</div><!--/.single-welcome-hero-->
										</div><!--/.col-->
									</div><!--/.row-->
								</div><!--/.welcome-hero-content-->
							</div><!-- /.container-->
						</div><!-- /.single-slide-item-->
						
					</div><!-- /.item .active-->
				</div><!-- /.carousel-inner-->

			</div><!--/#header-carousel-->

			<!-- top-area Start -->
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <!-- Start Top Search -->
				        <div class="top-search">
				            <div class="container">
				                <div class="input-group">
				                    <span class="input-group-addon"><i class="fa fa-search"></i></span>		

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
										<input type="submit" value="Log Out" name="btnLogOut" style="border:none; background: #f8f9fd; font-size: 12px">
									</span>
									</form>
									</div>	
				                	 <%}%>	
				                	</li><!--/.search-->            
				                    <li class="dropdown">
				                        <a href="cart.jsp" >
				                            <p style="font-size: 12px">Cart</p>
				                            <%if(HomeServlet.chosenProds.size() != 0){ %>
												<span class="badge badge-bg-1"><%=HomeServlet.chosenProds.size()%></span>
											<%}else{ %>
												<span class="badge badge-bg-1"></span>
											<%} %>
				                        </a>			                       
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

			</div><!-- /.top-area-->
			<!-- top-area End -->

		</header><!--/.welcome-hero-->
		<!--welcome-hero end -->

		<!--populer-products start -->
		<section id="populer-products" class="populer-products">
			<div class="container">
				<div class="populer-products-content">
					<div class="row">
						<div class="col-md-3">
							<div class="single-populer-products">
								<div class="single-populer-product-img mt40">
								<button type="submit" name="buttonProd" value="product4" form="formCart" style="padding-bottom: 5% ">
									<img src="<%=pdb.getProdImage1("product4") %>" alt="populer-products images">
								</button>
								</div>
								<button class="btn-cart welcome-add-cart welcome-more-info" style="margin-top: -2%" type="submit" name="buttonProd" value="product4" form="formCart">
								  <h2 style="color: #E99C2E"><%=pdb.getProdName("product4") %></h2> 
								</button>

														
								<div class="single-populer-products-para">
									<p><%=pdb.getProdDesc("product4") %></p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="single-populer-products">
								<div class="single-inner-populer-products">
									<div class="row">
										<div class="col-md-4 col-sm-12">
											<div class="single-inner-populer-product-img">
											<button type="submit" name="buttonProd" value="product4" form="formCart" style="padding-bottom: 5% ">
												<img src="<%=pdb.getProdImage1("product5") %>" alt="populer-products images">
											</button>
											</div>
										</div>
										<div class="col-md-8 col-sm-12">
											<div class="single-inner-populer-product-txt">
													<button class="btn-cart welcome-add-cart welcome-more-info" style="margin-top: -5%; " type="submit" name="buttonProd" value="product4" form="formCart">
													  <h2 style="color: #E99C2E"><%=pdb.getProdName("product5") %></h2> 
													</button>
												<p>
														<%=pdb.getProdDesc("product5") %>				
												</p>
												<div class="populer-products-price">
													<h4>Sales Start from <span>₹<%=pdb.getProdPrice("product5") %></span></h4>
												</div>
												
								                  <button class="btn-cart welcome-add-cart welcome-more-info scroll" style="margin-bottom: 10%">
													<a href="#feature" style="color: #E99C2E">Discover More</a>
								                    </button>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="single-populer-products">
								<div class="single-populer-products">
									<div class="single-populer-product-img">
									<button type="submit" name="buttonProd" value="product6" form="formCart" style="padding-bottom: 5% ">
										<img src="<%=pdb.getProdImage1("product6") %>" alt="populer-products images">
									</button>
									</div>
								<button class="btn-cart welcome-add-cart welcome-more-info" style="margin-top: -2%" type="submit" name="buttonProd" value="product6" form="formCart" style="padding-bottom: 5% ">
									<h2 style="color: #E99C2E"><%=pdb.getProdName("product6")%></h2>
								</button>
									<div class="single-populer-products-para">
										<p><%=pdb.getProdDesc("product6")%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!--/.container-->

		</section><!--/.populer-products-->
		<!--populer-products end-->

		<!--new-arrivals start -->
		<section id="new-arrivals" class="new-arrivals">
			<div class="container">
				<div class="section-header">
					<h2>new arrivals</h2>
				</div><!--/.section-header-->
				<div class="new-arrivals-content">
					<div class="row">
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product7" form="formCart">										
										<img src="<%=pdb.getProdImage1("product7")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product7" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product7" form="formCart">
								<h4><%=pdb.getProdName("product7")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product7")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product8" form="formCart">										
										<img src="<%=pdb.getProdImage1("product8")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-2">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product8" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product8" form="formCart" >
								<h4><%=pdb.getProdName("product8")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product8")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product9" form="formCart">										
										<img src="<%=pdb.getProdImage1("product9")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product9" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product9" form="formCart" >
								<h4><%=pdb.getProdName("product9")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product9")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product10" form="formCart">										
										<img src="<%=pdb.getProdImage1("product10")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-2">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product10" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product10" form="formCart" >
								<h4><%=pdb.getProdName("product10")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product10")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product11" form="formCart">										
										<img src="<%=pdb.getProdImage1("product11")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product11" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product11" form="formCart" >
								<h4><%=pdb.getProdName("product11")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product11")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product12" form="formCart">										
										<img src="<%=pdb.getProdImage1("product12")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-2">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product12" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product12" form="formCart" >
								<h4><%=pdb.getProdName("product12")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product12")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product13" form="formCart">										
										<img src="<%=pdb.getProdImage1("product13")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-2">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product13" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product13" form="formCart" >
								<h4><%=pdb.getProdName("product13")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product13")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product14" form="formCart">										
										<img src="<%=pdb.getProdImage1("product14")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product14" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product14" form="formCart" >
								<h4><%=pdb.getProdName("product14")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product14")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4" style="margin-left: 25%">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product15" form="formCart">										
										<img src="<%=pdb.getProdImage1("product15")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product15" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
										<p class="arrival-review pull-right">

										</p>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product15" form="formCart" >
								<h4><%=pdb.getProdName("product15")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product15")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product16" form="formCart">										
										<img src="<%=pdb.getProdImage1("product16")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product16" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<button type="submit" name="buttonProd" value="product16" form="formCart" >
								<h4><%=pdb.getProdName("product16")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product16")%></p>
							</div>
						</div>
					</div>
				</div>
			</div><!--/.container-->
		
		</section><!--/.new-arrivals-->
		<!--new-arrivals end -->
		<hr>
		<!--feature start -->
		<section id="feature" class="feature">
			<div class="container">
				<div class="section-header">
					<h2>featured products</h2>
				</div><!--/.section-header-->
				<div class="feature-content">
					<div class="row">
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product17" form="formCart">										
										<img src="<%=pdb.getProdImage1("product17")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product17" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product17") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product17") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product17" form="formCart" >
								<h4><%=pdb.getProdName("product17")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product17")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product18" form="formCart">										
										<img src="<%=pdb.getProdImage1("product18")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product18" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product18") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product18") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product18" form="formCart" >
								<h4><%=pdb.getProdName("product18")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product18")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product19" form="formCart">										
										<img src="<%=pdb.getProdImage1("product19")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product19" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product19") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product19") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product19" form="formCart" >
								<h4><%=pdb.getProdName("product19")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product19")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product20" form="formCart">										
										<img src="<%=pdb.getProdImage1("product20")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product20" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product20") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product20") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product20" form="formCart" >
								<h4><%=pdb.getProdName("product20")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product20")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product21" form="formCart">										
										<img src="<%=pdb.getProdImage1("product21")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product21" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product21") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product21") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product21" form="formCart" >
								<h4><%=pdb.getProdName("product21")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product21")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product22" form="formCart">										
										<img src="<%=pdb.getProdImage1("product22")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product22" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product22") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product22") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product22" form="formCart" >
								<h4><%=pdb.getProdName("product22")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product22")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product23" form="formCart">										
										<img src="<%=pdb.getProdImage1("product23")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product23" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product23") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product23") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product23" form="formCart" >
								<h4><%=pdb.getProdName("product23")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product23")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product24" form="formCart">										
										<img src="<%=pdb.getProdImage1("product24")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product24" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product24") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product24") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product24" form="formCart" >
								<h4><%=pdb.getProdName("product24")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product24")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product25" form="formCart">										
										<img src="<%=pdb.getProdImage1("product25")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product25" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product25") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product25") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product25" form="formCart" >
								<h4><%=pdb.getProdName("product25")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product25")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product26" form="formCart">										
										<img src="<%=pdb.getProdImage1("product26")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product26" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product26") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product26") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product26" form="formCart" >
								<h4><%=pdb.getProdName("product26")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product26")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product27" form="formCart">										
										<img src="<%=pdb.getProdImage1("product27")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product27" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product27") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product27") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product27" form="formCart" >
								<h4><%=pdb.getProdName("product27")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product27")%></p>
							</div>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="single-new-arrival">
								<div class="single-new-arrival-bg" style="margin-bottom: 10%">
									<button type="submit" name="buttonProd" value="product28" form="formCart">										
										<img src="<%=pdb.getProdImage1("product28")%>" alt="new-arrivals images">
									</button>
									<div class="sale bg-1">
										<p>sale</p>
									</div>
									<div class="new-arrival-cart" style="padding-right: 15%">
										
											<button type="submit" name="buttonProdCart" value="product28" form="formAddToCart">										
												<p >
													<span class="lnr lnr-cart" ></span> 
													Add To Cart
												</p>									
											</button>
									</div>
								</div>
								<div class="single-feature">
								<div class="single-feature-txt text-center">
									<p>
									<%if(pdb.getProdRating("product28") == 5){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 4){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 3){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>																					
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 2){ %>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%}else if(pdb.getProdRating("product28") == 1){ %>
										<i class="fa fa-star"></i>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="spacial-feature-icon"><i class="fa fa-star"></i></span>
										<span class="feature-review">(45 review)</span>
									<%} %>
									</p>
								</div>
							</div>
								<button type="submit" name="buttonProd" value="product28" form="formCart" >
								<h4><%=pdb.getProdName("product28")%></h4>
								</button>
								<p class="arrival-product-price">₹<%=pdb.getProdPrice("product28")%></p>
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
		<!--footer end-->
		
		<!-- Include all js compiled plugins (below), or include individual files as needed -->

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