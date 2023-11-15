<script lang="coffee">
> @~3/errer
  ./passwd.js

< account

+ form, input_li

submit = =>
  li = input_li.map (i)=>i.value
  if undefined != await errer(
    form
    passwd li
  )
    form.parentNode.close()
  return

onMount =>
  input_li = [...form.getElementsByTagName 'input']
  input_li[0].focus()
  input_li[0].select()
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=submit)
  +input(">mail")#account(
    autocomplete="username"
    placeholder=" "
    required
    type="text"
    value&account
  )
  +input(">setPassword")#password(
    autocomplete="off"
    minlength="6"
    placeholder=" "
    required
    type="password"
  )
  button(type="submit") >resetPassword
</template>

<style lang="stylus">
form
  padding-top 26px

  button
    width 100%
</style>

