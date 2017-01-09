(function(){
  var genresFactory = ['$http', function($http){
    var factory = {};
    
    factory.getGenres = function(){
      return $http.get('api/genres');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('genresFactory', genresFactory);
  
}());