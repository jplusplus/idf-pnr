angular.module('idfPnrApp')
    .controller 'ExplorerCtrl', ($scope, $routeParams, $http) ->
        # Get the data object
        $http.get("data/explorer.json").success (data)-> $scope.data = data        
        $scope.parc      = $routeParams.parc     
        $scope.metropole = $routeParams.metropole     
        # Read the location's search to update the scope
        $scope.$on '$routeUpdate', -> 
            $scope.parc      = $routeParams.parc
            $scope.metropole = $routeParams.metropole     
        $scope.get = ->             
            $scope.data[$scope.parc][$scope.metropole] if $scope.data?
        $scope.metropoleStyle = ->
            style = $scope.get()
            return {} unless style?
            top:   style.top
            left:  style.left
            width: $scope.data[$scope.parc].scale/100*style.width

