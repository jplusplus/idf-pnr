angular.module('idfPnrApp').directive 'imageonload', ->
    restrict: 'A'
    link: (scope, element)->
        
        element.bind 'load', -> console.log(1)