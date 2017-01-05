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
  homeCtrl.sort = 'title';
  homeCtrl.sort_reverse = false;
  homeCtrl.sortFunction = sortFunction;
  homeCtrl.icon = 'keyboard_arrow_up';
  
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
  
  function sortFunction(column){
    if(homeCtrl.sort === column){
      homeCtrl.sort_reverse = !homeCtrl.sort_reverse;
      homeCtrl.icon == 'keyboard_arrow_up' ? homeCtrl.icon = 'keyboard_arrow_down' : homeCtrl.icon = 'keyboard_arrow_up';
    }else{
      homeCtrl.sort = column;
      homeCtrl.sort_reverse = false;
      homeCtrl.icon = 'keyboard_arrow_up'
    }
  }
}]);