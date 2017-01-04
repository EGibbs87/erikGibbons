(function(){
  var listingsFactory = function($http){
    var factory = {};
    
    factory.getListings = function(){
      return $http.get('api/listings');
    }
    
    return factory;
  };
  
  listingsFactory.$inject = ['$http'];
  
  angular.module('EgMovieList').factory('listingsFactory', listingsFactory);
  
}());