assert = require('assert')
T = require('../fhtml')

describe 'fhtml', ->
  it 'should create a div', ->
    html = T.div 'A div'
    assert.equal html, '<div>A div</div>'

  it 'should create a p tag', ->
    html = T.p 'A p tag'
    assert.equal html, '<p>A p tag</p>'