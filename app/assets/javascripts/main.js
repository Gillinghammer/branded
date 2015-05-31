var app = angular.module('Qarma', ["xeditable"]);
app.run(function($rootScope) {
  $rootScope.current_user_id = $('body').data('current');
});

app.controller('MainCtrl', ['$rootScope', '$scope', '$http', function($rootScope, $scope, $http) {
  // $http.get("http://localhost:3000/users/6").success();
  $scope.company = {
     name: 'Default',
     facebook: 'fb',
     twitter: '@twitter',
     id: '1'
   };
   $scope.editMode = false;
  $scope.toggleEditMode = function() {
    $scope.editMode = !$scope.editMode;
  }

  $http.get('http://localhost:3000/users/' + $rootScope.current_user_id + '.json')
    .then(function(result){
      console.log("req successful")
      $scope.company = {
         name: result.data.company_name,
         facebook: result.data.company_facebook,
         twitter: result.data.company_twitter,
         id: result.data.company_id
       };
    });
}]);
