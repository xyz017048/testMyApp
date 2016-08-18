'use strict';

angular.module('mySite.home', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/home', {
    templateUrl: 'section/getSection/home',
    controller: 'HomeCtrl'
	});
}])
.controller('HomeCtrl', [function() {
}]);