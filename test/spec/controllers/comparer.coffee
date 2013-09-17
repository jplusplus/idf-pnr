'use strict'

describe 'Controller: ComparerCtrl', () ->

  # load the controller's module
  beforeEach module 'idfPnrApp'

  ComparerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ComparerCtrl = $controller 'ComparerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
