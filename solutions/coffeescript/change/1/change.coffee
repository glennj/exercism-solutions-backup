class Change
  @findFewestCoins: (coins, target) ->
    if target < 0
      throw new Error "target can't be negative"
    else if target == 0
      []
    else
      firstCoinForValue = @change(target, coins)
      @makeChange(target, coins, firstCoinForValue)

  #   Change making algorithm from
  #   http://www.ccs.neu.edu/home/jaa/CSG713.04F/Information/Handouts/dyn_prog.pdf
  #
  #   This function generates two arrays:
  #
  #   C = maps the minimum number of coins required to make
  #       change for each n from 1 to amount.  It is only
  #       used internally in this function.
  #
  #   S = the _first_ coin used to make change for amount n
  #       (actually stores the coin _index_ into the coins array)

  @change: (amount, coins) ->
    rng = [1..amount]
    max = 999999999

    C = [0].concat (max for _ in rng)
    S = [0].concat (null for _ in rng)

    for p in rng
      min = max
      coin = null

      for c, i in coins
        if c <= p
          if 1 + C[p - c] < min
            min = 1 + C[p - c]
            coin = i
        C[p] = min
        S[p] = coin

    return S


  @makeChange: (amount, coins, firstCoin) ->
    if firstCoin[amount] == null
      throw new Error "can't make target with given coins"

    change = []
    while amount > 0
      coin = coins[ firstCoin[amount] ]
      change.push coin
      amount -= coin

    return change


module.exports = Change
