<script lang="coffee">
> ./Code.svelte
  ./onUser.js > setUser
  @5-/auth/S.js > authPasswd:submit authReset
  @~3/box/done.js:boxDone
  ~/lib/I18N.js > _$setDone

< li

resend = =>
  authReset(
    ...li
  )

done = (user)=>
  setUser user
  boxDone()
  return

</script>

<template lang="pug">
include /input.pug
Code(done: li: resend: submit:)
  button(type="submit") >setPassword
</template>

<style lang="stylus"></style>

