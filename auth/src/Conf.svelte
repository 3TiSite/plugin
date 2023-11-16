<script lang="coffee">
> @~3/captcha
  @5-/auth/S.js > authConfMeta authName
  @~3/wait:Wait
  @~3/edit:Edit
  @~3/box:Box
  ./onUser.js > User setUser
  ./reset.js
  ./passwd.js:passwdBox
  ./pbox.js
  ./SetMail.svelte

# id name
< li

+ main, mail, passwd, passwdEdit

passwdShow = =>
  passwdEdit.open()
  return

onMount =>
  [id] = li
  mail = (await authConfMeta id) or ''
  return

setPasswd = =>
  if passwd
    passwdBox [mail,passwd]
  return 1

setName = =>
  await authName ...li
  u = User()
  if u and u[0] == li[0]
    setUser li
  return 1

setMail = (old)=>
  m = mail.trim()
  if m.toLowerCase() == old.toLowerCase()
    mail = m
    return 1
  [id] = li
  if await captcha.authNewMail(id,m) != undefined
    Box(SetMail, {li:[id,mail,m]})
    pbox(main).close()
  return

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
        type="email"
        value&mail
      )
    Edit(@&passwdEdit name:>password val:passwd y:setPasswd)
      a(@click=passwdShow slot="t") >resetPassword
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

