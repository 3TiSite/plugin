> ./route.js:@ > nowUrl
  @3-/split
  ./URLMAP.js

export FUNC = new Map
SLASH = '/'
export splitSlash = (url)=>
  begin = if url.startsWith(SLASH) then 1 else 0
  end = url.indexOf(SLASH,begin)
  if end < 0
    end = url.length
  url.slice(begin, end)

< (callback) =>
  notFound = =>

  route (url)=>
    args = FUNC.get splitSlash(url)
    if args
      callback url, ...args
      return
    notFound()
    return

  setRoute = (url, args...)=>
    FUNC.set url, args
    if splitSlash(nowUrl()) == url
      callback url, ...args
      notFound = 0
    return

  [

    setRoute

    # clear route
    =>
      FUNC.clear()
      notFound = 1
      for [url, args] from Object.entries URLMAP
        if not Array.isArray(args)
          args = [args]
        setRoute url, ...args
      return

    # set no found
    (func)=>
      if notFound
        func()
      notFound = func
      return
  ]
