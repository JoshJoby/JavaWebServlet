<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList" %>
<%@page import="SignUpPackage.CartModel" %>
<%@page import="SignUpPackage.HomeServlet" %>
<%@page import="SignUpPackage.SignInServlet" %>
<%@page import="SignUpPackage.RedirectToTransactionsServlet" %>
<%@page import="SignUpPackage.ProdDB"  %>
<%@page import="SignUpPackage.CartDB"  %>
<%@page import="java.util.LinkedList" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/dashboardStyles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
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
        
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*html, body {
    overflow-x: hidden;
}*/
</style>
<body>
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <div class="container">            
				            <!-- Start Atribute Navigation -->
				            <div class="attr-nav">
				                <ul>			                	
				                	<li class="nav-setting">
				                	<%if(!(SignInServlet.isLoggedIn)){%>	
									<a href="SignUp.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Sign in</p></a>
				                	<%}else{ %>
				                	<a href="dashboard.jsp" class="addMore" title="Sign in!"><p style="font-size: 12px">Dashboard</p></a>
				                	</li><!--/.search-->
				                	<%} %>
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
				                    	<%if(SignInServlet.isLoggedIn){ %>
				                        <a href="cart.jsp" >
				                        <%}else {%>
				                        <a href="#popup1">
				                        <%}%>
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
				                <a style="margin-top: -20%" class="navbar-brand" href="home.jsp">Chilli<span>Gobi!</span></a>

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
<div class="container rounded bg-white mt-5 mb-5" style="margin-left: 25%; padding-top: 2.5%">
    <div class="row">
   
        <div>
            <div class="d-flex flex-column align-items-center text-center" 
            style="margin-left: 10%; padding-right: 50%" >
            
            <%if(SignInServlet.userGender.toLowerCase().equals("male")){ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            <%}else if(SignInServlet.userGender.toLowerCase().equals("female")){ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st.depositphotos.com/62933612/54663/v/600/depositphotos_546638394-stock-illustration-female-user-account-user-profile.jpg">
             <%}else{ %>
            <img class="rounded-circle mt-5" 
            width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            <%} %>
            <span class="font-weight-bold"><%=SignInServlet.userName %></span>
            <span class="text-black-50"><%=SignInServlet.userEmail %></span><span> </span></div>
                    <br>
            
        </div> 
        <hr style="margin-left: -20%">
        <div style="margin-left: 10%; padding-right: 60%">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">View/Update Profile</h4>
                </div>
                <form name="updateUserDetails" action="dashboard.jsp" method="post">
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input type="text" name="nameUpdate" class="form-control" placeholder="<%=SignInServlet.userName1 %>" value=""></div>
                    <div class="col-md-6"><label class="labels">Surname</label><input type="text" name="surnameUpdate" class="form-control" value="" placeholder="<%=SignInServlet.userName2 %>"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="phnoUpdate" class="form-control" placeholder="<%=SignInServlet.userPhoneno %>" value=""></div>
                    <div class="col-md-12"><label class="labels">Address</label><input type="text" name="addressUpdate" class="form-control" placeholder="<%=SignInServlet.userAddress %>" value=""></div>
                    <div class="col-md-12"><label class="labels">Gender</label><input type="text" name="genderUpdate" class="form-control" placeholder="<%=SignInServlet.userGender %>" value=""></div>
                    <div class="col-md-12"><label class="labels">Country</label><input type="text" name="countryUpdate" class="form-control" placeholder="<%=SignInServlet.userCountry %>" value=""></div>
                </div>
                <div class="mt-5 text-center"><input name="updateUserDetailsBtn" class="btn btn-primary profile-button" type="submit" value="Save Profile"></div>
               </form>
            </div>
          <hr>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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