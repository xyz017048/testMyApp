'use strict';

angular.module('mySite.blog-single', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/blog-single', {
    templateUrl: 'section/getSection/blog-single',
    controller: 'BlogSingleCtrl'
	});
}])
.controller('BlogSingleCtrl', [function() {

}]);