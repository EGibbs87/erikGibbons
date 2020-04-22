(function(){
  var episodesFactory = ['$http', function($http){
    var factory = {};
    
    factory.getEpisodes = function(imdb_id){
      return $http.get("api/episodes/" + imdb_id);
    }

    factory.getOmdbData = function(q){
      return $http.get("api/omdb/" + q);
    }
    
    return factory;
  }];
  
  angular.module('TVCharts').factory('episodesFactory', episodesFactory);
  
}());