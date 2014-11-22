tags = ['p', 'div', 'a']

isFunction = (object) ->
  getType = {}
  return object &&
         getType.toString.call(object) == '[object Function]';

formatAttributes = (attributes) ->
  return "" unless attributes?
  formattedAttributes = []
  formattedAttributes.push("#{key}='#{value}'") for key, value of attributes
  return ' ' + formattedAttributes.join(' ')

createTag = (tagName) -> (content, attributes) ->
    if isFunction(content) then content = content()
    if typeof attributes is 'string' then attributes = class: attributes[1..]
    formattedAttributes = formatAttributes attributes
    "<#{tagName}#{formattedAttributes}>#{content}</#{tagName}>"

createTagFunction = (tagName, bindTarget) ->
  bindTarget[tagName] = (args...) ->
    reversedArgs = args.reverse()
    createTag(tagName)(reversedArgs...)

T = {}

createTagFunction(tag, T) for tag in tags

if window? then window.T = T
if module? then module.exports = T