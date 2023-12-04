> ./route.js:@ > nowUrl
  @3-/split

export INIT = {}

export FUNC = new Map

export splitSlash = (url)=>
  split(url,'/')[0]

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
      for [url, args] from Object.entries INIT
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
