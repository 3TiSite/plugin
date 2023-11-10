<script lang="coffee">
> ~/lib/SITE.js
  ~/lib/I18N.js > _$created
  ./onUser.js > setUser
  @~3/errer
  @~3/focus
  @~3/box/confirm.js
  ./sign.js
  @5-/auth/S.js > authSignUp

< li

+ form, href, resend, timeout

name = code = ''

send = =>
  up = await sign 0,...li
  console.log {up}
  if not up
    form.parentNode.close()
  resend = undefined
  timer()
  return

timer = =>
  timeout = setTimeout(
    =>
      resend = 1
      return
    3e4
  )
  return

onMount =>
  timer()
  focus form
  href = '//'+li[0].split('@').pop()
  return

submit = =>
  uid = await errer form, authSignUp(
    ... li
    code
    name
  )
  if uid
    setUser [uid, name]
    confirm ->
      @[_$created]
    form.parentNode.close()

  else if not resend
    clearTimeout timeout
    resend = 2
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=submit)
  h1 {SITE.host}
  u
    i#account
      label >mail
      a(href:) {li[0]}
  b >enterCode
  +input(">code")#code(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&code
  )
  i
    i >checkSpam
    +if resend
      i
        +if resend == 1
          i >notRecv
        a(@click=send) >resend
  +input(">name")#name(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&name
  )
  button(type="submit") >signUp
</template>

<style lang="stylus">
@import '~/styl/var.styl'
@import '~/styl/util/h1Logo.styl'

h1+u
  display flex
  flex-direction column

  &>i
    background #eee
    border 1px solid #ccc
    padding 16px

    &>a
      border-bottom 1px solid #000
      color #000
      margin-left 16px
      padding-bottom 6px

      &:hover
        border-color hover-color
        color hover-color

i
  font-style normal

button
  width 100%

form
  user-select none

  &>b, &>i
    align-self flex-start

  & > b
    margin -8px 16px 12px

  & > i
    align-self stretch
    display flex
    font-size 14px
    font-weight bold
    justify-content space-between
    margin -16px 16px 16px

    &>i
      display flex
      flex-wrap wrap
      justify-content flex-end

      &:first-child
        margin-right 16px
        white-space nowrap

      font-weight bold

      &>a
        border-bottom 2px solid
        margin-left 6px
        padding-bottom 3px
        white-space nowrap
</style>

