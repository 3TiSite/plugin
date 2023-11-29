> @3-/on:On
  @2-/new:New

{body} = document

< =>
  dialog = New.dialog
  dialog.className = 'uBox'
  On dialog,{
    close: =>
      body.removeChild(dialog)
      return
  }

  body.append dialog
  dialog.showModal()
  dialog.addEventListener(
    'cancel'
    (e) =>
      e.preventDefault()
      return
  )
  dialog
