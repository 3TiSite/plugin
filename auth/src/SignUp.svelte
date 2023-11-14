<script lang="coffee">
> ./Code.svelte
  ./onUser.js > setUser
  ./sign.js
  @5-/auth/S.js > authSignUp
  @~3/box/confirm.js
  ~/lib/I18N.js > _$created

< li

name = ''

resend = =>
  sign 0, ...li

done = (uid)=>
  setUser [uid, name]
  confirm ->
    @[_$created]
  return

submit = (args...)=>
  authSignUp(
    ... args
    name
  )
</script>

<template lang="pug">
include /input.pug
Code(done: li: resend: submit:)
  +input(">name")#name(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&name
  )
  button(type="submit") >signUp
</template>

<style lang="stylus"></style>

