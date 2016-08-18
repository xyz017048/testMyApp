'use strict';

//Declare app level module which depends on view and components
angular
.module('mySite.discussLanding', [
    'mySite.discussLanding.controller',
    'mySite.discussLanding.factory',
    'mySite.discussLanding.directive','ngRoute'                                   
])
.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/discussion', {
	    templateUrl: 'section/getSection/discussLanding',
	    controller: 'discussionlandingController',
	    directive:'discussionlandingDirective',
	    factory:'discussionlandingFactory'
	});
}]);
