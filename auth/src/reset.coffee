> ./pbox.js
  ./ResetPasswd.svelte
  @~3/box:Box

< (account='')->
  pbox(@).close()
  Box(
    ResetPasswd
    {
      account
    }
  )
