<script lang="coffee">
> @2-/tag0
  @~3/menu
  @~3/wait:Wait
  ./Menu.svelte
  @~3/box/Focus.js:Box
  ./New.svelte

+ li

create = =>
  Box(
    New
    {
      li
    }
  )
  return

drop = menu Menu,{
  turn:(id,v)=>
    for i,p in li
      if i[0] == id
        i[3] = v
        li[p] = i
        console.log 'todo',id, v
        break
    return
}


onMount =>
  li = [
    [
      121
      '默认令牌'
      'FvgA3CTcu6'
      0
    ]
    [
      122
      '测试'
      'Xsf22342423'
      1
    ]
  ]
  return

copy = ->
  d = 'd'
  console.log @classList
  @classList.add d
  setTimeout(
    =>
      @classList.remove d
    2e3
  )
  navigator.clipboard.writeText(
    tag0(@parentNode,'i').innerText
  )
  return
</script>

<template lang="pug">
main
  h1 >apiToken
  +if li
    b
      +each li as [id,name,token,disable]
        b(class:d=disable)
          b
            b {name}
            a(@click=drop rel:id)
          i
            i {token}
            a(@click=copy)
    button(@click=create) 创建
    +else
      Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

main
  align-self center
  display flex
  flex 1
  flex-direction column
  justify-content center
  margin 0 32px
  max-width 600px

  b
    display flex
    flex-direction column

  &>b
    margin-bottom 16px

    &>b
      margin-bottom 16px

      &.d
        &>i, &>b>b
          opacity 0.3

      &>i
        border 1px solid #000
        display flex

        &>a
          background var(--svgCopy) 50% 22px / 20px no-repeat
          position relative
          transition none
          width 40px

          &:hover
            filter btn-hover-filter

          &:global(.d)
            background none

            &:hover
              filter none

            &:before
              background #390
              clip-path polygon(0 51%, 38% 73%, 100% 0, 100% 35%, 44% 100%, 0 74%)
              content ''
              display block
              height 20px
              margin-left 30%
              margin-top 50%
              width 16px

        &>i
          border-right 0
          font-style normal
          padding 16px

      &>b
        align-items center
        flex-direction row
        justify-content space-between
        margin-bottom 16px
        position relative

        &>a
          background var(--svgNabla) 68% 77% / 8px no-repeat
          border 2px solid #000
          border-radius 16px
          height 14px
          width 14px

          &:hover
            filter btn-hover-filter

  &>h1
    justify-content center
    width 100%

  button
    width 100%
</style>
