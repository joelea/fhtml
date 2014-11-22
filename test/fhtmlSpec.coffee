assert = require('assert')
T = require('../fhtml')

describe 'fhtml', ->
  it 'should create a div', ->
    html = T.div 'A div'
    assert.equal html, '<div>A div</div>'

  it 'should create a p tag', ->
    html = T.p 'A p tag'
    assert.equal html, '<p>A p tag</p>'

  it 'should be able to nest tags', ->
    html =
      T.div ->
        T.p 'nested tag'

    assert.equal html, '<div><p>nested tag</p></div>'