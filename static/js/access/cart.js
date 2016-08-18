'use strict';

angular.module('mySite.cart', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/cart', {
    templateUrl: 'section/getSection/cart',
    controller: 'CartCtrl'
	});
}])
.controller('CartCtrl', [function() {

}]);