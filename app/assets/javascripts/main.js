var app = angular.module("app", ["xeditable"]);
app.run(function($rootScope) {
  $rootScope.current_user_id = $('body').data('current');
});

app.run(function(editableOptions) {
  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});

app.controller('MainCtrl', ['$rootScope', '$scope', '$http', function($rootScope, $scope, $http) {
  
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

    $scope.updateCompany = function() {
      $http.put('http://localhost:3000/companies/' + $scope.company.id + ".json", {company: $scope.company} )
        .then(function(result){
          console.log("dfasdfs")
        });
    }
}]);
