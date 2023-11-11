<script lang="coffee">
> @~3/menu
  ../auth.js > signUp signIn
  ../onUser.js
  ./Menu.svelte

+ id, user

onUser (_)=>
  user = _
  return

click = menu(
  Menu
)
</script>

<template lang="pug">
b
  +if user
    a.u(@click) {user[1]}
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
  position relative

  &>:global(b)
    background #fff
    flex-direction column
    padding 0 8px
    position absolute
    right 0
    top 100%

  &>:global(b>a)
    border 1px solid #ccc
    border-top 0
    color #666
    padding 8px
    white-space nowrap
    width 100%

  &>:global(b>a:hover)
    background #f40
    border-color #f40
    color #fff

  &>:global(b>a:first-child)
    border-top 1px solid #ccc

  &>a
    color #000
    margin 0 12px
    opacity 0.625

    &:first-child
      margin-left 0

    &:last-child
      margin-right 0

    &:hover
      color #f40

    &.u
      background var(--svgNabla) 100% 56% no-repeat
      border-bottom solid transparent
      margin 0 0 -3px
      padding 0 16px 3px 0

      &:hover
        border-bottom-color #f40
        filter invert(42%) sepia(1) saturate(47)
        opacity 1
</style>

