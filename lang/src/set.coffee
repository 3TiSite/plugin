> @2-/doc/HTM.js

HOOK = new Set

< (l)=>
  HTM.lang = l
  Promise.allSettled [...HOOK].map (f)=>
    try
      await f l
    catch err
      console.error err
    return

< onSet = (f)=>
  HOOK.add f
  {lang} = HTM
  if lang
    f lang
  =>
    HOOK.delete f
    return
