<script lang="coffee">
> ../Menu.js
  @~3/lang/onMount.js:onI18n

li = []
onMount onI18n(
  ->
    li = Menu.map (i)=>
      [
        @[i[0]],...i.slice(1)
      ]
    return
)
</script>

<template lang="pug">
+each li as [t,fn,href]
  +if href
    a(href:) {t}
    +else
      a(@click=fn) {t}
</template>

<style lang="stylus"></style>
