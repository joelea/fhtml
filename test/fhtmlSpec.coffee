assert = require('assert')
fhtml = require('../fhtml')

describe 'fhtml', ->
  it 'should create a paragraph', ->
    assert.equal fhtml.p('Hello World!'), '<p>Hello World!</p>'
