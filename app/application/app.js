'use strict';

/**
 * @ngdoc overview
 * @name mySiteApp
 * @description
 * # mySiteApp
 *
 * Main module of the application.
 */
angular
  .module('mySiteApp', [
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'application/components/main/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/about', {
        templateUrl: 'application/components/about/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
