<script lang="coffee">
+ aTurn,disable,id

< turn

onMount ->
  setTimeout =>
    b = aTurn.parentNode
    id = +b.previousSibling.rel
    disable = b.parentNode.parentNode.classList.contains 'd'
    return
  return

turnSet = (v)=>
  turn id,v
  return
</script>

<template lang="pug">
+if disable
  a(@click={turnSet(0)}) 启用
  +else
    a(@&aTurn @click={turnSet(1)}) 禁用
a 更换
a 删除
</template>

<style lang="stylus"></style>
