'use strict';

angular.module('mySite.contact', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/contact', {
    templateUrl: 'section/getSection/contact',
    controller: 'ContactCtrl'
	});
}])
.controller('ContactCtrl', [function() {

}]);