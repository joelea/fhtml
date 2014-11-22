tags = ['p', 'div']

class HTML
  _createTagFunction: (tagName) =>
    @[tagName] = (text) ->
      "<#{tagName}>#{text}</#{tagName}>"

  constructor: ->
    @_createTagFunction(tagName) for tagName in tags


if window? then window.fhtml = new HTML()
if module? then module.exports = new HTML()