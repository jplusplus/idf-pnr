'use strict'

describe 'Filter: slug', () ->

  # load the filter's module
  beforeEach module 'idfPnrApp'

  # initialize a new instance of the filter before each test
  slug = {}
  beforeEach inject ($filter) ->
    slug = $filter 'slug'

  it 'should return the input prefixed with "slug filter:"', () ->
    text = 'angularjs 4'
    expect(slug text).toBe ('angularjs-4')
