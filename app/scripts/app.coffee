'use strict'

angular.module('idfPnrApp', ['ui.slider'])
  .run(
    [             
      '$rootScope', 
      '$location',
      ($rootScope, $location)->
        # Location available within templates
        $rootScope.search = (what, val, toggle=false)=> 
          val = if toggle and $location.search()[what] is val then null else val
          $location.search what, val
    ]
  )
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode false
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'        
        controller: 'MainCtrl'
        reloadOnSearch: false
        slug: "main"
      .when '/comprendre',
        templateUrl: 'views/comprendre.html'        
        controller: 'ComprendreCtrl'
        reloadOnSearch: false
        slug: "comprendre"
      .when '/explorer',
        templateUrl: 'views/explorer.html'        
        controller: 'ExplorerCtrl'
        reloadOnSearch: false
        slug: "explorer"
      .when '/comparer',
        templateUrl: 'views/comparer.html'        
        controller: 'ComparerCtrl'
        reloadOnSearch: false
        slug: "comparer"
      .when '/revoir',
        templateUrl: 'views/revoir.html'        
        controller: 'RevoirCtrl'
        reloadOnSearch: false
        slug: "revoir"
      .otherwise
        redirectTo: '/'
  ]