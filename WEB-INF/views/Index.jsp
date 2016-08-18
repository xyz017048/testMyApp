<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" ng-app="mySite">
<head>
	<meta charset="utf-8">
	<title>Entwick</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font awesome -->
    <link href="<c:url value='/static/css/font-awesome.css' />" rel="stylesheet"></link>
    <!-- Bootstrap -->
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>       

    <!-- ui-navbar CSS -->
    <!-- also uses bootstrap.css -->
    <link href="<c:url value='/static/css/ui-navbar.css' />" rel="stylesheet"></link>

    <!-- Product view slider -->
    <link href="<c:url value='/static/css/jquery.simpleLens.css' />" rel="stylesheet"></link>    
    <!-- slick slider -->
    <link href="<c:url value='/static/css/slick.css' />" rel="stylesheet"></link>
    <!-- price picker slider -->
    <link href="<c:url value='/static/css/nouislider.css' />" rel="stylesheet"></link>
    <!-- Theme color -->
    <link href="<c:url value='/static/css/default-theme.css' />" rel="stylesheet"></link>
    <!-- Main style sheet -->
    <link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>    
    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'></link>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'></link>
    
    <!-- AngularJS ngtagsinput plugin--> 
    <link href="<c:url value='/static/css/ng-tags-input.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/ng-tags-input.bootstrap.css' />" rel="stylesheet"></link>
    
    <link href="<c:url value='/static/css/dformapp.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/discussion.css' />" rel="stylesheet"></link>
    
    <!-- Angular Material Style Sheet -->
    <link href="<c:url value='/static/css/angular-material.css' />" rel="stylesheet"></link>
</head>

<body>
    <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      	<div class="wpf-loader-two-inner">
        	<span>Loading</span>
      	</div>
    </div> 
    <!-- / wpf loader Two -->

  	<!-- SCROLL TOP BUTTON -->

	<a scroll class="scrollToTop" ng-class="{scrollToTopShow:boolShowScrollClass}" ng-controller="anchorCtrl" ng-click="gotoAnchor()" href=""><i class="fa fa-chevron-up"></i></a>
	<!-- END SCROLL TOP BUTTON -->	

  	<!-- Start header section -->
  	<header id="aa-header">
	    <!-- start header top  -->
	    <div class="aa-header-top">
	      	<div class="container">
	        	<div layout="row">
	            		<div class="aa-header-top-area">  	
	            			<div class="aa-header-top-left">
	            				<!-- logo  -->
				          		<div class="aa-logo">
				            		<!-- Text based logo -->
				            		<a href="#!/home">
				              			<p>Entwick<strong>Shop</strong> <span>Innovative Shopping Experience</span></p>
				            		</a>
				           			<!-- img based logo -->
				            		<!-- <a href="#!/home"><img src="<c:url value='/static/img/logo.jpg' />" alt="logo img"></a> -->
				          		</div>
				         		<!-- / logo  -->
	            			</div>

			             	<div class="aa-header-top-right">	
			             	 
			             		<!-- search box -->
				          		<div class="aa-search-box">
				            		<form action="">
				              			<button type="submit"><span class="fa fa-search"></span></button>
				            		</form>
			         			</div>
				          		<!-- / search box --> 
			             	            	 		             	
			                	<ul class="aa-head-top-nav-right">
			                  		<li class="hidden-xs"><a href="#!/wishlist">Wish List</a></li>
			                  		<li class="hidden-xs"><a href="" data-toggle="modal" data-target="#login-modal">Log In</a></li>
			                	</ul>
			                	<!-- cart box -->
				          		<div class="aa-cartbox">
				            		<a class="aa-cart-link" href="#">
				              			<span class="fa fa-shopping-basket"></span>
			              				<span class="aa-cart-notify">2</span>
				            		</a>
				            		<div class="aa-cartbox-summary">
										<ul>
											<li>
											  	<a class="aa-cartbox-img" href="#"><img src="<c:url value='/static/img/woman-small-2.jpg' />" alt="img"></a>
											  		<div class="aa-cartbox-info">
												    	<h4><a href="#">Product Name</a></h4>
												    	<p>1 x $250</p>
											  		</div>
											  	<a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
											</li>
											<li>
											  	<a class="aa-cartbox-img" href="#"><img src="<c:url value='/static/img/woman-small-1.jpg' />" alt="img"></a>
											  		<div class="aa-cartbox-info">
											    		<h4><a href="#">Product Name</a></h4>
											    		<p>1 x $250</p>
											 	 	</div>
											  	<a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>
											</li>                    
											<li>
											  	<span class="aa-cartbox-total-title">Total</span>
											  	<span class="aa-cartbox-total-price">$500</span>
											</li>
										</ul>
				              			<a class="aa-cartbox-checkout aa-primary-btn" href="#!/checkout">Checkout</a>
				            		</div>
				          		</div>
		          				<!-- / cart box -->
			              	</div>
	           			</div>
        		</div>
	      	</div>
	    </div>
	    <!-- / header top  -->
	</header>
	<!-- / header section -->

	<!-- menu -->
	<section id="menu">
		<div class="container">
	  		<div class="menu-area">		
   	 			<!-- Navbar -->
	   	 		<div ng-controller="NavigationController">
	   	 			<nav class="navbar navbar-default" role="navigation">
	   	 				<div class="navbar-header">
							<button type="button" class="navbar-toggle" ng-init="navCollapsed = true" ng-click="navCollapsed = !navCollapsed">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<!--  a class="navbar-brand" ui-sref="home">Brand</a-->
	   	 				</div>

			   	 		<!-- Collect the nav links, forms, and other content for toggling -->
				        <div class="collapse navbar-collapse" ng-class="!navCollapsed && 'in'">
							<ul class="nav navbar-nav">
								<li uib-dropdown="">
				              		<a href="#!/home" uib-dropdown-toggle="">Home</a>				   
			            		</li>
				            	<li uib-dropdown="">
				              		<a href="#!/discussion">Discussion</a>				   
			            		</li>
			            		<li uib-dropdown="">
				              		<a href="#" uib-dropdown-toggle="">Gather Interest</a>				   
			            		</li>
			            		<li uib-dropdown="">
				              		<a href="#" uib-dropdown-toggle="">Crowdfunding</a>				   
			            		</li>
			            		<li uib-dropdown="">
				              		<a href="#" uib-dropdown-toggle="">Shop</a>				   
			            		</li>
			            		<li uib-dropdown="">
				              		<a href="#" uib-dropdown-toggle="">Templates<span class="caret"></span></a>
				              		<ul class="dropdown-menu">              
										<li><a href="#!/blog-archive">Blog Style 1</a></li>
										<li><a href="#!/blog-archive-2">Blog Style 2</a></li>
										<li><a href="#!/blog-single">Blog Single</a></li>
									  	<li><a href="#!/product">Shop Page</a></li>
										<li><a href="#!/product-detail">Shop Single</a></li>                
									  	<li><a href="#!/404">404 Page</a></li>    
									  	<li><a href="#!/contact">Contact</a></li>            
									</ul>
				            	</li>
				            	<!-- <li>
				              		<a href="#!/DiscussionCreate">Create Discussion</a>				   
			            		</li> -->
				          	</ul>
				        </div>
			   	 		<!-- /.navbar-collapse -->
			    	</nav>
			    </div>
	   	 		<!-- /.Navbar --> 		   	 		
	  		</div>       
		</div>
	</section>
	<!-- / menu -->

	<div ng-view></div>

	<!-- Subscribe section -->
	<section id="aa-subscribe">
		<div class="container">
			<div layout="row">
				<div class="aa-subscribe-area">
					<h3>Subscribe our newsletter </h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex, velit!</p>
					<form action="" class="aa-subscribe-form">
						<input type="email" name="" id="" placeholder="Enter your Email">
						<input type="submit" value="Subscribe">
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- / Subscribe section -->

	<!-- footer -->  
	<footer id="aa-footer">
		<!-- footer bottom -->
		<div class="aa-footer-top">
			<div class="container">
				<div layout="row">
					<div class="aa-footer-top-area">
						<div layout="row" layout-xs="column">
							<div flex="25" flex-xs="100">
								<div class="aa-footer-widget">
									<h3>Main Menu</h3>
									<ul class="aa-footer-nav">
										<li><a href="#">Home</a></li>
										<li><a href="#">Our Services</a></li>
										<li><a href="#">Our Products</a></li>
										<li><a href="#">About Us</a></li>
										<li><a href="#">Contact Us</a></li>
									</ul>
								</div>
							</div>
							<div flex="25" flex-xs="100">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Knowledge Base</h3>
										<ul class="aa-footer-nav">
											<li><a href="#">Delivery</a></li>
											<li><a href="#">Returns</a></li>
											<li><a href="#">Services</a></li>
											<li><a href="#">Discount</a></li>
											<li><a href="#">Special Offer</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div flex="25" flex-xs="100">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Useful Links</h3>
										<ul class="aa-footer-nav">
											<li><a href="#">Site Map</a></li>
											<li><a href="#">Search</a></li>
											<li><a href="#">Advanced Search</a></li>
											<li><a href="#">Suppliers</a></li>
											<li><a href="#">FAQ</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div flex="25" flex-xs="100">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Contact Us</h3>
										<address>
											<p> 25 Astor Pl, NY 10003, USA</p>
											<p><span class="fa fa-phone"></span>+1 212-982-4589</p>
											<p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
										</address>
										<div class="aa-footer-social">
											<a href="#"><span class="fa fa-facebook"></span></a>
											<a href="#"><span class="fa fa-twitter"></span></a>
											<a href="#"><span class="fa fa-google-plus"></span></a>
											<a href="#"><span class="fa fa-youtube"></span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-bottom -->
		<div class="aa-footer-bottom">
			<div class="container">
				<div layout="row">
					<div class="aa-footer-bottom-area">
						<p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
						<div class="aa-footer-payment">
							<span class="fa fa-cc-mastercard"></span>
							<span class="fa fa-cc-visa"></span>
							<span class="fa fa-paypal"></span>
							<span class="fa fa-cc-discover"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- / footer -->

	<!-- Login Modal -->  
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">                      
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4>Login or Register</h4>
					<form class="aa-login-form" action="">
						<label for="">Username or Email address<span>*</span></label>
						<input type="text" placeholder="Username or email">
						<label for="">Password<span>*</span></label>
						<input type="password" placeholder="Password">
						<button class="aa-browse-btn" type="submit">Login</button>
						<label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
						<p class="aa-lost-password"><a href="#">Lost your password?</a></p>
						<div class="aa-register-now">
							Don't have an account?<a href="#!/account">Register now!</a>
						</div>
					</form>
				</div>                        
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>    

    <!-- jQuery library -->
	<script src="<c:url value='/static/js/include/jquery-2.2.4.min.js' />"></script>	

	<!-- AngularJS -->
	<script src="<c:url value='/static/js/angular/angular.js' />"></script>
	<script src="<c:url value='/static/js/angular/angular-route.js' />"></script>
	
	<!-- AngularJS file upload -->
	<script src="<c:url value='/static/js/angular/ng-file-upload-shim.js' />"></script>
	<script src="<c:url value='/static/js/angular/ng-file-upload.js' />"></script>
	
	<!-- AngularJS tags -->
	<script src="<c:url value='/static/js/angular/ng-tags-input.js' />"></script>
	
	<!-- AngularJS Slick -->
	<!-- Depends on JQuery and slick slider. The JQuery.js has to be imported first. -->
	<script src="<c:url value='/static/js/angular/angular-slick.min.js' />"></script>
	<script src="<c:url value='/static/js/angular/angular-slick.js' />"></script>
	
	<!-- slick slider -->
	<script src="<c:url value='/static/js/include/slick.js' />"></script>

	<!-- Responsive Navigation Bar -->
	<!-- ui-navbar also uses angular.js -->
	<script src="<c:url value='/static/js/angular/ui-navbar-script.js' />"></script>
	<script src="<c:url value='/static/js/angular/ui-navbar.js' />"></script>
	<script src="<c:url value='/static/js/angular/ui-bootstrap-tpls.js' />"></script>
	<script src="<c:url value='/static/js/angular/ui-navbar-router.js' />"></script>

	<!-- Main -->
	<script src="<c:url value='/static/js/main.js' />"></script>

	<!-- Product view slider -->
	<script src="<c:url value='/static/js/include/jquery.simpleGallery.js' />"></script>
	<script src="<c:url value='/static/js/include/jquery.simpleLens.js' />"></script>
	<!-- Price picker slider -->
	<script src="<c:url value='/static/js/include/nouislider.js' />"></script>
	<!-- Custom js -->
	<script src="<c:url value='/static/js/custom.js' />"></script> 	 
	<!-- Include all compiled plugins (below), 	or include individual files as needed -->
	<script src="<c:url value='/static/js/include/bootstrap.js' />"></script>  
	 
	<!-- Access -->
	<script src="<c:url value='/static/js/access/home.js' />"></script>
	<script src="<c:url value='/static/js/access/account.js' />"></script>
	<script src="<c:url value='/static/js/access/blog-archive-2.js' />"></script>
	<script src="<c:url value='/static/js/access/blog-archive.js' />"></script>
	<script src="<c:url value='/static/js/access/blog-single.js' />"></script>
	<script src="<c:url value='/static/js/access/cart.js' />"></script>
	<script src="<c:url value='/static/js/access/checkout.js' />"></script>
	<script src="<c:url value='/static/js/access/contact.js' />"></script>
	<script src="<c:url value='/static/js/access/product-detail.js' />"></script>
	<script src="<c:url value='/static/js/access/product.js' />"></script>
	<script src="<c:url value='/static/js/access/wishlist.js' />"></script>
	<script src="<c:url value='/static/js/access/404.js' />"></script>
	
	<!-- Discussion Create Page -->
	<script src="<c:url value='/static/js/access/discussioncreate.js' />"></script>
	<script src="<c:url value='/static/js/components/controller/discussCreate-controller.js' />"></script>
	<script src="<c:url value='/static/js/components/filter/countCharacter-filter.js' />"></script>
	<script src="<c:url value='/static/js/components/service/discussCreate-service.js' />"></script>
	
	<!-- Discussion Page -->
	<script src="<c:url value='/static/js/access/discussion.js' />"></script>
	<script src="<c:url value='/static/js/components/controller/discussLanding-controller.js' />"></script>
	<script src="<c:url value='/static/js/components/directives/discussLanding-directives.js' />"></script>
	<script src="<c:url value='/static/js/components/service/discussLanding-service.js' />"></script>
	
	<!-- Angular Material Library --> 
	<script src="<c:url value='/static/js/angular/angular-material.js'/>"></script> 
	<!-- Angular Material requires Angular.js Libraries -->
	<script src="<c:url value='/static/js/angular/angular-animate.js'/>"></script>
	<script src="<c:url value='/static/js/angular/angular-aria.js'/>"></script>
	<script src="<c:url value='/static/js/angular/angular-messages.js'/>"></script>
	
	

</body>
</html>