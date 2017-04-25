(function(){
  var writersFactory = ['$http', function($http){
    var factory = {};
    
    factory.getWriters = function(){
      return $http.get('api/writers');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('writersFactory', writersFactory);
  
}());