var app = angular.module("app", ["xeditable"]);

app.run(function($rootScope) {
  $rootScope.current_user_id = $('body').data('current');
});

app.run(function(editableOptions) {
  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});

app.controller('MainCtrl', ['$rootScope', '$scope', '$http', function($rootScope, $scope, $http) {
  // Load data
  $http.get('http://localhost:3000/users/' + $rootScope.current_user_id + '.json')
    .then(function(result){
      $scope.company = {
         name: result.data.company_name,
         facebook_id: result.data.company_facebook,
         twitter_id: result.data.company_twitter,
         email_domain: result.data.company_domain,
         id: result.data.company_id
       };
    });
  // Update Company function
  $scope.updateCompany = function() {
    $http.put('http://localhost:3000/companies/' + $scope.company.id + ".json", {company: $scope.company} )
      .then(function(result){
        console.log("Company Updated")
    })
  };

  $scope.candidate = {
    email: "",
    facebook: "",
    twitter: ""
  }

  $scope.getSearches = function() {
    $http.get('http://localhost:3000/searches.json')
      .then(function(res){
        console.log("Searches", res)
        $scope.searches = res.data
      });
  }

  $scope.addLookup = function(email) {
    console.log('Lookup Not found, creating one instead');
    $http.post('http://localhost:3000/lookups.json',{email: email})
      .then(function(res){
        console.log("Adding lookup to database")
        // recursion to identify newly created lookup
        $scope.lookupPerson(email);
      });
  };

  $scope.createSearch = function(lookup) {
    console.log("Creating new search for UserId: " + $rootScope.current_user_id + "and LookupId: ", lookup)
    $http.post("http://localhost:3000/searches.json", {"search": {"lookup_id": lookup.data.id, "user_id": $rootScope.current_user_id}})
      .then(function(res){
        console.log("Search created")
      });
  }

  $scope.lookupPerson = function(email) {
    $scope.person_response = '';
    $http.get('http://localhost:3000/lookups/find/' + $scope.candidate.email)
      .then(function(response) {
        if(response.data.id != undefined) {
          console.log("Lookup found")
          $scope.createSearch(response)
        } else {
          $scope.addLookup(email)
        };
      });
  }

  $scope.getSearches();

}]);
