> @3-/on:On

PRE = location.pathname.slice(1)

HOOK = []

< (hook)=>
  HOOK.push hook
  hook(location.pathname.slice(1),PRE)
  return

< refresh = =>
  {pathname} = location
  url = pathname.slice(1)
  if url != PRE
    for f from HOOK
      f(url, PRE)
    PRE = url
  return

< nowUrl = =>
  PRE

On(
  window
  popstate: refresh
)
