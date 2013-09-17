'use strict'

angular.module('idfPnrApp')
    .controller 'MenuCtrl', ($scope, $route, $location) ->
        $scope.current = $route.current.slug
        # Current category ('comprendre' page)
        $scope.categorie = $location.search().categorie
        # Read the location's search to update the scope
        $scope.$on '$routeUpdate', -> 
            $scope.categorie = $location.search().categorie
        # Roote changed
        $scope.$on '$routeChangeSuccess', (next)->
            # Update the current slug 
            $scope.current = $route.current.slug