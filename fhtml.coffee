tags = ['a','abbr','acronym','address','applet','area','article','aside','audio','b','base','basefont','bdo','big','blockquote','body','br','button','canvas','caption','center','cite','code','col','colgroup','command','datalist','dd','del','details','dfn','dir','div','dl','dt','em','embed','fieldset','figcaption','figure','font','footer','form','frame','frameset','h1','h2','h3','h4','h5','h6','head','header','hgroup','hr','html','i','iframe','img','input','ins','keygen','kbd','label','legend','li','link','map','mark','menu','meta','meter','nav','noframes','noscript','object','ol','optgroup','option','output','p','param','pre','progress','q','rp','rt','ruby','s','samp','script','section','select','small','source','span','strike','strong','style','sub','summary','sup','table','tbody','td','textarea','tfoot','th','thead','time','title','tr','tt','u','ul','var','video','wbr','xmp']

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
  classes = selector.match(/\.\w+/g)?.map (name) -> name[1..]
  ids = selector.match(/#\w+/g)?.map (name) -> name[1..]
  attributes = {}
  if ids? then attributes.id = ids.join(' ')
  if classes? then attributes.class = classes.join(' ')
  return attributes


getRawContent = (content) ->
  if isFunction(content) then content = content()
  if Array.isArray(content) then content = content.join('')
  return content

createTag = (tagName) -> (content, attributes, selector='') ->
  content = getRawContent(content)
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
