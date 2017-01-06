angular.module('EgMovieList.Home', [
  'ui.router',
  'templates',
  'ngMaterial',
  'ngMdIcons',
  'ui.bootstrap'
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
  
/*.directive('testDirective', function(){
  return {
    template: "<h1>hello bitches</h1>"
  }
})*/
  
.controller('HomeCtrl', ['$http', '$window', 'listingsFactory', '$log', '$location', '$state', '$filter', function($http, $window, listingsFactory, $log, $location, $state, $filter){
  var homeCtrl = this;
  homeCtrl.add_listing = add_listing;
  homeCtrl.sort = 'title';
  homeCtrl.reverseSort = false;
  homeCtrl.sortFunction = sortFunction;
  homeCtrl.icon = 'keyboard_arrow_up';
  
  // Pagination disabled for now -- causing more problems than worth
  // homeCtrl.filteredListings = [];
  // homeCtrl.itemsPerPage = 5;
  // homeCtrl.currentPage = 1;
  // homeCtrl.listingsToDisplay = listingsToDisplay;
  // homeCtrl.pageChanged = pageChanged;
  
  function init() {
    
    listingsFactory.getListings()
      .then(function(response) {
      homeCtrl.listings = $filter('orderBy')(response.data, homeCtrl.sort);
      // if(homeCtrl.reverseSort){ homeCtrl.listings.reverse() };
      // homeCtrl.listingsToDisplay();
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
  } // end of init
  
  init();
  
  /*********************
  *  Private functions *
  * *******************/
  // function pageChanged() {
  //   homeCtrl.listingsToDisplay();
  // }
  
  // function listingsToDisplay() {
  //   var begin = ((homeCtrl.currentPage - 1) * homeCtrl.itemsPerPage);
  //   var end = begin + homeCtrl.itemsPerPage;
  //   if(homeCtrl.reverseSort){
  //     homeCtrl.filteredListings = homeCtrl.listings.slice(homeCtrl.listings.length-end, homeCtrl.listings.length-begin);
  //   }else{
  //     homeCtrl.filteredListings = homeCtrl.listings.slice(begin, end);
  //   }
  // }
  
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
      homeCtrl.reverseSort = !homeCtrl.reverseSort;
      homeCtrl.icon == 'keyboard_arrow_up' ? homeCtrl.icon = 'keyboard_arrow_down' : homeCtrl.icon = 'keyboard_arrow_up';
      // homeCtrl.currentPage = 1;
      // homeCtrl.pageChanged();
    }else{
      homeCtrl.sort = column;
      homeCtrl.reverseSort = false;
      homeCtrl.icon = 'keyboard_arrow_up';
      // homeCtrl.currentPage = 1;
      // homeCtrl.pageChanged();
    }
  }
}]);