BetterRegExp = require 'BetterRegExp'

categories =
  text: require './patterns/text'
  number: require './patterns/number'
  information: require './patterns/information'
  time: require './patterns/time'
  technology: require './patterns/technology'
  security: require './patterns/security'
  currency: require './patterns/currency'
  programming: require './patterns/coding'

ext = (obj) ->
  for k,v of obj
    if v instanceof RegExp
      obj[k] = BetterRegExp v
      obj[k].test = v.test if v.test?
    else if typeof v is "object"
      obj[k] = ext v
  return obj

module.exports = ext categories