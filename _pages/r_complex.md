---
title: "Complex Strategies"
layout: default
toc: false
resource: true 
categories: [Recipes] 
order: 3
---

Bits and pieces collected about complex and hedging strategies
<br><br><br><br>

### Borrow against collateral
The most common reasons usually center around depositing collateral in one coin, and borrowing in another coin. 
The two most common ways this can be profitable are [Reddit source](https://www.reddit.com/r/defi/comments/sq9t8i/unless_apy_is_positive_what_is_the_point_of/):

1. **Interest rate arbitrage.**\\
Let's say I'm holding ETH and the highest single-staking APR I can find on ETH is 8%. 
However, I might be able to find stable coin yields around 30%. So I can deposit $1000 worth of 
ETH to a borrowing platform which receives 5% APR, borrow $500 worth of USDC for 10% APR, and 
farm that USDC for 30% APR.    
The total APR I'm receiving on my ETH in this case is 5% + (500/1000)x(30% - 10%) = 15%, which is significantly 
higher than the 8% I was able to find by single-staking. These numbers are an example: you'll have to 
find your own interest rate arbitrage opportunities in the real world.
2. **Shorting.**\\
Let's say I'm holding ETH and I think LTC will go down. 
I can deposit $1000 worth of ETH into a borrowing platform, borrow $500 worth of LTC, and then sell that LTC for USDC. 
Now if the price of LTC falls by 50%, I can buy back the same amount of LTC for 250 USDC, 
repay my loan, and pocket the other 250 USDC.

<br><br><br><br>
### Delta neutral strategies
##### Using Futures to hedge in bear market
Imagine we have 3 BTC and 30 Eth. If we pair them and get a good yield great. Even better when markets are bullish, because both BTC and ETH are going up in value.

What about bad markets? This is when a hedge fund shines.

Instead we take 2 BTC and 20ETH and pair them . The remaining 1 btc and 10 eth we place in a perpetual short future at 1.2 x leverage. 1x leverage is delta neutral we lose on the short but gain on the underlying so up or down we make nothing. 1.2x though we lose a bit of out stack in bull markets, but in bear markets we cover %10 of losses on the 2 BTC and 20 ETH with our shorts on the 1 btc and 10 eth.

You still lose money, but you lose less. If the market is down %30 and you are down %6 you can look at that as a loss. I would say: you haven't lost %6 cause if markets are down %30 you are actually much richer than the rest of the market and your friends.

See [Short BNB Futures](https://coin.guru/pages/short-bnb-futures-selling-binance-coin-futures-to-short-bnb-with-leverage) and [Binance Coin Futures](https://coin.guru/pages/binance-coin-futures-explained-what-are-bnb-futures-and-how-they-work). A longer education on forward markets ans strategies at [Zerhoda - Forward Markets](https://zerodha.com/varsity/chapter/background-forwards-market/)

##### Pseudo delta neutral yield farming
[DN yield farming](https://www.youtube.com/watch?v=hxv55VOyjHc) on Francium/Solana but with a **good calculator**. See [Francium Hedging Docs](https://docs.francium.io/strategy-guide/strategies).


##### How to do the Pseudo Delta Neutral Hedging Strategy
1. Leverage yield farm XXX-USDC pair with 3x leverage (borrowing USDC and using 25% of your capital
2. Leverage yield farm XXX-USDC pair with 3x leverage (borrowing XXX and using 75% of your capital)

How to do the Borrow Farming Strategy
- Leverage yield farm XXX-USDC pair with 2x leverage (borrowing XXX and using 100% of your capital

Some things to consider. You can use this strategy on any coin that is on the lending tab, meaning you can potentially get some insane APYs. 

You must be aware of the risks when doing this:
- You can still get liquidated if the price of the farming asset goes up 60% or down 50% shortly after opening your farming position.
- Its probably not a good idea to be using this strategy on new IDOs or meme tokens.
- 
<br><br>

##### Leveraged Tokens

[Compli.fi](https://app.compli.fi/) is a derivatives issuance protocol combined with an Automated Market Maker (AMM). [Compli Docs](https://docs.compli.fi/)

[Tranchess](https://tranchess.com/) is a yield enhancing asset tracker protocol.






<br><br>
