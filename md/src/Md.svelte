<script lang="coffee">
> ~/lib/fMdTxt.js
  @~3/wait:Wait
  @3-/mark
  @2-/title
  @2-/tag0
  svelte > tick

+ h,m

< url

onMount =>
  if url.endsWith '/'
    url += 'README'
    if url.startsWith '/'
      url = url.slice(1)
  md = await fMdTxt url
  h = mark md
  await tick()
  t = document.title
  p = md.indexOf('# ')
  if ~p
    p+=2
    end = md.indexOf('\n', p)
    if end > 0
      h1 = md.slice(p, end)
  title h1
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

