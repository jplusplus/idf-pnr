'use strict'

describe 'Controller: RevoirCtrl', () ->

  # load the controller's module
  beforeEach module 'idfPnrApp'

  RevoirCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RevoirCtrl = $controller 'RevoirCtrl', {
      $scope: scope
    }
