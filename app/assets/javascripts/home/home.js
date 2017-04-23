angular.module('EgMovieList.Home', [
  'ui.router',
  'templates',
  'ngMaterial',
  'ngMdIcons',
  'ui.bootstrap',
  'vAccordion',
  'ngFileUpload',
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
  
.controller('HomeCtrl', ['$http', '$window', 'listingsFactory', 'genresFactory', 'actorsFactory', 'directorsFactory', '$log', '$location', '$state', '$filter', '$timeout', 'Upload', function($http, $window, listingsFactory, genresFactory, actorsFactory, directorsFactory, $log, $location, $state, $filter, $timeout, Upload){
  var homeCtrl = this;
  homeCtrl.add_listing = add_listing;
  homeCtrl.add_rating = add_rating;
  homeCtrl.browseButton = browseButton;
  homeCtrl.uploadFile = uploadFile;
  homeCtrl.sort = 'title';
  homeCtrl.reverseSort = false;
  homeCtrl.sortFunction = sortFunction;
  homeCtrl.icon = 'keyboard_arrow_up';
  homeCtrl.password_check = 'Movies2017'
  
  // Pagination disabled for now -- causing more problems than worth
  // homeCtrl.filteredListings = [];
  // homeCtrl.itemsPerPage = 5;
  // homeCtrl.currentPage = 1;
  // homeCtrl.listingsToDisplay = listingsToDisplay;
  // homeCtrl.pageChanged = pageChanged;
  
  function init() {
    
    genresFactory.getGenres()
      .then(function(response){
      homeCtrl.genres = $filter('orderBy')(response.data, 'name');
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
    actorsFactory.getActors()
      .then(function(response){
      homeCtrl.actors = $filter('orderBy')(response.data, 'name');
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
    directorsFactory.getDirectors()
      .then(function(response){
      homeCtrl.directors = $filter('orderBy')(response.data, 'name');
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
    
    listingsFactory.getListings()
      .then(function(response) {
      // set default order for listings from API
      homeCtrl.listings = $filter('orderBy')(response.data, homeCtrl.sort);
      // set genres, actors, and directors on listings object
      angular.forEach(homeCtrl.listings, function(obj){ 
        // map
        obj.genres=obj.genres.map(function(g){ 
          return g['name']
        }).join(", "); 
        var actors = new Array();
        var directors = new Array();
        angular.forEach(obj.people, function(p){
          if(p.role === "actor"){
            actors.push(p.name)
          }else{
            directors.push(p.name);
          };
        });
        obj.actors = actors.join(", ");
        obj.directors = directors.join(", ");
      });
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
  
  function uploadFile(file){
    file.upload = Upload.upload({
      url: '/api/upload_file',
      data: {file: file},
    });

    file.upload.then(function (response) {
      $timeout(function () {
        file.result = response.data;
      });
    }, function (response) {
      if (response.status > 0)
        homeCtrl.errorMsg = response.status + ': ' + response.data;
    }, function (evt) {
      // Math.min is to fix IE which reports 200% sometimes
      file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
    });
  }

  function browseButton(category, query){
    if(category == 'genre'){
      homeCtrl.genreFilter = query;
    }else if(category == 'actor'){
      homeCtrl.actorFilter = query;
    }else if(category == 'director'){
      homeCtrl.directorFilter = query;
    }else{
      console.log('Invalid input');
    }
  }
  
  function add_listing(title, media_type, location, owner, genres, actors, directors, imdb_rating) {
    $http.post('/api/add_listing', {
      title: title,
      media_type: media_type,
      location: location,
      owner: owner,
      genres: genres,
      actors: actors,
      directors: directors,
      imdb_rating: imdb_rating
    }).then(function(response){
      init();
    }, function(data, status) {
      $log.log(data.error + ' ' + status);
    });
  }
  
  function add_rating(rating, id){
    $http.post('/api/add_rating', {
      imdb_rating: rating,
      id: id
    }).then(function(response){
    }, function(data, status){
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