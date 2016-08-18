'use strict';

angular.module('mySite.product-detail', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/product-detail', {
    templateUrl: 'section/getSection/product-detail',
    controller: 'ProductDetailCtrl'
	});
}])
.controller('ProductDetailCtrl', [function() {

}]);