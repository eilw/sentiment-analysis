loveIt.controller('trendsController', trendsController);

trendsController.$inject = ['sentimentTrendsFactory', 'presentationFactory', 'resultsFactory'];

function trendsController(sentimentTrendsFactory, presentationFactory, resultsFactory){

  var self = this;
  self.chart = presentationFactory.getChart();

  function loadData(){
    self.chart.data = [[0,0,0],[0,0,0],[0,0,0]];
    if (sentimentTrendsFactory.getSearchTerm() !== undefined){
      self.searchTerm = sentimentTrendsFactory.getSearchTerm();
      var promiseArr = sentimentTrendsFactory.getResults();
      var promise = resultsFactory.getResults(promiseArr);
      promise.then(function(response){
        self.chart.data = response;
      });
    }else{
      self.searchTerm = 'No search term given';
    }
  }
  loadData();
}
