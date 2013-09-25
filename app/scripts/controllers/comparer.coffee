ComparerCtrl = ($scope, $location, $http, $filter) ->
	# Get the data object
	$http.get("data/comparer.json").success (data)-> 
		$scope.data = data
		sortRegions()
	$scope.base   = "Île-de-France"
	# Legend under the graph
	$scope.legend =
		exploitation: "Part des exploitations agricoles en grandes cultures en 2010 (%)<br />* Données manquantes pour les parcs<br />PréAlpes d'Azur et Ardennes, créés en 2011-2012",
		resistance  : "Taux de destruction des espaces naturels par artificialisation<br />ou mise en culture ou création de plan d'eau<br />entre 2000 et 2006 (%)",		
		emplois     : "Evolution des taux d'emploi entre 1999 et 2009 (en points)"			
	# Current theme ('comprendre' page)
	$scope.theme  		 = $location.search().theme or "superficie"
	$scope.region 		 = $location.search().region
	$scope.sortedRegions = []
	# Read the location's search to update the scope
	$scope.$on '$routeUpdate', -> 
		$scope.theme  = $location.search().theme or "superficie"
		$scope.region = $location.search().region	
		sortRegions()	

	$scope.$watch "theme", (val)-> 
		if val is "resistance" or val is "emplois"
			$scope.decimals = 2 
		else
			$scope.decimals = 0

	sortRegions = ()->
		if $scope.data?	
			sorted = _.filter $scope.data, (region)-> 
				# Remove non-number elements
				angular.isNumber(region[$scope.theme])
			# Use the current theme to sort the region 
			sorted = _.sortBy sorted, (region)-> -1*region[$scope.theme]
			# Only takes the region name
			$scope.sortedRegions = _.pluck sorted, "region"

	# Return the region's values
	$scope.get = (region=$scope.region, theme=$scope.theme)->
		data = _.find $scope.data, (val)->
			# Find data using slugs
			$filter("slug")(val.region) == $filter("slug")(region)
		return if data? then data[theme] else null
	# Return the sizes of the given sample
	$scope.style = (region=$scope.region, theme=$scope.theme)->
		maxSize = 200
		# Max value for the given theme
		max = $scope.max(theme)
		# Value to compare
		val = $scope.get(region, theme)
		# Final sizes
		size = Math.abs(val)/max*maxSize
		# Returns the styles
		width  	  : size 
		height 	  : size
		top       : if val < 0 then size else 0
		marginTop : if val < 0 then -1*size else 0
	# Get the maximun value for the given theme
	$scope.max = (theme=$scope.theme)->
		Math.abs(_.max( $scope.data, (region)-> Math.abs(region[theme]) )[theme])
	# Do the title of the bar is outside?
	$scope.isOutside = (region=$scope.region, theme=$scope.theme)->
		$scope.style(region, theme).width < 70
	# Position the legend according the right bar
	$scope.legendStyle = ()->
		if $scope.get() < 0
			offset = $scope.style().width
			right: (400 - offset)/2 + offset


ComparerCtrl.$inject = ['$scope', '$location', '$http', '$filter']
angular.module('idfPnrApp').controller 'ComparerCtrl', ComparerCtrl