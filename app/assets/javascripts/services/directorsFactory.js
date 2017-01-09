(function(){
  var directorsFactory = ['$http', function($http){
    var factory = {};
    
    factory.getDirectors = function(){
      return $http.get('api/directors');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('directorsFactory', directorsFactory);
  
}());