> @5-/auth/S.js > authMe
  @3-/cookieget
  @~3/bc/bcHook.js
  @~3/bc/toAll.js

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
    (i)=>i(user)
  )
  return

< setUser = (user)=>
  _setUser user
  save()
  toAll 1,user
  return

< exit = =>
  setUser false
  return

bcHook(1,_setUser)

export User = => USER

export default (f)=>
  f USER
  HOOK.add f
  =>
    HOOK.delete f
    return
