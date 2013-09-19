'use strict'

describe 'Filter: number', () ->

  # load the filter's module
  beforeEach module 'idfPnrApp'

  # initialize a new instance of the filter before each test
  number = {}
  beforeEach inject ($filter) ->
    number = $filter 'number'

  it 'should return the input transformed to a nice number', () ->
    text = 19000.83
    expect(number text).toBe ('19 000,83')
