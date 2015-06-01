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
      console.log("req successful")
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

  $scope.lookupPerson = function(email) {

    $http.get('http://localhost:3000/lookups/find/' + $scope.candidate.email)
      .then(function(res){
        console.log("Found lookup record with email", res)
      })


    // $http.post('http://localhost:3000/lookups.json',{email: email})
    //   .then(function(res){
    //     console.log(res)
    //   })
  }

}]);
