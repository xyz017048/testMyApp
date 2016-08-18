'use strict';

//Get requested discussion preview boxes from server
//The data URL should be dynamically generated based on the users' selection
angular.module('discussCreate.service',[])
//Get discussion title possible duplicates from back-end
.factory('dataService', [ '$http', '$q', function($http, $q) {
	return {
		getDiscussionItems : function(title) {
			return $http.get('/webapp/discussion/autocomplete/'+ title).then(function(response) {
				return response.data;
			}, function(errResponse) {
				console.error('Error while getting discussion duplicate');
				return $q.reject(errResponse);
			});
		}
	}	
} ])

//Get discussion duplicate checking results from back-end
.factory('dupService', [ '$http', '$q', function($http, $q) {
	return {
		getDiscussionDup : function(title) {
			return $http.get('/webapp/discussion/isDuplicate/'+ title).then(function(response) {
				return response.data;
			}, function(errResponse) {
				console.error('Error while getting discussion duplicate');
				return $q.reject(errResponse);
			});
		}
	}	
} ])

//Get tag autocomplete message from back-end
.factory('tagService', [ '$http', '$q', function($http, $q) {
	return {
		getDiscussionTags : function(query) {
			return $http.get('/webapp/autocomplete/tag/'+ query).then(function(response) {
				if(response.status == 204){
					return [];
				}
				return response.data;
			}, function(errResponse) {
				console.error('Error while getting discussion tags');
				return $q.reject(errResponse);
			});
		}
	}
} ])


//Pass variable(createfeatures) between controller "creatediscussionform" and controller "ModalInstanceCtrl"
//We need check duplication when customer edit existing features. 
.factory('passFeaturesService', function() {
 var savedData = {}
 function set(data) {
   savedData = data;
 }
 function get() {
  return savedData;
 }

 return {
  set: set,
  get: get
 }

});

