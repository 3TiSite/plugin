< (e)=>
  while e
    if e.tagName == 'DIALOG'
      return e
    e = e.parentNode
  return
