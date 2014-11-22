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


attributify = (selector) ->
  classes = selector.match(/\.\w+/)?.map (name) -> name[1..]
  ids = selector.match(/#\w+/)?.map (name) -> name[1..]
  attributes = {}
  if ids? then attributes.id = ids.join(' ')
  if classes? then attributes.class = classes.join(' ')
  return attributes

createTag = (tagName) -> (content, attributes, selector='') ->
    if isFunction(content) then content = content()
    if typeof attributes is 'string' then attributes = attributify(attributes)
    attributes[key] = value for key, value of attributify(selector)
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