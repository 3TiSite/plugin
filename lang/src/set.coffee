> @3-/doc

HOOK = new Set

< (l)=>
  doc.lang = l
  Promise.allSettled [...HOOK].map (f)=>
    try
      await f l
    catch err
      console.error err
    return

< onSet = (f)=>
  HOOK.add f
  {lang} = doc
  if lang
    f lang
  =>
    HOOK.delete f
    return
