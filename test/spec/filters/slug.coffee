'use strict'

describe 'Filter: slug', () ->

  # load the filter's module
  beforeEach module 'idfPnrApp'

  # initialize a new instance of the filter before each test
  slug = {}
  beforeEach inject ($filter) ->
    slug = $filter 'slug'

  it 'should return the input prefixed with "slug filter:"', () ->
    text = 'angularjs'
    expect(slug text).toBe ('slug filter: ' + text)
