loveIt.controller('dataController',dataController);

dataController.$inject = ['storageFactory', 'presentationFactory'];

function dataController(storageFactory, presentationFactory){
  var self = this;

  getSearchResult();

  function getSearchResult(){
    var results = storageFactory.getSearchResult();
    if ( results !== undefined ) {
      angular.extend(self, results);
      presentationFactory.insertHTML(self.messages);
    } else {
      self.search_term = "No search term given";
      self.positive = 0;
      self.negative = 0;
    }
  }

}
