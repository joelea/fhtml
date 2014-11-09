fhtml =
  p: (text) ->
    '<p>' + text + '</p>'

if window? then window.fhtml = fhtml
if module? then module.exports = fhtml