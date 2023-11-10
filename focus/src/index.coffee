< (form)=>
  + first
  for i from form.getElementsByTagName 'input'
    if ['text','password'].includes i.type
      if not i.value.trim()
        i.value = ''
        i.focus()
        return
      if not first
        first = i
  first?.focus()
  return


