<script lang="coffee">
onMount =>
  console.log 'mount !!!'
  =>
    console.log '!! onUnmount'
    return
</script>

<template lang="pug">
a 测试
a 测试第二
</template>

<style lang="stylus"></style>

