> ./uri.js
  ~/lib/fI18n.js
  ~/lib/fBinMd.js
  ~/lib/I18N.js
  @3-/bintxt
  @3-/msgpack > unpack

export default uri (lang)=>
  [li,dict] = await Promise.all [
    fI18n(
      I18N[lang]
    )
    fBinMd(lang+'/_')
  ]

  [
    Object.assign(
      bintxt li
      unpack dict
    )
  ]
