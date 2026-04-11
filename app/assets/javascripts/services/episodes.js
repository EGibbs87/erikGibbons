(function(){
  var episodesFactory = ['$http', function($http){
    var factory = {};
    
    factory.getEpisodes = function(imdb_id, title){
      return $http.get("api/episodes/" + imdb_id + "?title=" + title, { cache: false });
    }

    factory.getEpisodesBatch = function(params){
      return $http.get("api/episodes_batch/" + params, { cache: false });
    }

    factory.getOmdbData = function(q){
      return $http.get("api/omdb/" + q, { cache: false });
    }

    factory.getOmdbBatchData = function(q){
      return $http.get("api/omdb_batch/" + q, { cache: false });
    }
    
    return factory;
  }];
  
  angular.module('TVCharts').factory('episodesFactory', episodesFactory);
  
}());