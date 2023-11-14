<script lang="coffee">
> @5-/auth/S.js > authConfMeta
  @~3/wait:Wait
  ./reset.js

# id name
< li

+ mail

onMount =>
  [id] = li
  mail = await authConfMeta id
  return

set = ->
  [b] = reset.call(
    @
    mail
  )
  [u,p] = b.getElementsByTagName('input')
  u.disabled = true
  p.focus()
  p.select()
  return
</script>

<template lang="pug">
+if mail!=undefined
  p
    b >name
    i {li[1]}
    a
    b >mail
    i {mail}
    a
    b >password
    i
      a(@click=set) >resetPassword
    a(@click=set)
  +else
    Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

p
  display grid
  grid-template-columns min-content auto 50px
  margin 0
  padding 0
  user-select none

  &>i, &>b, &>a
    background var(--svgDv) 0 0 repeat-x
    padding 16px
    position relative

  &>i
    font-style normal
    padding 16px 0

    &>a
      border-bottom 1px solid #000
      color #000
      padding-bottom 3px

      &:hover
        filter btn-hover-filter

  &>b
    text-align right
    white-space nowrap

  &>a
    &:before
      background var(--svgPen) 50% 50% / 18px no-repeat
      content ''
      height 18px
      position absolute
      right 16px
      top 23px
      width 18px

    &:hover
      &:before
        filter btn-hover-filter
</style>

