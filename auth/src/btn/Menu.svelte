<script lang="coffee">
> @5-/auth/S.js > authExit
  ../onUser.js > exit

onMount =>
  console.log 'mount !!!'
  =>
    console.log '!! onUnmount'
    return

out = =>
  id = exit()
  if id
    authExit id
  return

admin = =>
  console.log '!! admin'
  return
</script>

<template lang="pug">
a(@click=admin) >userAdmin
a(@click=out) >exit
</template>

<style lang="stylus">
a
  border 1px solid #ccc
  border-top 0
  color #666
  padding 8px
  text-align center
  white-space nowrap
  width 100%

  &:hover
    background #f40
    border-color #f40
    color #fff

  &:first-child
    border-top 1px solid #ccc
</style>

