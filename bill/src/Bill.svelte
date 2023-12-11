<script lang="coffee">

</script>

<template lang="pug">
main
  h1
    b >bill
      select
        option 2023
    i
      b 余额
        b $
          b 232.32
      button 充值
  b
    each i in ['02','01']
      h6 2023
        b= i
      table
        tr
          td(colspan=2) 合计
          td
          td +32.22
        tr
          td
          td
          td
          td 金额
        tr
          td 默认令牌
          td 翻译
          td 09-20
          td -0.20
        tr
          td
          td
          td 09-21
          td -1.21
        tr
          td 充值
          td 支付宝
          td 09-20
          td +302.21
        tr
          td 开发测试
          td 翻译
          td 09-20
          td -202
        tr
          td
          td
          td 09-21
          td -2.11

</template>

<style lang="stylus">
main
  margin auto
  max-width 650px
  padding 24px

  &>h1
    border-bottom 1px solid #000
    display flex
    font-size 24px
    justify-content space-between
    margin 0 0 18px
    padding 8px 0 32px

    &>i, &>b
      align-items center
      display flex

    &>i
      font-style normal
      margin-left 24px

      &>b
        &>b
          margin-left 8px

          &>b
            margin-left 4px

      &>button
        font-family s
        font-size 20px
        margin-left 16px
        padding 9px 12px 10px

    &>b
      &>select
        appearance none
        background var(--svgNabla) 100% 50% no-repeat
        border 0
        border-bottom 1px solid #000
        font-family h
        font-size 24px
        font-variation-settings 'wght' 250, 'BEVL' 40
        margin 0 0 -4px 12px
        outline none
        padding-bottom 4px
        padding-right 16px
        user-select none

  &>b
    border-bottom 1px solid #000
    display block
    padding-bottom 18px

    &>h6
      border-top 1px solid #000
      justify-content center
      padding-top 18px

      &:first-child
        border 0
        padding 0

      &>b
        margin-left 20px
        position relative

        &:before
          border-top 2px solid #000
          content ''
          height 1px
          left -14px
          margin-top -1px
          position absolute
          top 50%
          width 8px

    &>table
      border-collapse collapse
      width 100%

      &>tr
        &:first-child
          padding-bottom 8px

          &>td
            border 1px solid #000
            border-bottom 1px dotted #ccc
            border-width 1px 0 1px 0

          &>td, &+tr>td
            padding-bottom 16px
            padding-top 16px

        &>td
          padding 8px 0 8px 16px
          text-align left

          &:first-child
            padding-left 0

          &:last-child
            text-align right
</style>
