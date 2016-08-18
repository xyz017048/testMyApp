'use strict';

angular.module('mySite.wishlist', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/wishlist', {
    templateUrl: 'section/getSection/wishlist',
    controller: 'WishlistCtrl'
	});
}])
.controller('WishlistCtrl', [function() {

}]);