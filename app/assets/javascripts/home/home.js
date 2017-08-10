angular.module('ErikGibbons.Home', [
  'ui.router',
  'templates',
  'ngMaterial',
  'ngMdIcons',
  'ui.bootstrap',
  'ngSanitize'
])

.config(['$stateProvider', function($stateProvider){
  $stateProvider
    .state('erikgibbons.home', {
      url: '/',
      views: {
        'main@': { // target the 'main' ng-view directive
          controller:  'HomeCtrl as homeCtrl',
          templateUrl: 'home/home.tmpl.html'
        }
      }
    })
  }])
  
/*.directive('testDirective', function(){
  return {
    template: "<h1>hello bitches</h1>"
  }
})*/
  
.controller('HomeCtrl', ['$q', '$uibModal', '$http', '$window', '$log', '$location', '$state', '$filter', '$timeout', function($q, $uibModal, $http, $window, $log, $location, $state, $filter, $timeout, $document){
  var homeCtrl = this;

  function init() {
  } // end of init
  
  init();
  
  /*********************
  *  Private functions *
  * *******************/
}]);