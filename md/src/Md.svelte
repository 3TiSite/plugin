<script lang="coffee">
> ~/lib/fTxtMd.js
  @~3/wait:Wait
  @3-/mark
  @~3/title
  @3-/tag0
  svelte > tick

+ h,m

< url

onMount =>
  if url.endsWith '/'
    url += 'README'
    if url.startsWith '/'
      url = url.slice(1)
  md = await fTxtMd url
  h = mark md
  await tick()
  t = document.title
  title tag0(m,'h1')?.innerText
  =>
    title t
    return
</script>

<template lang="pug">
+if h===undefined
  Wait
  +else
    b.m(@&m)
      | {@html h}
</template>

<style lang="stylus">
b.m
  display block

  b, strong
    font-weight 500
</style>

