> @~3/svelte_mount:mount
  ./new.js:New

< (svelte, props)=>
  New(
    (target)->
      mount(
        svelte
        target
        props
      )
    (m)=>
      m.$destroy()
      return
  )
