<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
	<img src="<c:url value='/static/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Contact</h2>
				<ol class="breadcrumb">
					<li><a href="#!/home">Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<!-- / catg header banner section -->
<!-- start contact section -->
<section id="aa-contact">
	<div class="container">
		<div layout="row">
			<div class="aa-contact-area">
				<div class="aa-contact-top">
					<h2>We are wating to assist you..</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi, quos.</p>
				</div>
				<!-- contact map -->
				<div class="aa-contact-map">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.3714257064535!2d-86.7550931378034!3d34.66757706940219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8862656f8475892d%3A0xf3b1aee5313c9d4d!2sHuntsville%2C+AL+35813%2C+USA!5e0!3m2!1sen!2sbd!4v1445253385137"
						width="100%" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
				</div>
				<!-- Contact address -->
				<div class="aa-contact-address">
					<div layout-gt-sm="row">
						<div flex-gt-sm="67">
							<div class="aa-contact-address-left">
								<form class="comments-form contact-form" action="">
									<div layout-gt-sm="row">
										<div flex-gt-sm="50">
											<div class="form-group">
												<input type="text" placeholder="Your Name" class="form-control">
											</div>
										</div>
										<div flex-gt-sm="50">
											<div class="form-group">
												<input type="email" placeholder="Email" class="form-control">
											</div>
										</div>
									</div>
									<div layout-gt-sm="row">
										<div flex-gt-sm="50">
											<div class="form-group">
												<input type="text" placeholder="Subject" class="form-control">
											</div>
										</div>
										<div flex-gt-sm="50">
											<div class="form-group">
												<input type="text" placeholder="Company" class="form-control">
											</div>
										</div>
									</div>

									<div class="form-group">
										<textarea class="form-control" rows="3" placeholder="Message"></textarea>
									</div>
									<button class="aa-secondary-btn">Send</button>
								</form>
							</div>
						</div>
						<div flex-gt-sm="33">
							<div class="aa-contact-address-right">
								<address>
									<h4>DailyShop</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum modi dolor facilis! Nihil error, eius.</p>
									<p>
										<span class="fa fa-home"></span>Huntsville, AL 35813, USA
									</p>
									<p>
										<span class="fa fa-phone"></span>+ 021.343.7575
									</p>
									<p>
										<span class="fa fa-envelope"></span>Email: support@dailyshop.com
									</p>
								</address>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>