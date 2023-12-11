> @~3/nav/URLMAP.js
  ./Menu.js


export default new Proxy(
  {}
  get:(_,url)=>
    (lang_code,svelte)=>
      Menu.unshift [
        lang_code
        url
      ]
      URLMAP[url] = svelte
      return
)
