assert = require('assert')
T = require('../fhtml')

describe 'fhtml', ->
  it 'should create a div', ->
    html = T.div 'A div'
    assert.equal html, '<div>A div</div>'
