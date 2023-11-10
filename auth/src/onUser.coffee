> @5-/auth/S.js > authMe
  @3-/cookieget

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

< setUser = (user)=>
  USER = user
  save()
  for i from HOOK
    i(user)
  return

export User = => USER

export default (f)=>
  f USER
  HOOK.add f
  =>
    HOOK.delete f
    return
