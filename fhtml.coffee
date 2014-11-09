fhtml =
  p: (text) ->
    '<p>' + text + '</p>'

  div: (text) ->
    '<div>' + text + '</div>'

if window? then window.fhtml = fhtml
if module? then module.exports = fhtml