'use strict';

angular.module('mySite.checkout', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/checkout', {
    templateUrl: 'section/getSection/checkout',
    controller: 'CheckoutCtrl'
	});
}])
.controller('CheckoutCtrl', [function() {

}]);