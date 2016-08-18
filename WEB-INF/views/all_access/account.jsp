<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
	<img src="<c:url value='/static/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Account Page</h2>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Account</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="aa-myaccount">
	<div class="container">
		<div layout="row">
			<div class="aa-myaccount-area">
				<div layout-gt-sm="row">
					<div flex-gt-sm="50">
						<div class="aa-myaccount-login">
							<h4>Login</h4>
							<form action="" class="aa-login-form">
								<label for="">Username or Email address<span>*</span></label> <input type="text"
									placeholder="Username or email"> <label for="">Password<span>*</span></label> <input type="password"
									placeholder="Password">
								<button type="submit" class="aa-browse-btn">Login</button>
								<label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme"> Remember me
								</label>
								<p class="aa-lost-password">
									<a href="#">Lost your password?</a>
								</p>
							</form>
						</div>
					</div>
					<div flex-gt-sm="50">
						<div class="aa-myaccount-register">
							<h4>Register</h4>
							<form action="" class="aa-login-form">
								<label for="">Username or Email address<span>*</span></label> <input type="text"
									placeholder="Username or email"> <label for="">Password<span>*</span></label> <input type="password"
									placeholder="Password">
								<button type="submit" class="aa-browse-btn">Register</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / Cart view section -->