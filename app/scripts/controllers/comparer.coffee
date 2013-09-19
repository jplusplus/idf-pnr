ComparerCtrl = ($scope, $location, $http, $filter) ->
	# Get the data object
	$http.get("data/comparer.json").success (data)-> $scope.data = data       
	# Current theme ('comprendre' page)
	$scope.theme  = $location.search().theme
	$scope.region = $location.search().region
	# Read the location's search to update the scope
	$scope.$on '$routeUpdate', -> 
		$scope.theme  = $location.search().theme
		$scope.region = $location.search().region
	# Return the region's values
	$scope.get = (region, theme)-> 
		data = _.find $scope.data, (val)->
			$filter("slug")(val.region) == $filter("slug")(region)
		return if data? then data[theme] else null

ComparerCtrl.$inject = ['$scope', '$location', '$http', '$filter']
angular.module('idfPnrApp').controller 'ComparerCtrl', ComparerCtrl