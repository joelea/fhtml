assert = require('assert')
fhtml = require('../fhtml')

describe 'fhtml', ->
  it 'should create a paragraph', ->
    assert.equal fhtml.p('Hello World!'),
                 '<p>Hello World!</p>'

  it 'should create a div', ->
    assert.equal fhtml.div('A div'),
                 '<div>A div</div>'
