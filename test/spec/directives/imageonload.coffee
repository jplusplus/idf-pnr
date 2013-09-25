'use strict'

describe 'Directive: imageonload', () ->

  # load the directive's module
  beforeEach module 'idfPnrApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<imageonload></imageonload>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the imageonload directive'
