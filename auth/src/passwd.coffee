> @~3/captcha
  @~3/box:Box
  ./Passwd.svelte

# [mail passwd]
< (li)=>
  r = await captcha.authReset ...li
  if r != undefined
    Box(
      Passwd
      {
        li
      }
    )
  return r
