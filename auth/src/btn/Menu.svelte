<script lang="coffee">
> ../Li.svelte
  ../exit.js:_exit
  ../onUser.js > User
  @5-/auth/S.js > authExit
  @~3/box:Box

exit = =>
  _exit(User()?[0])
  return

admin = =>
  Box Li
  return
</script>

<template lang="pug">
a(@click=admin) >userAdmin
a(@click=exit) >exit
</template>

<style lang="stylus"></style>

