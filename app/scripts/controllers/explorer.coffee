ExplorerCtrl = ($scope, $routeParams, $http, $location) ->
    # Get the data object
    $http.get("data/explorer.json").success (data)-> $scope.data = data        
    $scope.parc      = $routeParams.parc     
    $scope.metropole = $routeParams.metropole     
    # Read the location's search to update the scope
    $scope.$on '$routeUpdate', -> 
        $scope.parc      = $routeParams.parc
        $scope.metropole = $routeParams.metropole     
    $scope.get = ->             
        if $scope.data? and $scope.parc? and $scope.metropole?
            $scope.data[$scope.parc][$scope.metropole] 
    $scope.metropoleStyle = ->
        style = $scope.get()
        return {} unless style?
        top       : style.top
        left      : style.left
        width     : $scope.data[$scope.parc].scale/100*style.width
        visibility: "visible"



ExplorerCtrl.$inject = ['$scope', '$routeParams', '$http', '$location']
angular.module('idfPnrApp').controller 'ExplorerCtrl', ExplorerCtrl