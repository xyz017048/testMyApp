'use strict';

angular.module('mySite.blog-archive', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/blog-archive', {
    templateUrl: 'section/getSection/blog-archive',
    controller: 'BlogCtrl'
	});
}])
.controller('BlogCtrl', [function() {

}]);