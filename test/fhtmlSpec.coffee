assert = require('assert')
fhtml = require('../fhtml')

describe 'fhtml', ->
  it 'should create a div', ->
    html = fhtml -> div('A div')
    assert.equal html, '<div>A div</div>'

  it 'should create a paragraph', ->
    html = fhtml -> p('Hello World!')
    assert.equal html, '<p>Hello World!</p>'