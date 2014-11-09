tag = (tagName) -> (text) ->
  "<#{tagName}>#{text}</#{tagName}>"

fhtml =
  p: tag 'p'
  div: tag 'div'

if window? then window.fhtml = fhtml
if module? then module.exports = fhtml