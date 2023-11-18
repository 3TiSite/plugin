> ./uri.js
  ~/lib/fI18n.js
  ~/lib/fMdJson.js
  ~/lib/I18N.js
  @3-/bintxt

export default uri (lang)=>
  [li,dict] = await Promise.all [
    fI18n(
      I18N[lang]
    )
    fMdJson(lang+'/_')
  ]

  [
    Object.assign(
      bintxt li
      dict
    )
  ]
