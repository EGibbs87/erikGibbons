angular.module('EgMovieList.Home', [
  'ui.router',
  'templates',
  'ngMaterial',
  'ngMdIcons'
])

.config(['$stateProvider', function($stateProvider){
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
  }])
  
.controller('HomeCtrl', ['$http', '$window', 'listingsFactory', '$log', '$location', '$state', '$filter', function($http, $window, listingsFactory, $log, $location, $state, $filter){
  var homeCtrl = this;
  homeCtrl.add_listing = add_listing;
  
  function init() {
    
    listingsFactory.getListings()
      .then(function(response) {
      homeCtrl.listings = response.data;
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
  } // end of init
  
  init();
  
  /*********************
  *  Private functions *
  * *******************/
  function add_listing(title, media_type, location, owner, genres, actors, directors) {
    $http.post('/api/add_listing', {
      title: title,
      media_type: media_type,
      location: location,
      owner: owner,
      genres: genres,
      actors: actors,
      directors: directors
    }).then(function(response){
      init();
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
  }
}]);