'use strict'

angular.module('idfPnrApp', ['ui.slider'])
  .config ($routeProvider) ->
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
