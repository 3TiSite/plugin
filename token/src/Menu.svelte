<script lang="coffee">
+ aTurn,enable,id

< turn
< rm
< refresh

onMount ->
  setTimeout =>
    b = aTurn.parentNode
    id = +b.previousSibling.rel
    enable = b.parentNode.parentNode.classList.contains 'e'
    return
  return

turnSet = (v)=>
  turn id,v
  return
</script>

<template lang="pug">
+if enable
  a(@click={turnSet(0)}) >disable
  +else
    a(@&aTurn @click={turnSet(1)}) >enable
a(@click={refresh(id)}) >refresh
a(@click={rm(id)}) >rm
</template>

<style lang="stylus"></style>
