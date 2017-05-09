(function(){
  var failuresFactory = ['$http', function($http){
    var factory = {};
    
    factory.getFailures = function(){
      return $http.get('api/failures');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('failuresFactory', failuresFactory);
  
}());