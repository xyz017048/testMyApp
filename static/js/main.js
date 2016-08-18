'use strict';

//Declare home level module which depends on views, and components
angular
.module('mySite',[ 'ngRoute', 'mySite.home', 'mySite.404', 'mySite.account',
				'mySite.blog-archive-2', 'mySite.blog-archive',
				'mySite.blog-single', 'mySite.cart', 'mySite.checkout',
				'mySite.contact', 'mySite.product-detail', 'mySite.product',
				'mySite.wishlist', 'dformapp', 'slickCarousel', 'ngMaterial', 'uiNavbar', 'ui.bootstrap', 'ngAnimate',
				'mySite.discussLanding'
])
.config([ '$locationProvider', '$routeProvider',function($locationProvider, $routeProvider){
			$locationProvider.hashPrefix('!');
			$routeProvider.otherwise({redirectTo : '/home'});
}])
.config([ 'slickCarouselConfig', function(slickCarouselConfig) {
			slickCarouselConfig.dots = true;
			slickCarouselConfig.autoplay = false;} 
])
.controller('imageslick', function($scope) {
	       //popular product slider (slick slider)
            $scope.slickConfigPopular = {
			    method: {},
			    dots: false,
				arrows: true,
                infinite: false,
                speed: 300,
                slidesToShow: 4,
                slidesToScroll: 4,
                responsive: [
				{
				  breakpoint: 1024,
				  settings: {
					slidesToShow: 3,
					slidesToScroll: 3,
					infinite: true,
					dots: true
				  }
				},
				{
				  breakpoint: 600,
				  settings: {
					slidesToShow: 2,
					slidesToScroll: 2
				  }
				},
				{
				  breakpoint: 480,
				  settings: {
					slidesToShow: 1,
					slidesToScroll: 1
				  }
				}]
            };
            
            //featured product slider (slick slider)
            $scope.slickConfigFeatured = {
            		dots: false,
                    infinite: false,
                    speed: 300,
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    responsive: [
                      {
                        breakpoint: 1024,
                        settings: {
                          slidesToShow: 3,
                          slidesToScroll: 3,
                          infinite: true,
                          dots: true
                        }
                      },
                      {
                        breakpoint: 600,
                        settings: {
                          slidesToShow: 2,
                          slidesToScroll: 2
                        }
                      },
                      {
                        breakpoint: 480,
                        settings: {
                          slidesToShow: 1,
                          slidesToScroll: 1
                        }
                      }]
            };
            
            //latest product slider (slick slider)
            $scope.slickConfigLatest = {
            		dots: false,
                    infinite: false,
                    speed: 300,
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    responsive: [
                      {
                        breakpoint: 1024,
                        settings: {
                          slidesToShow: 3,
                          slidesToScroll: 3,
                          infinite: true,
                          dots: true
                        }
                      },
                      {
                        breakpoint: 600,
                        settings: {
                          slidesToShow: 2,
                          slidesToScroll: 2
                        }
                      },
                      {
                        breakpoint: 480,
                        settings: {
                          slidesToShow: 1,
                          slidesToScroll: 1
                        }
                      }]
            };
            
            //client brand slider (slick slider)
            $scope.slickConfigClientBrand = {
            		dots: false,
                    infinite: true,
                    speed: 300,
                    autoplay: true,
                    autoplaySpeed: 2000,
                    slidesToShow: 5,
                    slidesToScroll: 1,
                    responsive: [
                      {
                        breakpoint: 1024,
                        settings: {
                          slidesToShow: 4,
                          slidesToScroll: 4,
                          infinite: true,
                          dots: true
                        }
                      },
                      {
                        breakpoint: 600,
                        settings: {
                          slidesToShow: 2,
                          slidesToScroll: 2
                        }
                      },
                      {
                        breakpoint: 480,
                        settings: {
                          slidesToShow: 1,
                          slidesToScroll: 1
                        }
                      }]
            };
            
            //testimonial slider (slick slider)
            $scope.slickConfigTestimonial = {
            		dots: true,
            	    infinite: true,
            	    arrows: false,
            	    speed: 300,
            	    slidesToShow: 1,
            	    adaptiveHeight: true
            };
            
            //related item slider (slick slider) not test yet
            $scope.slickConfigRelateditem = {
            		 dots: false,
            	      infinite: false,
            	      speed: 300,
            	      slidesToShow: 4,
            	      slidesToScroll: 4,
            	      responsive: [
            	        {
            	          breakpoint: 1024,
            	          settings: {
            	            slidesToShow: 3,
            	            slidesToScroll: 3,
            	            infinite: true,
            	            dots: true
            	          }
            	        },
            	        {
            	          breakpoint: 600,
            	          settings: {
            	            slidesToShow: 2,
            	            slidesToScroll: 2
            	          }
            	        },
            	        {
            	          breakpoint: 480,
            	          settings: {
            	            slidesToShow: 1,
            	            slidesToScroll: 1
            	          }
            	        }]
            };
 })
 
 
 //Controlling scroll to top button.
 .controller('anchorCtrl', ['$anchorScroll', '$location', '$scope', function($anchorScroll, $location, $scope){
	 $scope.gotoAnchor = function(){
		 //set the location.hash to the id of the element we want to scroll to.
		 $location.hash('aa-header');
		 //call $anchorScroll
		 $anchorScroll();
		 return false;
	 };
 }])

 // Controller for carousel
.controller('CarouselBannerCtrl',function($scope) {
	$scope.myInterval = 5000;
	$scope.noWrapSlides = false;
	$scope.active = 0;
	var slides = $scope.slides = [];
	var currIndex = 0;

	$scope.addSlide = function() {
		var newWidth = slides.length + 1;
		slides
				.push({
					image : '/webapp/static/img/slider/'
							+ newWidth + '.jpg',
					text : [ 'Nice image',
							'Awesome photograph',
							'That is so cool', 'I love that' ][slides.length % 4],
					id : currIndex++
				});
	};

	$scope.randomize = function() {
		var indexes = generateIndexesArray();
		assignNewIndexesToSlides(indexes);
	};

	for (var i = 0; i < 4; i++) {
		$scope.addSlide();
	}
})


 //Watching windows scrolling action.
 .directive("scroll", function ($window){
	 return function(scope, element, attrs){
		 angular.element($window).bind("scroll", function(){
			 if(this.pageYOffset > 300){
				 scope.boolShowScrollClass = true;
			 }else{
				 scope.boolShowScrollClass = false;
			 }
			 scope.$apply();
		 })
	 }
 });   

