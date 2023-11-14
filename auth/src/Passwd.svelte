<script lang="coffee">
> ./Code.svelte
  ./onUser.js > setUser
  @5-/auth/S.js > authPasswd:submit
  @~3/box/confirm.js
  @~3/captcha
  ~/lib/I18N.js > _$setDone

< li


resend = =>
  captcha.authReset ...li

done = (user)=>
  setUser user
  confirm ->
    @[_$setDone]
  return

</script>

<template lang="pug">
include /input.pug
Code(done: li: resend: submit:)
  button(type="submit") >setPassword
</template>

<style lang="stylus"></style>

