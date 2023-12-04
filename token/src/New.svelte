<script lang="coffee">
< li

+ val

submit = =>
  console.log val,'value'
  return
</script>

<template lang="pug">
include /input.pug
form(@submit|preventDefault=submit)
  h2 接口令牌
  +input("名称")(
   value&val
   placeholder=" "
   required
   type="text"
  )
  button(type="submit") 创建
</template>

<style lang="stylus">
button
  width 100%
</style>
