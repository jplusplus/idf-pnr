'use strict'

describe 'Controller: ExplorerCtrl', () ->

  # load the controller's module
  beforeEach module 'idfPnrApp'

  ExplorerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ExplorerCtrl = $controller 'ExplorerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
