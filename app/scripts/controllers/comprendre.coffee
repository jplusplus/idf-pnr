ComprendreCtrl = ($scope, $location) ->		
    # Current category ('comprendre' page)
    $scope.categorie = $location.search().categorie
    # Read the location's search to update the scope
    $scope.$on '$routeUpdate', -> $scope.categorie = $location.search().categorie


ComprendreCtrl.$inject = ['$scope', '$location']
angular.module('idfPnrApp').controller 'ComprendreCtrl', ComprendreCtrl