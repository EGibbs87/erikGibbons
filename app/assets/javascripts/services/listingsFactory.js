(function(){
  var listingsFactory = ['$http', function($http){
    var factory = {};
    
    factory.getListings = function(){
      return $http.get('api/listings');
    }
    
    return factory;
  }];
  
  angular.module('EgMovieList').factory('listingsFactory', listingsFactory);
  
}());