patterns =
  percent: new RegExp /-?(\d*\.\d+|\d+)(?:\s?%)/
  all: new RegExp /(-?(\d*\.\d+|\d+))/
  positive: new RegExp /(?!-)(\d*\.\d+|\d+)/
  negative: new RegExp /(-(\d*\.\d+|\d+))/

patterns.percent.test =
  exec:
    flags: 'g'
    sample: '12341234.1234% .234% 30% -12341234.1234% -.234% -30%'
    expected: ['12341234.1234','.234','30','-12341234.1234','-.234','-30']
  match:
    shouldntMatch: ['i','','-','2.1','-2.1','%','i%']
    shouldMatch: ['20%','21 %','21.5%','0.1%','.1%']

patterns.all.test =
  exec:
    flags: 'g'
    sample: '12341234.1234 .234 30 -12341234.1234 -.234 -30'
    expected: ['12341234.1234','.234','30','-12341234.1234','-.234','-30']
  match:
    shouldntMatch: ['i','','-']
    shouldMatch: ['2','2.1','0','12341234.1234','.234','-2','-2.1','-12341234.1234','-.234']

patterns.positive.test =
  exec:
    flags: 'g'
    sample: '12341234.1234 .234 30 -12341234.1234 -.234 -30'
    expected: ['12341234.1234','.234','30']
  match:
    shouldntMatch: ['i','','-','-2','-2.1','-12341234.1234','-.234']
    shouldMatch: ['2','2.1','0','12341234.1234','.234']

patterns.negative.test =
  exec:
    flags: 'g'
    sample: '12341234.1234 .234 30 -12341234.1234 -.234 -30'
    expected: ['-12341234.1234','-.234','-30']
  match:
    shouldntMatch: ['i','','-','2','2.1','0','12341234.1234','.234']
    shouldMatch: ['-2','-2.1','-12341234.1234','-.234']

module.exports = patterns