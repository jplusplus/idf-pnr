ComparerCtrl = ($scope, $location, $http) ->
	# Get the data object
	$http.get("data/comparer.json").success (data)-> $scope.data = data       
	# Current theme ('comprendre' page)
	$scope.theme = $location.search().theme
	# Read the location's search to update the scope
	$scope.$on '$routeUpdate', -> $scope.theme = $location.search().theme

ComparerCtrl.$inject = ['$scope', '$location', '$http']
angular.module('idfPnrApp').controller 'ComparerCtrl', ComparerCtrl