> @~3/captcha
  @5-/auth > User

< (args...)=>
  User(await captcha.auth(
    ...args
  )) or 0
