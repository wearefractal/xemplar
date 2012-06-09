patterns =
  nonblank: /\S/
  trim: /(^\s*)|(\s*$)/g
  ltrim: /(^\s*)/g
  rtrim: /(\s*$)/g

patterns.nonblank.test =
  match:
    shouldntMatch: ['']
    shouldMatch: ['abc']

patterns.trim.test =
  replace:
    sample: ' abc '
    replaceWith: ''
    expected: 'abc'

patterns.rtrim.test =
  replace:
    sample: ' abc '
    replaceWith: ''
    expected: ' abc'

patterns.ltrim.test =
  replace:
    sample: ' abc '
    replaceWith: ''
    expected: 'abc '

module.exports = patterns