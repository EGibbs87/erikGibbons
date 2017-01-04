angular.module('EgMovieList.Home', [
  'ui.router',
  'templates',
  'ngMaterial',
  'ngMdIcons'
])

.config(function($stateProvider){
  $stateProvider
    .state('egmovielist.home', {
      url: '/',
      views: {
        'main@': { // target the 'main' ng-view directive
          controller:  'HomeCtrl as homeCtrl',
          templateUrl: 'home/home.tmpl.html'
        }
      }
    })
  })
  
.controller('HomeCtrl', function($http, $window, listingsFactory, $log, $location, $state, $filter){
  var homeCtrl = this;
  
  function init() {
    
    listingsFactory.getListings()
      .then(function(response) {
      homeCtrl.listings = response.data;
      console.log(homeCtrl.listings);
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
  } // end of init
  
  init();

});
