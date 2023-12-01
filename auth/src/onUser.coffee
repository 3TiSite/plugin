> ./auth.js > signIn
  @2-/bc/bcHook.js
  @2-/bc/toAll.js
  @2-/share
  @2-/share/swHook.js
  @3-/cookieget
  @3-/lang/CODE.js
  @5-/auth/S.js > authMe authExit
  @~3/lang/set.js:setLang > onSet:onLangSet
  ~/lib/S.js:@ > setAuth

HOOK = new Set

+ USER, LANG

cookieV = =>
  cookieget(document.cookie).V

save = =>
  t = [
    cookieV()
  ]
  if USER
    t.push ...USER
  else
    t.push USER

  localStorage.U = JSON.stringify(t)
  return

onLangSet (lang)=>
  if LANG != lang
    if USER and LANG != undefined
      S.authLang()
    LANG = lang
  return

_setUser = (user)=>
  if user
    lang = CODE[user[2]]
    if lang != LANG
      setLang LANG = lang
  else
    user = false
  USER = user
  HOOK.forEach(
    (f)=>
      f(user)
      return
  )
  return

< setUser = (user)=>
  if user and USER
    if user.every(
      (e, i)=>
        e == USER[i]
    )
      return
  _setUser user
  save()
  for f from [toAll,share]
    f 0,user
  return

swHook[0] = (user)=>
  setUser user
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
      share(
        0
        USER = U[1] and U.slice(1)
      )
      return
  setUser await authMe()
  return

# 广播用户消息
bcHook(0,_setUser)

export User = =>
  USER

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
