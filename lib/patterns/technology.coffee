patterns =
  frequency: 
    all: /(-?\d+((\.\d+)?))\s?([tgmk]?hz)/i
    thz: /(-?\d+((\.\d+)?))\s?thz/i
    ghz: /(-?\d+((\.\d+)?))\s?ghz/i
    mhz: /(-?\d+((\.\d+)?))\s?mhz/i
    khz: /(-?\d+((\.\d+)?))\s?khz/i
    hz: /(-?\d+((\.\d+)?))\s?hz/i

  size:
    all: /(-?\d+((\.\d+)?))\s?([tgmk]?b)/i
    tb: /(-?\d+((\.\d+)?))\s?tb/i
    gb: /(-?\d+((\.\d+)?))\s?gb/i
    mb: /(-?\d+((\.\d+)?))\s?mb/i
    kb: /(-?\d+((\.\d+)?))\s?kb/i
    b: /(-?\d+((\.\d+)?))\s?b/i

getPostfixTest = (letters, postfix) ->
  test =
    test:
      shouldntMatch: ['i','','-']
      shouldMatch: []
  ex = ['-2.1','2','2.1','20.01','1056.21']
  letters ?= ("" for e in ex)
  for m in ex
    for letter in letters
      test.test.shouldntMatch.push "#{m}"
      test.test.shouldMatch.push "#{m}#{letter}#{postfix}"
      test.test.shouldMatch.push "#{m} #{letter}#{postfix}"
      test.test.shouldMatch.push "#{m}#{letter.toUpperCase()}#{postfix.toUpperCase()}"
  return test

patterns.frequency.all.test = getPostfixTest "tgmk", "hz"
patterns.frequency.thz.test = getPostfixTest "t", "hz"
patterns.frequency.ghz.test = getPostfixTest "g", "hz"
patterns.frequency.mhz.test = getPostfixTest "m", "hz"
patterns.frequency.khz.test = getPostfixTest "k", "hz"
patterns.frequency.hz.test = getPostfixTest null, "hz"

patterns.size.all.test = getPostfixTest "tgmk", "b"
patterns.size.tb.test = getPostfixTest "t", "b"
patterns.size.gb.test = getPostfixTest "g", "b"
patterns.size.mb.test = getPostfixTest "m", "b"
patterns.size.kb.test = getPostfixTest "k", "b"
patterns.size.b.test = getPostfixTest null, "b"

module.exports = patterns
