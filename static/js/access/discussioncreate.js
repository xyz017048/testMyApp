'use strict';
 

angular.module('dformapp', [
                            'countCharacter.filter', 
                            'discussCreate.controller',
                            'discussCreate.service',
                            'ngRoute'])//'ngFileUpload', 'ui.bootstrap', 'ngMaterial', 'ngTagsInput'

.config(['$routeProvider', function($routeProvider){
	$routeProvider.when('/DiscussionCreate', {
    templateUrl: 'section/getSection/DiscussionCreate',
    controller: 'creatediscussionform'
	});
}])