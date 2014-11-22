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

  it 'can add attributes', ->
    html =
      T.a { href: 'a link' }, 'link text'
    assert.equal html, "<a href='a link'>link text</a>"

  it 'can add a class with shorthand', ->
    html =
      T.div '.className',
            'content'
    assert.equal html, "<div class='className'>content</div>"

  it 'can add an id with shorthand', ->
    html =
      T.div '#idName',
            'content'
    assert.equal html, "<div id='idName'>content</div>"

  it 'can add an id and a class with shorthand', ->
    html =
      T.div '#idName.className',
            'content'
    assert.equal html, "<div id='idName' class='className'>content</div>"