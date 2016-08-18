'use strict';

angular.module('mySite.account', ['ngRoute'])

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/account', {
    templateUrl: 'section/getSection/account',
    controller: 'AccountCtrl'
	});
}])
.controller('AccountCtrl', [function() {

}]);