'use strict'

angular.module('idfPnrApp')
    .controller 'MenuCtrl', ($scope, $route, $location) ->
        # Extracts parameters from location's search
        readLoaction = ->
            $scope.categorie      = $location.search().categorie
            $scope.metropole      = $location.search().metropole
            $scope.parc           = $location.search().parc
            $scope.theme          = $location.search().theme
            $scope.regionSelected["name-1"] = $location.search().region
            
        $scope.regionSelected = {}
        $scope.$watch("regionSelected", (val)->             
            $scope.search("region", val["name-1"]) if val["name-1"]? 
        , true)
        readLoaction()            
        $scope.current = $route.current.slug
        # Read the location's search to update the scope
        $scope.$on '$routeUpdate', readLoaction
        # Roote changed
        $scope.$on '$routeChangeSuccess', (next)->
            # Update the current slug 
            $scope.current = $route.current.slug
        # Location helper 
        $scope.search = (what, val)=> $location.search(what, val)