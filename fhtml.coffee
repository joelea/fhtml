tags = ['p', 'div']

isFunction = (object) ->
  getType = {}
  return object &&
         getType.toString.call(object) == '[object Function]';

createTagFunction = (tagName, bindTarget) ->
  bindTarget[tagName] = (text) ->
    if isFunction(text) then text = text()
    "<#{tagName}>#{text}</#{tagName}>"

T = {}

createTagFunction(tag, T) for tag in tags

if window? then window.T = T
if module? then module.exports = T