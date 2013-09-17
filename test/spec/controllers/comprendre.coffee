'use strict'

describe 'Controller: ComprendreCtrl', () ->

  # load the controller's module
  beforeEach module 'idfPnrApp'

  ComprendreCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ComprendreCtrl = $controller 'ComprendreCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
