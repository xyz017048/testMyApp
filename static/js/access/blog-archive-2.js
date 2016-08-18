'use strict';

angular.module('mySite.blog-archive-2', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/blog-archive-2', {
    templateUrl: 'section/getSection/blog-archive-2',
    controller: 'Blog2Ctrl'
	});
}])
.controller('Blog2Ctrl', [function() {

}]);