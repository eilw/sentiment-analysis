loveIt.factory('searchFactory', ['$http', function($http) {

  return {
      query : function(searchParams){
      // var queryUrl = 'http://localhost:3000/search';
      var queryUrl = 'https://does-it-suck-rails.herokuapp.com/search';
      var headers = { headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }};
      return $http.post(queryUrl, searchParams, headers);
      }
  };

}]);
