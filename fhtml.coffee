createTag = (tagName) -> (text) -> "<#{tagName}>#{text}</#{tagName}>"
tags = ['p', 'div']

fhtml = (tagGenerator) ->
  for tagName in tags
    @[tagName] = createTag(tagName)
  boundTagGenerator = tagGenerator.bind @
  tag = boundTagGenerator()
  return tag

if window? then window.fhtml = fhtml
if module? then module.exports = fhtml