> ./route.js > refresh
  ./hashchange.js

SLASH = '/'

< (url='',title='')=>
  if url.charAt(0) != SLASH
    url = SLASH + url
  history.pushState null,title,url
  window.dispatchEvent(new HashChangeEvent hashchange)
  refresh()
  return

