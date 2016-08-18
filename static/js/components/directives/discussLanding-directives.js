'use strict';

//Custome directives that generate view and contains isolated scopes
angular.module('mySite.discussLanding.directive',[])
.directive('discussionlandingDirective', function(){
	return {
		restrict: 'E', //Element directive
		templateUrl:'view/getView/discussLandingView',
		scope: {
			item: '=itemInfo',
			discussDetail: '&discussDetail',
			switchFavorite: '&switchFavorite',
			hoverGray: '&hoverGray'
		},
		link : function (scope, element, attrs) {
		}
	}
});