'use strict';

//Get requested discussion preview boxes from server
//The data URL should be dynamically generated based on the users' selection
angular.module('mySite.discussLanding.factory',[])
.factory('discussionlandingFactory', [ '$http', '$q', function($http, $q) {
	return {
		getDiscussionItems : function() {
			return $http.get('/webapp/discussion/show/ALL/POPULAR/0/12').then(function(response) {
				return response.data;
			}, function(errResponse) {
				console.error('Error while getting discussion items');
				return $q.reject(errResponse);
			});
		}
	}
} ]);
