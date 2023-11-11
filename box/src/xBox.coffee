> @3-/on:On
  @~3/new:New
  ./Box.js

< xClose = (dialog)=>
  x = New.a
  x.className = 'x'
  dialog.prepend x
  On x, {
    click: =>
      dialog.close()
      return
  }
  dialog

< escClose = (dialog)=>
  On dialog,{
    close: On document.body,{
      keyup:(e)=>
        if 27 == e.keyCode
          {target:t} = e
          if ['INPUT','TEXTAREA'].includes t.tagName
            t.blur()
            return
          dialog.close()
        return
    }
  }
  dialog

< =>
  xClose escClose Box()
