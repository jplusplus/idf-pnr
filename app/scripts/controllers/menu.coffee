MenuCtrl = ($scope, $route, $location, $http) ->
        # Extracts parameters from location's search
        readLoaction = ->
            $scope.categorie                = $location.search().categorie
            $scope.metropole                = $location.search().metropole
            $scope.parc                     = $location.search().parc
            $scope.theme                    = $location.search().theme
            $scope.regionSelected["name-1"] = $location.search().region        
            $scope.annee.current            = $location.search().annee
            $scope.annee.tick               = 27-_.keys($scope.annee.list).indexOf($location.search().annee)
        # ──────────────────────────────────────────────────────────────────────
        # Scope attributes    
        # ──────────────────────────────────────────────────────────────────────
        $scope.regionSelected = {}
        $scope.annee          = 
            tick: 27
            current: 1968
            list: []
        $scope.current = $route.current.slug    
        $scope.items   = ["main", "comprendre", "explorer", "comparer", "revoir"]        
        # Get the parc count
        $http.get("data/revoir.json").success (data)-> 
            $scope.annee.list = _.countBy data, "annee"  
        # Read the location on load
        readLoaction()    
        # ──────────────────────────────────────────────────────────────────────
        # Scope watchers
        # ──────────────────────────────────────────────────────────────────────
        $scope.$watch("regionSelected", (val)->             
            $scope.search("region", val["name-1"]) if val["name-1"]? 
        , true)

        $scope.$watch("annee", (annee, old)->   
            if annee.tick isnt old.tick or not old.tick?
                $scope.search("annee", _.keys($scope.annee.list)[27-annee.tick])
        , true)
        # Read the location's search to update the scope
        $scope.$on '$routeUpdate', readLoaction
        # Roote changed
        $scope.$on '$routeChangeSuccess', (next)->
            # Update the current slug 
            $scope.current = $route.current.slug
        # ──────────────────────────────────────────────────────────────────────
        # Scope methods
        # ──────────────────────────────────────────────────────────────────────
        # Location helper 
        $scope.search = (what, val)=> $location.search(what, val)
        # View path
        $scope.view = (item)-> "views/menu-#{item}.html"
        # Create an arbitrary array
        $scope.range = (len)-> new Array(len)

MenuCtrl.$inject = ['$scope', '$route', '$location', '$http']
angular.module('idfPnrApp').controller 'MenuCtrl', MenuCtrl