RevoirCtrl = ($scope, $http, $location)->                     
    readLocation = ->            
        if $location.search().annee?                
            $scope.annee = $location.search().annee or "1968"
        else
            $scope.annee = "1968"
            $location.search("annee", "1968")
    readLocation()
    # Get the parc count
    $http.get("data/revoir.json").success (data)-> $scope.annees = _.countBy data, "annee"               
    # Read the location's search to update the scope
    $scope.$on '$routeUpdate', readLocation
    # Visible years
    $scope.visibles = ()-> 
        return [] unless $scope.annee? and $scope.annees?
        annees =_.keys($scope.annees)
        annees.slice 0, annees.indexOf($scope.annee) + 1

RevoirCtrl.$inject = ['$scope', '$http', '$location']
angular.module('idfPnrApp').controller 'RevoirCtrl', RevoirCtrl