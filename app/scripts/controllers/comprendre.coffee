ComprendreCtrl = ($scope, $location, $http, $routeParams) ->		
    # Get the data object
    $http.get("data/main.json").success (data)-> $scope.data = data
    # Info box ID
    $scope.parc = $routeParams.parc     
    # Current category ('comprendre' page)
    $scope.categorie = $location.search().categorie
    # Read the location's search to update the scope
    $scope.$on '$routeUpdate', -> 
    	$scope.parc = $routeParams.parc
    	$scope.categorie = $location.search().categorie
    $scope.getParc = -> _.findWhere $scope.data, slug: $scope.parc    

ComprendreCtrl.$inject = ['$scope', '$location', '$http', '$routeParams']
angular.module('idfPnrApp').controller 'ComprendreCtrl', ComprendreCtrl