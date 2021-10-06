(function(){
  var episodesFactory = ['$http', function($http){
    var factory = {};
    
    factory.getEpisodes = function(imdb_id, title){
      return $http.get("api/episodes/" + imdb_id + "?title=" + title);
    }

    factory.getEpisodesBatch = function(params){
      return $http.get("api/episodes_batch/" + params);
    }

    factory.getOmdbData = function(q){
      return $http.get("api/omdb/" + q);
    }

    factory.getOmdbBatchData = function(q){
      return $http.get("api/omdb_batch/" + q);
    }
    
    return factory;
  }];
  
  angular.module('TVCharts').factory('episodesFactory', episodesFactory);
  
}());