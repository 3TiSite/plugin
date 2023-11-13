<script lang="coffee">
> @5-/auth/S.js > authLi authSet authRm authExitAll
  @~3/menu
  @~3/box:Box
  @~3/wait:Wait
  ./auth.js > signIn
  ./Auth.svelte
  ./Menu.svelte
  ./RmMenu.svelte
  ./onUser.js > setUser exit

+ li

aRel = (f)=>
  ->
    f +@parentNode.previousSibling.rel
    return

rmMenu = menu(
  RmMenu
  {
    rm:aRel (id)=>
      t = li
      li = undefined
      await authRm id
      for i,p in t
        if i[0] == id
          t.splice(p,1)
          break
      li = t
      return
  }
)

inMenu = menu(
  Menu
  {
    config:aRel (id)=>
      console.log 'id',id
      return

    exit:aRel (id)=>
      t = li
      li = undefined
      now = await exit id
      for i,p in t
        if id == i[0]
          if i.length == 5
            i.pop()
          i[3] = true
          break
      if now
        for i,p in t
          if i[0] == now[0]
            i.push 1
            break
      li = t
      return
  }
)

drop = ->
  id = +@rel
  for i,p in li
    if i[0] == id
      if i[3]
        m = rmMenu
      else
        m = inMenu
      m.call @
      break
  return

pp = (e)=>
  e.parentNode.parentNode

exitAll = ->
  box = pp @
  li = undefined
  await authExitAll()
  setUser false
  box.close()
  return

add = ->
  Box(Auth, {account:''})
  pp(@).close()
  return

set = (id)->
  box = pp @
  first = 1
  for [_id,_,account,e] from li
    if e
      if id == _id
        Box(Auth,{account})
        box.close()
        return
    else
      if id == _id
        if first
          return
      first = 0

  li = 0
  setUser await authSet id
  box.close()
  return

onMount =>
  t = await authLi()
  inli =[]
  outli = []
  for i from t
    if i[3]
      t = outli
    else
      t = inli
    t.push i
  if inli.length
    inli.reverse()
    inli[0].push 1
  li = inli.concat outli
  return
</script>

<template lang="pug">
+if li
  +each li as [id,name,account,e,n]
    p(class:e=e)
      i(@click={set.call(this,id)} class:n=n)
        b
          | {name}
          b {account}
      a(@click={drop} rel:id)
  i
    a(@click=add) >addAccount
    a(@click=exitAll) >exitAll
  +else
    Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

p, i
  display flex
  justify-content space-between
  user-select none

i
  background var(--svgDv) 5px 0 repeat-x
  font-style normal
  padding 16px

  &:first-child
    border 0

  &>a
    color #000
    font-size 15px

    &:hover
      color #f40

  &>b
    display flex
    flex-direction column

    &>b
      font-size 14px

p
  margin 0
  position relative

  &>i, &>a
    position relative

  &>i:after, &>a:before, &>a:after
    content ''
    position absolute

  &>i
    cursor pointer
    flex 1

    &.n
      cursor auto

    &.n:after, &:hover:after
      background #dd0
      border-radius 4px
      box-shadow 0 0 3px inset
      color #f40
      height 8px
      margin-top -4px
      right 22px
      top 50%
      width 8px

    &.n:after
      background #3d0
      color #363

  &>a
    background var(--svgDv) 0 100% repeat-x
    border 1px solid transparent
    border-right 0
    margin-bottom -2px
    width 50px

    &:before, &:after
      bottom 0
      left 0
      right 0
      top 0

    &:before
      background var(--svgDh) 0 0 repeat-y

    &:after
      background var(--svgNabla) 50% 50% / 12px no-repeat
      margin-bottom -6px
      margin-right -6px

    &:hover
      background #f5f5f5
      border-color #ddd

      &:before
        background 0

      &:after
        filter btn-hover-filter

  &.e
    &>i
      color #999

    &>a
      opacity 0.5

    &:hover
      &>a
        opacity 1
</style>

