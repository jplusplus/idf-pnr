angular.module('idfPnrApp').directive 'imageonload', ->
    restrict: 'A'
    link: (scope, element)->        
        element.bind 'load error', -> $(".loading").removeClass("loading")