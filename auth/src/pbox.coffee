< (e)=>
  loop
    if e.tagName == 'DIALOG'
      return e
    e = e.parentNode
  return
