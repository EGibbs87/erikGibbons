(function(){
  var actorsFactory = ['$http', function($http){
    var factory = {};
    
    factory.getActors = function(){
      return $http.get('api/actors');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('actorsFactory', actorsFactory);
  
}());