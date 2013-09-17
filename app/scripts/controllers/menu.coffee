'use strict'

angular.module('idfPnrApp')
    .controller 'MenuCtrl', ($scope, $route, $location) ->
        $scope.current = $route.current.slug
        # Current category ('comprendre' page)
        $scope.categorie = $location.search().categorie
        $scope.metropole = $location.search().metropole
        $scope.parc      = $location.search().parc
        # Read the location's search to update the scope
        $scope.$on '$routeUpdate', -> 
            $scope.categorie = $location.search().categorie
            $scope.parc      = $location.search().parc
            $scope.metropole = $location.search().metropole
        # Roote changed
        $scope.$on '$routeChangeSuccess', (next)->
            # Update the current slug 
            $scope.current = $route.current.slug
        # Location helper 
        $scope.search = (what, val)=> $location.search(what, val)