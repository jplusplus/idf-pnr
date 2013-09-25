angular.module('idfPnrApp').directive "france", ['$filter', ($filter)-> 
    scope:
        # What to when clicking a region
        click: "&"
        # Where record the region?
        value: "=" 
    compile: (tElement, tAttrs, transclude)->        
        # The map object is localy available
        map       = null
        # Resize the map to fit to the svg
        resizeMap = (iElement)->
            ratio  = map.viewAB.height / map.viewAB.width
            height = iElement.width() * ratio                         
            iElement.height(height)
            map.resize()            
        # Pre link function (build DOM)
        pre: (scope, iElement, iAttrs, controller)->  
            # Create the map within iElement with the same width
            # (the height will be calculate later)
            map = $K.map( iElement, iElement.width(), iElement.width()*0.4 )            
            draw = ->
                # Colorize regions
                map.getLayer('regions').style 
                    fill: (region, path) ->
                        switch region["name-1"]
                            when "Île-de-France" then "#E71A0F"
                            when scope.value["name-1"] then "#98b800"
                            else "#e0e4e5"
            # Update the draw when the value changes
            scope.$watch "value", draw, true
            # Load the SVG            
            map.loadMap 'images/france.svg', ->
                # Adapt map's sizes to the SVG
                resizeMap(iElement)
                # Add layers                
                map.addLayer 'regions',
                    'name'  : 'regions'
                    'styles':
                        'stroke-width': 0                           
                        'fill'        : '#e0e4e5'         
                draw()
                # Bind layer click
                map.getLayer('regions').on 'click', (data)->  
                    data = {} if data["name-1"] is "Île-de-France"
                    # Do we received a click function?
                    scope.click() if typeof(scope.click) is "function"
                    # Set a model value matching to the clicked region
                    if scope.value?        
                        angular.copy(data, scope.value);                        
                        scope.$apply()
]