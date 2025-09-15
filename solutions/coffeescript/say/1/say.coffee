SMALL = [
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
  'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
  'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
]
SMALL[20] = 'twenty'; SMALL[30] = 'thirty';  SMALL[40] = 'forty';  SMALL[50] = 'fifty'
SMALL[60] = 'sixty';  SMALL[70] = 'seventy'; SMALL[80] = 'eighty'; SMALL[90] = 'ninety'

saySmall = (n) -> SMALL[n] or SMALL[n - n % 10] + "-" + SMALL[n % 10]

sayCompound = (n, base, word) ->
  rem = n % base
  Say.say((n - rem) / base) + " " + word + (if rem then " " + Say.say(rem) else "")

class Say
  @say: (n) -> 
    throw new Error 'input out of range'   if n < 0
    return saySmall(n)                     if n < 100
    return sayCompound(n, 100, 'hundred')  if n < 1e3
    return sayCompound(n, 1e3, 'thousand') if n < 1e6
    return sayCompound(n, 1e6, 'million')  if n < 1e9
    return sayCompound(n, 1e9, 'billion')  if n < 1e12
    throw new Error 'input out of range'

module.exports = Say
