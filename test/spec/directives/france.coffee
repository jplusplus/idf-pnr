'use strict'

describe 'Directive: france', () ->

  # load the directive's module
  beforeEach module 'idfPnrApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<france></france>'
    element = $compile(element) scope
    expect(element.text()).toBe ''
