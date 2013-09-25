'use strict'

describe 'Directive: imageonload', () ->

  # load the directive's module
  beforeEach module 'idfPnrApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()