'use strict';

angular.module('mySite.product', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/product', {
    templateUrl: 'section/getSection/product',
    controller: 'ProductCtrl'
	});
}])
.controller('ProductCtrl', [function() {

}]);