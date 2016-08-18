'use strict';

//Custome directives that generate view and contains isolated scopes
angular.module('countCharacter.filter',[])
//Count character of textarea and input. This filter can have 2 parameter.
//The second parameter must be a number, and it means the maximum character.
.filter('characterCounter', function () {
    return function (value, num) {
        if(num){
        	if (value && (typeof value === 'string')) {
	            return value.length > num;
	        }else{
	            return false;
	        };
        }else{
        	if (value && (typeof value === 'string')) {
	            return value.length;
	        }else{
	            return 0;
	        };
        }
    };
});