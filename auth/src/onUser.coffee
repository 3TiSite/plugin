> @5-/auth/S.js > authMe authExit
  ~/lib/S.js > setAuth
  @3-/cookieget
  @~3/bc/bcHook.js
  @~3/bc/toAll.js
  ./auth.js > signIn

HOOK = new Set

+ USER

cookieV = =>
  cookieget(document.cookie).V

save = (v)=>
  localStorage.U = JSON.stringify([
    v or cookieV()
    USER
  ])
  return

await do =>
  v = cookieV()
  if not v
    USER = false
    return

  {U} = localStorage
  if U
    U = JSON.parse U
    if U[0] == v
      USER = U[1]
      return
  USER = (await authMe()) or false
  save(v)
  return

_setUser = (user)=>
  USER = user
  HOOK.forEach(
    (f)=>
      f(user)
      return
  )
  return

< setUser = (user)=>
  user = user or false
  _setUser user
  save()
  toAll 1,user
  return

< exit = (id)=>
  if id
    setUser(
      await authExit(id)
    )
  else
    setUser false
  return USER

bcHook(1,_setUser)

export User = => USER

export default (f)=>
  HOOK.add f
  f USER
  =>
    HOOK.delete f
    return

setAuth (next)=>
  f = =>
    next().finally =>
      HOOK.remove(f)
      return
    return
  HOOK.add f
  signIn()
  return
