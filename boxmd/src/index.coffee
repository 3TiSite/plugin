> @~3/box/htmBox.js
  @~3/md:Md
  @~3/svelte_mount:Mount

< (url)=>
  box = htmBox '<div style="max-height:calc(100vh - 128px);padding:0 24px 24px"></div><style>.uBox>div>b.w{margin-top:24px}</style>'
  box.style = 'max-width:750px'
  Mount(
    Md
    box.childNodes[1]
    {
      url
    }
  )
