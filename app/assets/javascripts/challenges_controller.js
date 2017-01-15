/* global angular */

(function() {
  angular.module('app').controller('challengesCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/challenges').then(function(response) {
        $scope.challenges = response.data;
      });
    };
    window.$scope = $scope;
  });
})();