> @5-/auth/S.js > authMe authExit
  @3-/lang/CODE.js
  ~/lib/S.js:@ > setAuth
  @~3/lang/set.js:setLang > onSet:onLangSet
  @3-/cookieget
  @~3/bc/bcHook.js
  @~3/bc/toAll.js
  ./auth.js > signIn

HOOK = new Set

+ USER, LANG

cookieV = =>
  cookieget(document.cookie).V

save = =>
  localStorage.U = JSON.stringify([
    cookieV()
    USER
  ])
  return

onLangSet (lang)=>
  if not USER
    return
  if LANG != lang
    if LANG != undefined
      if USER
        S.authLang()
    LANG = lang
  return

_setUser = (user)=>
  if user
    LANG = CODE[user[2]]
    setLang LANG
    user = user.slice(0, 2)
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
  _setUser user
  save()
  toAll 1,user
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
  setUser await authMe()
  return

# 广播用户消息
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
