<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.SignInServlet" %>
<%@page import="SignUpPackage.ProdDB"  %>
<%@page import="SignUpPackage.HomeServlet"  %>
<%@page import="SignUpPackage.ProdModel"  %>
<%@page import="java.util.LinkedList"  %>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
	<head>
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
<style>
* {
  box-sizing: border-box; 
}
body {
  padding: 20px;
  width: 70%;
  margin: 0 auto;
}
.screen-reader-text {
  position: absolute;
  top: -9999px;
  left: -9999px;
}

.search-form {
  width: 35%;
  float: left;
  padding-right: 20px;
}
.search-term {
  width: 100%;
  margin: 0 0 5px 0;
}
.search-terms {
  display: table;
  margin: 0 0 10px 0;
}
.search-filters {
  overflow: hidden;
  margin: 0 0 10px 0;
  background: #eee;
  padding: 10px;
}
.search-filters-title {
  font-weight: normal;
  font-size: 1em;
  margin: 0 0 10px 0;
}
.filter-group {
  margin: 0 0 10px 0;
}
.cloned-filters {
  display: none; 
}
.search-results {
  width: 65%;
  float: right;
  padding-bottom: 2500px; /* just scrolling space */
}
.result {
  float: left;
  width: 24%;
  height: 120px;
  margin-left: 5%;
  margin-right: 5%;
  margin-bottom: 10%;
  background: #eee;
}
.result:nth-child(3n) {
  margin-right: 0; 
}
.result img {
  width: 100%;
  height: auto;
  display: block;
}

@media (max-width: 1000px) {
  body {
    width: 90%;
  }
}

@media (max-width: 600px) {
  body,
  .search-form,
  .search-results {
    width: 100%;
  }
  .search-form {
    padding: 0;
  }
  .search-terms {
    display: table;
    width: 100%;
    margin: 0;
  }
  .search-terms > div {
    display: table-row; 
  }
  .search-terms > div > span {
    display: table-cell;
  }
  .search-term-wrap {
    padding-right: 10px;
  }
  .search-button {
    width: 100%;
  }
  .search-filters-title {
    color: blue;
    text-decoration: underline;
    cursor: pointer;
    margin: 0;
  }
  .search-filters.pinned {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.2);
  }
  .filter-group {
    display: none;
  }
  .filter-explanation {
    display: none;  
  }
  
  .filters-open .filter-group,
  .filters-open .filter-explanation {
    display: block; 
  }
  .filters-open .search-filters-title {
    margin: 0 0 10px 0;
  }
}
</style>

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
			</div><!--/#header-carousel-->

			</div>
</header>

<form role="search" class="search-form" id="search-form" action="#" method="post">
  
  <section class="search-filters" id="search-filters">
    
    <h4 class="search-filters-title" id="search-filters-title">Search filters</h4>
    
    <div class="size-filters filter-group">
    
      <div>
        <input type="checkbox" id="filter-size-small">
        <label for="filter-size-small">Small</label>
      </div>
      
      <div>
        <input type="checkbox" id="filter-size-medium" checked>
        <label for="filter-size-medium">Medium</label>
      </div>
      
      <div>
        <input type="checkbox" id="filter-size-large">
        <label for="filter-size-large">Large</label>
      </div>
      
    </div>
    
    <div class="content-filters filter-group">
      
      <div>
        <input type="radio" id="filter-content-cats" name="filter-content">
        <label for="filter-content-cats">Cats</label>
      </div>
      
      <div>
        <input type="radio" id="filter-content-dogs" name="filter-content">
        <label for="filter-content-dogs">Dogs</label>
      </div>
      
      <div>
        <input type="radio" id="filter-content-Birds" name="filter-content">
        <label for="filter-content-birds">Birds</label>
      </div>
    </div>
    
    <small class="filter-explanation">Choosing filters automatically refines and refreshes search.</small>
    
  </section>
</form>

<section class="search-results" style="margin-left: 50%; margin-top: -28%;">
<% 
		LinkedList<ProdModel> searchResultsInPage = (LinkedList<ProdModel>)request.getAttribute("searchResults");
		for(ProdModel prodmodel : searchResultsInPage)	
		{
	%>
	  <div class="result">
	  <img src="<%=prodmodel.getProdImage()%>">
	  </div>
	  <%//x1 = rs.next();%>
	    <div class="result">
	  <img src="<%=prodmodel.getProdImage2()%>">
	  </div>
	  <%//x1 = rs.next();%>
	    <div class="result">
	  <img src="<%=prodmodel.getProdImage3()%>">
	  </div>
	<%
	}
	request.removeAttribute("searchResults");
%>
</section>
  
<section id="feature" class="feature" style="margin-top: 30%">
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
  <script>
  var Search = {
		  
		  searchForm: $("#search-form"),
		  searchTerms: $("#search-terms"),
		  searchFilters: $("#search-filters"),
		  searchFiltersTitle: $("#search-filters-title"),
		  offset: $("#search-filters-title").offset(),
		  win: $(window),
		  
		  init: function() {
		    Search.bindUIEvents();
		  },
		  
		  bindUIEvents: function() {
		    
		    Search.searchFiltersTitle
		      .on(
		        "click",
		        Search.toggleSearchFilters
		      );
		    
		    Search.win
		      .on(
		        "scroll",
		        Search.filterHeaderPosition
		       );
		    
		    Search.searchForm
		      .on(
		         "submit",
		        Search.searchSubmit
		       );
		    
		  },
		  
		  toggleSearchFilters: function() {    
		    Search.searchForm
		      .toggleClass("filters-open");
		  },
		  
		  filterHeaderPosition: function() {
		    
		     var scrollTop = Search.win.scrollTop();
		           
		     if (scrollTop > Search.offset.top) {
		       Search.searchFilters.addClass("pinned");
		       Search.searchTerms.css("margin-bottom", Search.searchFilters.outerHeight());
		     } else {
		       Search.searchFilters.removeClass("pinned"); 
		       Search.searchTerms.css("margin-bottom", "10px");
		     };
		    
		  },
		  
		  searchSubmit: function() {
		    // process new search
		    return false; 
		  }
		  
		};

		Search.init();
  </script>
  
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
  
</footer>