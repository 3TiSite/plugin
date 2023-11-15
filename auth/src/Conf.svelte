<script lang="coffee">
> @5-/auth/S.js > authConfMeta
  @~3/wait:Wait
  @~3/edit:Edit
  ./reset.js
  ./passwd.js:passwdBox

# id name
< li

+ main, mail, passwd

onMount =>
  [id] = li
  mail = (await authConfMeta id) or ''
  return

setPasswd = =>
  passwdBox [mail,passwd]

setName = =>
  return 1

setMail = =>
  return 1

</script>

<template lang="pug">
include /input.pug

+if mail!=undefined
  main(@&main)
    Edit(name:>name val:li[1] y:setName)
      +input(">name")#name(
        autocomplete="off"
        placeholder=" "
        required
        type="text"
        value&li[1]
      )
    Edit(name:>mail val:mail y:setMail)
      +input(">mail")#mail(
        autocomplete="off"
        placeholder=" "
        required
        type="text"
        value&mail
      )
    Edit(name:>password val:passwd y:setPasswd)
      a(slot="t") >resetPassword
      +input(">password")#passwd(
        autocomplete="off"
        minlength="6"
        placeholder=" "
        required
        type="password"
        value&passwd
      )
  +else
    Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

main
  display grid
  grid-template-columns min-content auto 50px
  user-select none

  &>:global(i), &>:global(b), &>:global(a), &>:global(form)
    background var(--svgDh) 0 0 repeat-x

  &>:global(i), &>:global(b), &>:global(a)
    padding 16px
    position relative

  &>:global(i>a)
    border-bottom 1px solid #000
    color #000
    padding-bottom 3px

    &:hover
      filter btn-hover-filter
</style>

