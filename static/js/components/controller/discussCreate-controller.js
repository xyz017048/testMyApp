'use strict';

//discussLanding-controller received data from discussLanding-service
angular.module('discussCreate.controller',['ngFileUpload', 'ngTagsInput', 'ui.bootstrap', 'ngAnimate'])
//Main controller of create discussion page
.controller('creatediscussionform', ['$scope', '$log', 'Upload', '$timeout', '$http', 'dataService', 'dupService', 'tagService', '$uibModal', 'passFeaturesService', '$filter', function($scope, $log, Upload, $timeout, $http, dataService, dupService, tagService, $uibModal, passFeaturesService, $filter){
     $scope.categories = ["Apparel & Accessories", "Arts & Entertainment", "Baby & Toddler", "Business & Industrial", "Electronics", "Food, Beverages & Tobacco", "Furniture", "Health & Beauty", "Home & Garden", "Media", "Luggage & Bags", "Pet Supplies", "Sporting Goods", "Toys & Games", "Vehicles & Parts"];                 
	 $scope.titleDuplicates = [];  //Possible Duplicates results
	 $scope.discussionCategory = "";
	 $scope.createFeatures = [];
	 $scope.discussionTags = [];
	 $scope.photoTags = [];
	 $scope.titleTip = "";  //Remind customer that make unique title
	 $scope.submitTip =  false; 
	 $scope.tip1 = "3 More Features Required";
	 $scope.photoTitle = "";
	 var timeout;
	 
	//Watch "Discussion Title Input" change, if input value changed, get possible duplicate title from server
	$scope.$watch('createDiscussionTitle', function(newVal, oldVal){
		//If customer delete the content which has inputed, empty titleDuplicates
		if(!newVal){
			$scope.titleDuplicates = [];
		};
		if(newVal && newVal != oldVal){
			//reviseDiscussionTitle is a temporary variable for replace special characters in title input ($scope.createDiscussionTitle).
			//Starting replace special characters.
			var reviseDiscussionTitle = "";
		    for (var i = 0; i <  $scope.createDiscussionTitle.length; i++) {
		    	reviseDiscussionTitle = reviseDiscussionTitle + $scope.createDiscussionTitle.substr(i, 1).replace(/[^\w\s]|_/g, "").replace(/\s+/g, " ");
		    };
		    $scope.createDiscussionTitle = reviseDiscussionTitle;
		    //Ending replace special characters.
		    
		    //Query back-end to get possible duplicate title. 
		    if(typeof $scope.createDiscussionTitle == 'string' && $scope.createDiscussionTitle.length > 0){
		    	if(timeout){
		    		$timeout.cancel(timeout);
		    	};
		    	timeout = $timeout(function(){
					dataService.getDiscussionItems(reviseDiscussionTitle).then(function(data) {		
						$scope.titleDuplicates = data;
					}, function(errResponse) {
						console.error("Unable to get discussion duplicates");
					})}, 1000);	
		    }
		}
	 });
	
	//Check discussion title duplication. If the title is duplicate with another, show the tip to remind the customer "title cannot be duplicated"
	$scope.checkDuplicate = function($event){
		dupService.getDiscussionDup($scope.createDiscussionTitle).then(function(data) {		
			if(data){
				$scope.titleTip = "Discussion titles must be unique. The title you've selected is already being used. Please select a different title.";
			}else{
				$scope.titleTip = "";
			};
		}, function(errResponse) {
			console.error("Unable to get discussion duplicates");
		});
		if(!$scope.titleTip){
			$scope.titleTipShow = false;  //When discussion title loss focus, hide titleTip.
		};
	};
	
	//$scope.titleTipShow decide whether display the possible duplicate or not.
	//Possible duplicate showed when customer is typing.
	$scope.showPossibleDup = function($event){
		$scope.titleTip = "";
		$scope.titleTipShow = true;
	};
	
	//Feature section, "Add" button, push feature input content to 
	 $scope.addFeature = function(){
		 //tip1 is "x more feature(s) required"
		 //tip2 is for title duplicate check, title filling check and detail filling check. 
		 //tip3 is for details duplicate check. (Separate from tip2 because we need remind customer)
		 $scope.tip2="";
		 $scope.tip3="";
		 $scope.duplicateFeatureNumD = "";
		 var tempFeaturesT = [];   //As temporary variable, store all existing feature title data. For Feature duplicate checking.
		 var tempFeaturesD = [];   //As temporary variable, store all existing feature details data. For Feature duplicate checking.
		 for (var x in $scope.createFeatures){
			 tempFeaturesT.push($scope.createFeatures[x].title); 
			 tempFeaturesD.push($scope.createFeatures[x].details);
		 };
		 if($scope.createFeature.title && $scope.createFeature.details && !$filter('characterCounter')($scope.createFeature.title, 80) && !$filter('characterCounter')($scope.createFeature.details, 300)){    //If feature title and feature detail are both entered. We don't allow customer enter empty feature.
			 
			 if(tempFeaturesT.indexOf($scope.createFeature.title) == -1 && tempFeaturesD.indexOf($scope.createFeature.details) == -1){   //If feature is not duplicated, add $scope.createFeature to $scope.createFeatures
				$scope.createFeatures.push($scope.createFeature);
				passFeaturesService.set($scope.createFeatures);  //Pass data to controller 'ModalInstanceCtrl'.
				if($scope.createFeatures.length < 3){
					$scope.num = 3 - $scope.createFeatures.length;
					$scope.tip1 = $scope.num + " More Feature(s) Required";
				}else{
					$scope.tip1 = "";
				}
				$scope.createFeature = "";
			}else if(tempFeaturesT.indexOf($scope.createFeature.title) != -1){  //If feature title is duplicated, tell customer title is duplicated.
				$scope.tip2 = "Features must be unique. You already have a feature with that title.";
			}else if(tempFeaturesD.indexOf($scope.createFeature.details) != -1){   // If feature detail is duplicated, tell customer detail is duplicated.			
				$scope.duplicateFeatureNumD = tempFeaturesD.indexOf($scope.createFeature.details);
				$scope.tip3 = "Features must be unique. You already have a feature with an identical feature detail";
			};
			
		 }else if(!$scope.createFeature.title){  // If customer did not enter feature title, give the tip.
			 $scope.tip2="Please fill in the feature title.";
		 }else if(!$scope.createFeature.details){  //If customer did not enter feature detail, give the tip.
			 $scope.tip2="Please fill the feature details.";
		 };
	 };
	 
	 //Feature section, "cancel" button
	 $scope.cancelFeature = function(index){
		$scope.createFeatures.splice(index, 1);
		if($scope.createFeatures.length < 3){
			$scope.num = 3 - $scope.createFeatures.length;
			$scope.tip1 = $scope.num + " More feature(s) required";
		}else{
			$scope.tip1 = "";
		}
	};
	
	//Feature section, revise existing feature
	 $scope.editFeature = function(index){
		 $scope.modalTip = "";
		var reviseTemp = angular.copy($scope.createFeatures[index]);
		 var modalInstance = $uibModal.open({
		      animation: true,
		      templateUrl: 'myModalContent.html',
		      controller: 'ModalInstanceCtrl',
		      size: 'lg',
		      resolve: {
		        items: function () {
		          return reviseTemp;
		        },
		 		indexNum: function() {
		 			return index; 
		 		}
		      }
		    });

	    modalInstance.result.then(function (revised) {
	      $scope.createFeatures[index] = revised;
	    }, function () {
	      $log.info('Modal dismissed at: ' + new Date());
	    });
	};
	
	//Convert category name in order to be acceptable for back-end
	$scope.convertCategory = function(category){
		if(category == "Apparel & Accessories"){ $scope.discussionCategory = "APPAREL_ACCESSORIES"};
		if(category == "Arts & Entertainment"){ $scope.discussionCategory = "ARTS_ENTERTAINMENT"};
		if(category == "Baby & Toddler"){ $scope.discussionCategory = "BABY_TODDLER"};
		if(category == "Business & Industrial"){ $scope.discussionCategory = "BUSINESS_INDUSTRIAL"};
		if(category == "Electronics"){ $scope.discussionCategory = "ELECTRONICS"};
		if(category == "Food, Beverages & Tobacco"){ $scope.discussionCategory = "FOOD_BEVERAGES_TOBACCO"};
		if(category == "Furniture"){ $scope.discussionCategory = "FURNITURE"};
		if(category == "Health & Beauty"){ $scope.discussionCategory = "HEALTH_BEAUTY"};
		if(category == "Home & Garden"){ $scope.discussionCategory = "HOME_GARDEN"};
		if(category == "Luggage & Bags"){ $scope.discussionCategory = "LUGGAGE_BAGS"};
		if(category == "Media"){ $scope.discussionCategory = "MEDIA"};
		if(category == "Pet Supplies"){ $scope.discussionCategory = "PET_SUPPLIES"};
		if(category == "Sporting Goods"){ $scope.discussionCategory = "SPORTING_GOODS"};
		if(category == "Toys & Games"){ $scope.discussionCategory = "TOYS_GAMES"};
		if(category == "Vehicles & Parts"){ $scope.discussionCategory = "VEHICLES_PARTS"};
	};
	
	 //Tag section auto-complete load
	 $scope.loadTags = function(query) {
		  return tagService.getDiscussionTags(query);
	};
	
	//2< Tag character <45, ng-tags-input plugin can limit the character, but I need give customer the tip.
	$scope.invalidTagInput = function(tag) {
		if(tag.text.length <= 2){
			$scope.tagInputLenTip = "Tag should be longer than 2 characters.";
		}else if(tag.text.length >= 45){
			$scope.tagInputLenTip = "Tag should be shorter than 45 characters.";
		};
	};
	
	$scope.emptyInputLenTip = function() {
		  $scope.tagInputLenTip = "";
	};
	
	//Upload picture function. Triggered by clicking "upload" button in photo section
	 $scope.uploadPic = function(file) {
		$scope.f = file;
		if(file){
			  file.upload = Upload.upload({
			  url: '/webapp/fileOperation/upload',
			  data: {file: file, public: true},
			});
	
			file.upload.then(function (response) {
			  $timeout(function () {
				file.result = response.data;
			  });
			}, function (response) {
			  if (response.status > 0)
				$scope.errorMsg = response.status + ': ' + response.data;
			}, function (evt) {
			  // Math.min is to fix IE which reports 200% sometimes
			  file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
			});
		}
	};
	
	//auto upload the picture.
	$scope.$watch('picFile', function(newVal, oldVal){
		if(newVal && newVal != oldVal){
			$scope.uploadPic($scope.picFile);
		};
		
	 });
	
	//2< tag character <45,  ng-tags-input plugin can limit the character, but I need give customer the tip.
	$scope.invalidTagInputPho = function(tag) {
		if(tag.text.length <= 2){
			$scope.tagInputLenTipPho = "Tag should be longer than 2 characters.";
		}else if(tag.text.length >= 45){
			$scope.tagInputLenTipPho = "Tag should be shorter than 45 characters.";
		};
	};
	
	$scope.emptyInputLenTipPho = function() {
		  $scope.tagInputLenTipPho = "";
	};
	
	//Submit form function
	$scope.submitForm = function(preValid){
		//"preValid" means normal validation which Angularjs can deal with.
		//!($scope.createFeatures[2] == '' || $scope.createFeatures[2] == null) means we have 3 features at least.
		//!($scope.discussionTags == '' || $scope.discussionTags == null) means we have 1 tag at least.
		var isValid = preValid && !($scope.createFeatures[2] == '' || $scope.createFeatures[2] == null) && !($scope.discussionTags == '' || $scope.discussionTags == null) && !$filter('characterCounter')($scope.createDiscussionTitle, 200) && !$filter('characterCounter')($scope.discussionSummary, 1000) && !$scope.titleTip;
		if(isValid){
			var discussionTags = [];
			for(var key in $scope.discussionTags){
				discussionTags.push($scope.discussionTags[key].text);
			};
			var photoTags = [];
			for(var key in $scope.photoTags){
				photoTags.push($scope.photoTags[key].text);
			};
			if($scope.picFile){    // Upload with picture.
				var dataObj = {
						discussionTitle : $scope.createDiscussionTitle,
						summary : $scope.discussionSummary,
						category : $scope.discussionCategory,
						uploadPhoto : {
							fileUploadId : $scope.f.result,
							title : $scope.photoTitle,
							tags : photoTags,
							},
						features : $scope.createFeatures,
						tags : discussionTags,
				};
			}else{                //Upload without picture.
				var dataObj = {
						discussionTitle : $scope.createDiscussionTitle,
						summary : $scope.discussionSummary,
						category : $scope.discussionCategory,
						features : $scope.createFeatures,
						tags : discussionTags,
					};
			};
			var res = $http.post('/webapp/discussion/create', dataObj);
			res.success(function(data, status, headers, config) {
				$scope.message = data;
				alert("You created a new discussion!");
			});
			res.error(function(data, status, headers, config) {
				alert( "Failure Message: " + JSON.stringify({data: data}));
			});
		}else{
			$scope.submitTip = true;
		};
	};
	 
}])

//ui-bootstrap modal controller for create discussion page tags edit part
.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, items, indexNum, passFeaturesService, $filter) {
	  $scope.reviseFeature = items;
	  $scope.$watch('reviseFeature.title', function(newVal, oldVal){
			if(newVal && newVal != oldVal){
				$scope.modalTip = "";
			};
		 });
	  $scope.$watch('reviseFeature.feature', function(newVal, oldVal){
			if(newVal && newVal != oldVal){
				$scope.modalTip2 = "";
			};
		 });
	  $scope.ok = function () {
		 $scope.modalTip="";
		 $scope.modalTip2="";
		 $scope.duplicateFeatureNumD = "";
		 var tempModalFeaturesT = [];
		 var tempModalFeaturesD = [];
		 $scope.createFeatures = passFeaturesService.get();
		 for (var x in $scope.createFeatures){
			 tempModalFeaturesT.push($scope.createFeatures[x].title); 
			 tempModalFeaturesD.push($scope.createFeatures[x].details);
		 };
		 if(items.title && items.details && !$filter('characterCounter')(items.title, 80) && !$filter('characterCounter')(items.details, 300)){    //If feature title and feature detail are both entered. We don't allow customer enter empty feature.
		    if(tempModalFeaturesT.indexOf(items.title) != -1 && $scope.createFeatures[indexNum].title != items.title){  //If feature title is duplicated, tell customer title is duplicated.
				$scope.modalTip = "Features must be unique. You already have a feature with that title.";
			}else if(tempModalFeaturesD.indexOf(items.details) != -1  && $scope.createFeatures[indexNum].details != items.details){   // If feature detail is duplicated, tell customer which feature detail is duplicated.
				$scope.duplicateFeatureNumD = tempModalFeaturesD.indexOf(items.details);
				$scope.modalTip2 = "Features must be unique. You already have a feature with an identical feature detail";
			}else{   //If feature is not duplicated, add $scope.createFeature to $scope.createFeatures
		    	$uibModalInstance.close($scope.reviseFeature);
			};
			
		 }else if(!items.title){  // If customer did not enter feature title, give the tip.
			 $scope.modalTip="Please fill in the feature title.";
		 }else if(!items.details){  //If customer did not enter feature detail, give the tip.
			 $scope.modalTip="Please populate the feature details field.";
		 };
		 
	  };
	
	  $scope.cancel = function () {    
	    	$uibModalInstance.dismiss('cancel');
	  };
});

