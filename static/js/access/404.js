'use strict';

angular.module('mySite.404', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/404', {
    templateUrl: 'section/getSection/404',
    controller: '404Ctrl'
	});
}])

.controller('404Ctrl', [function() {

}]);