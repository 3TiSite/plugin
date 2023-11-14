<script lang="coffee">
> ~/lib/SITE.js
  @~3/errer
  @~3/focus
  @~3/input_mail_a

< li
< submit
< resend
< done

+ form, rs, timeout

code = ''

send = =>
  await resend()
  rs = undefined
  timer()
  return

timer = =>
  timeout = setTimeout(
    =>
      rs = 1
      return
    3e4
  )
  return

onMount =>
  timer()
  focus form
  return

s = =>
  r = await errer form, submit(
    ... li
    code
  )
  if r != undefined
    done(r)
    form.parentNode.close()

  else if not rs
    clearTimeout timeout
    rs = 2
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=s)
  h1 {SITE.host}
  InputMailA(mail:li[0])
  b >enterCode
  +input(">code")#code(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&code
  )
  i
    i >checkSpam
    +if rs
      i
        +if rs == 1
          i >notRecv
        a(@click=send) >resend
  slot
</template>

<style lang="stylus">
@import '~/styl/var.styl'
@import '~/styl/util/h1Logo.styl'

i
  font-style normal

form
  :global(button)
    width 100%

  user-select none

  &>b, &>i
    align-self flex-start

  & > b
    margin -8px 16px 12px

  & > i
    align-self stretch
    display flex
    font-size 14px
    font-weight bold
    justify-content space-between
    margin -16px 16px 16px

    &>i
      display flex
      flex-wrap wrap
      justify-content flex-end

      &:first-child
        margin-right 16px
        white-space nowrap

      font-weight bold

      &>a
        border-bottom 2px solid
        margin-left 6px
        padding-bottom 3px
        white-space nowrap
</style>

