---
title: "Recipies- DRAFT"
layout: default
toc: true
resource: true 
categories: [Recipies] 
order: 5
---
## Bits and pieces
unsorted 'recipies' ... picked up on the way

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
<br><br><br><br>


### Uniswap guide
[Uniswap howto](https://newsletter.banklesshq.com/p/how-to-make-money-with-uniswap-v3)

<br><br>
### Stablecoin yields
[mstable](https://mstable.org/) as a high interest vault forvarious stable coins. On Ethereum or Polygon.
[Alchemix](https://alchemix.fi/) to deposit and borrow against DAI. [Alchemix Video](https://youtu.be/pVO-dzTuM20) May only be available on ETH.

<br><br>

### Convex
*   lock CVX … from votium.app get ‘bribes’
*   stake CVXCRV
*   deposit into CURVE but don’t stake with gauge
*   then stake LP on convex

<br><br>


### CAKE/LEON/LEOS
_(Note: this is far from clear, need to find original comment)_
all 3 are BSC dex tokens so stay on BSC chain.
use pancakeswap or leonicornswap
stake CAKE in autopool
1/2 LEON and LEOS into single staking
1/2 + liquidity into staking LPs

<br><br>

### Avoid liquidity pools and use money markets
Use money markets like Aave and Compound. The money market in Algorand is Algofi and Harmony has TranquilFi, both support native assets and, more importantly, BTC and ETH.

<br><br>


###  ren Dark node
boot up a Darknode on Ren

### SPELL
_What is this?_

<br><br>

### Harmony chain based
Stake DAO is also incentivized by Harmony and is ~30% staking Curve LP

FarmersOnly has Tranquil Finance vaults that auto compound and earn 20-40% depending on the crypto (single sided).

Hundred Finance has 20-35% stablecoin staking


<br><br>

Fantom, Harmony, and (recently) Aurora. And mostly using med risks strategies with LPs in AstroPort (Terra), Defi Kingdoms (Harmony) and high risk with LPs in Trisolaris (Aurora) and Wonderland (Avalanche).

polygon.balancer.fi 

<br><br><br>

### DVDX
_tbc_


<br><br><br>



### Sifchain/ROWAN
Sifchain- ATOM/ROWAN LP at 1748% APY- rewards are auto-claimed every week.

ROWAN/USDC pool, it's one of the 6 pools that are also 1748% APY.

staking ROWAN on keplr 120%


<br><br><br>
AIOZ and ROWAN at 30% and 120% respectively.
##### Sifchain/ ROWAN
Omni-Chain DEX. Rowan is both Sifchain’s decentralized governance token and settlement token. 


<br><br><br>


### Mad Merket Finance on Cronos chain
MMF will also be launching their tomb fork in the next 2 weeks. ... But supposadly a scam/rug pull as per [Decrypt](https://decrypt.co/60242/binance-chain-defi-meerkat-finance-hack-rug-pull). But these are 2 different projects on different chains.

MMF-CRO vault - 2235% APY (309.29% APR, autocompounded every 30 mins)

MMO-CRO vault - 3145% APY (339.10% APR, autocompounded every 30 mins)

MMO single vault - 992% APY (239% APR, manually compounded daily)


<br><br><br>


### stablecoin pool on Harmony 
Viperswap)- ONEUSD-1USDC at 116% APR

Oin Finance- minted nUSDO [NEAR-backed stablecoin] using stNEAR as collateral, staking in the stability pool for 40% APY


<br><br><br>





### just 3 ecosystems
Cosmos, Near & Harmony

On Cosmos; there's Sifchain & Osmosis- Good UX & very easy to use

Near- Oin Finance, Ref Finance are good stablecoins minting platform & AMMs respectively

And Harmony has Viperswap & DeFi Kingdoms with decent TVL & sustainable farming APRs


<br><br><br>


### ATOM/JUNO
 stake Atom and Juno, follow new projects and get drops. We provide liquidity on JunoSwapDex 


