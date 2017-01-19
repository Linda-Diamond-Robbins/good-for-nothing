/* global angular, $ */

(function() {
  angular.module('app').controller('challengesCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/challenges').then(function(response) {
        $scope.challenges = response.data;

        setTimeout(function() {
          $('.isotope-container-fitrows').isotope('reloadItems');
          $('.filters li.active a').click();
        }, 0);

      });
    };
    window.$scope = $scope;
  });
})();