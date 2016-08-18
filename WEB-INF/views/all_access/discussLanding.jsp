<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- catg header banner section -->
<section id="aa-catg-head-banner">
	<img src="<c:url value='/static/img/fashion/fashion-header-bg-8.jpg' />" alt="fashion img">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Discussion</h2>
				<ol class="breadcrumb">
					<li><a href="#!/home">Home</a></li>
					<li class="active">Discussion</li>
				</ol>
				<button><a href="#!/DiscussionCreate">Create Discussion</a></button>
			</div>
		</div>
	</div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-category">
	<div class="container">
		<div layout-gt-sm="row">
			<div flex-gt-sm="75">
				<div class="aa-product-catg-content">
					<div class="aa-product-catg-head">
						<div class="aa-product-catg-head-left">
							<form action="" class="aa-sort-form">
								<label for="">Sort by</label> <select name="">
									<option value="1" selected="Default">Default</option>
									<option value="2">Name</option>
									<option value="3">Price</option>
									<option value="4">Date</option>
								</select>
							</form>
							<form action="" class="aa-show-form">
								<label for="">Show</label> <select name="">
									<option value="1" selected="12">12</option>
									<option value="2">24</option>
									<option value="3">36</option>
								</select>
							</form>
						</div>
						<div class="aa-product-catg-head-right">
							<a id="grid-catg" href="#"><span class="fa fa-th"></span></a> <a id="list-catg" href="#"><span
								class="fa fa-list"></span></a>
						</div>
					</div>
					<div class="aa-product-catg-body">
						<!-- start single product item -->		
						<ul ng-controller="discussionlandingController as ctrl">
							<discussionlanding-directive ng-repeat="it in ctrl.discussionItems | orderBy:sequence" item-info="it" discuss-detail="ctrl.discussDetail(selectedItem)" switch-favorite="ctrl.switchFavorite(box)" hover-gray="ctrl.hoverGray(box)"/>
						</ul>
						<!-- quick view modal --><!-- / quick view modal -->
					</div>
					<div class="aa-product-catg-pagination">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<div flex-gt-sm="25">
				<aside class="aa-sidebar">
					<!-- single sidebar -->
					<div class="aa-sidebar-widget">
						<h3>Category</h3>
						<ul class="aa-catg-nav">
							<li><a href="#">Men</a></li>
							<li><a href="">Women</a></li>
							<li><a href="">Kids</a></li>
							<li><a href="">Electornics</a></li>
							<li><a href="">Sports</a></li>
						</ul>
					</div>
					<!-- single sidebar -->
					<div class="aa-sidebar-widget">
						<h3>Tags</h3>
						<div class="tag-cloud">
							<a href="#">Fashion</a> <a href="#">Ecommerce</a> <a href="#">Shop</a> <a href="#">Hand Bag</a> <a href="#">Laptop</a>
							<a href="#">Head Phone</a> <a href="#">Pen Drive</a>
						</div>
					</div>
					<!-- single sidebar -->
					<div class="aa-sidebar-widget">
						<h3>Recently Views</h3>
						<div class="aa-recently-views">
							<ul>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-2.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-1.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-2.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
							</ul>
						</div>
					</div>
					<!-- single sidebar -->
					<div class="aa-sidebar-widget">
						<h3>Top Rated Products</h3>
						<div class="aa-recently-views">
							<ul>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-2.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-1.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
								<li><a href="#" class="aa-cartbox-img"><img alt="img" src="<c:url value='/static/img/woman-small-2.jpg' />"></a>
									<div class="aa-cartbox-info">
										<h4>
											<a href="#">Product Name</a>
										</h4>
										<p>1 x $250</p>
									</div></li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>