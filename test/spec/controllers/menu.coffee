'use strict'

describe 'Controller: MenuCtrl', () ->

  # load the controller's module
  beforeEach module 'idfPnrApp'

  MenuCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MenuCtrl = $controller 'MenuCtrl', {
      $scope: scope
    }
