'use strict';

//discussLanding-controller received data from discussLanding-service
angular.module('mySite.discussLanding.controller',[])
.controller('discussionlandingController', ['discussionlandingFactory', '$location', '$http', function(discussionlandingFactory, $location, $http) {
	
	var self = this;	//Create a reference to this in controller
	self.discussionItems = [];
	self.getItems = function() {
		discussionlandingFactory.getDiscussionItems().then(function(data) {		
			self.discussionItems = data;
		}, function(errResponse) {
			console.error("Unable to get discussion items");
		});
	};
	self.getItems();	//Call getItems function above to store data received from service into discussionItem array
	
	//Redirect to the discussion detail page
	self.discussDetail = function(i){	
		//Unique url for the discussion detail page ('/webapp/discussion/url/here/'+i)
	};
	
	//Update favorite status 
	self.switchFavorite = function(i){
		//need to check if user signed in or not. If not, send to signIn page
		i.isFavorited = !i.isFavorited;
		var result = $http.post('/webapp/favorite/alter/DISCUSSION/'+i.uniqueId+'/'+i.isFavorited);
		result.success(function(data,status, headers, config){
			//Confirm ("success");
		});
		result.error(function(data,status,headers,config){
			if(status == 401){
				alert("Please Sign In first");
			} else {
				console.log("Discussion Landing Preview Boxes area error.");
			}
		});
	};
	
	//Control hover affect of the photo of discussion preview box
	self.hoverGray = function(i){
		if(typeof i.hoverGray == 'undefined'){
			i.hoverGray = false;
		} else {
			i.hoverGray = !i.hoverGray;
		}
	};
} ]);