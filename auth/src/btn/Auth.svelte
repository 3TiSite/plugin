<script lang="coffee">
> ../auth.js > signUp signIn
  ../onUser.js

+ id, user

onUser (_)=>
  user = _
  return
</script>

<template lang="pug">
b
  +if user
    a {user[1]}
    +else
      a(@click=signUp) >signUp
      | ⧸
      a(@click=signIn) >signIn
</template>

<style lang="stylus">
b
  align-self stretch
  border-left 1px solid #eee
  color #ccc
  margin-left 24px
  padding-left 24px

  &>a
    color #666
    margin 0 12px

    &:first-child
      margin-left 0

    &:last-child
      margin-right 0

    &:hover
      color #f40
</style>

