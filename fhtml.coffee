tags = ['p', 'div']

isFunction = (object) ->
  getType = {}
  return object &&
         getType.toString.call(object) == '[object Function]';

class HTML
  _createTagFunction: (tagName) =>
    @[tagName] = (text) =>
      if isFunction(text) then text = text()
      "<#{tagName}>#{text}</#{tagName}>"

  constructor: ->
    @_createTagFunction(tagName) for tagName in tags


if window? then window.fhtml = new HTML()
if module? then module.exports = new HTML()