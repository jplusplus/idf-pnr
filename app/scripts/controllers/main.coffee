MainCtrl = ($scope, $http, $routeParams, $location) ->
    # Get the data object
    $http.get("data/main.json").success (data)-> $scope.data = data
    # Info box ID
    $scope.parc = $routeParams.parc     
    # Read the location's search to update the scope
    $scope.$on '$routeUpdate', -> $scope.parc = $routeParams.parc
    $scope.getParc = -> _.findWhere $scope.data, slug: $scope.parc


MainCtrl.$inject = ['$scope', '$http', '$routeParams', '$location']
angular.module('idfPnrApp').controller 'MainCtrl', MainCtrl
