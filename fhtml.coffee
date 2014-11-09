tag = (tagName) -> (text) ->
  "<#{tagName}>#{text}</#{tagName}>"

tags = ['p', 'div']
fhtml = {}

for tagName in tags
  fhtml[tagName] = tag(tagName)

if window? then window.fhtml = fhtml
if module? then module.exports = fhtml