---
title: "Liquidity Pools"
layout: default
toc: true
resource: true
categories: [Strategies]
order: 1
---

<br><br>

### What are Liquidity Pools?
Liquidity pools are pools of tokens that are locked in a smart contract. Their role is to provide liquidity of decentralised exchanges. By offering liquidity, they guarantee trading, and because of this, they are widely used by decentralized exchanges. Liquidity pools, in essence, are the trading aspect of a decentralized exchange. As decentralised exchanges deploy Automated Market Makers (AMM) for price finding they introduce the risk of _impermanent loss_. [Reddit Introduction to Liquidity Pools](https://www.reddit.com/r/CryptoCurrency/comments/mfk2oi/defi_explained_liquidity_pools/ "Source on  reddit")

By providing liquidity to a pool one can gain a share of the fees earned. This is often paid out in their own currency/own LP coins. The value of which may vary or even rapidly decrease. Often it is a manual task to collect and manage these rewards, and the frequency thereof often limited by transaction fees.

Impermanent loss (IP), explained here:

: [Impermanent Loss explained](https://finematics.com/impermanent-loss-explained/)
: [Impermanent Loss](https://3commas.io/academy/articles/impermanent-loss-explained)
: [Impermanent Loss simple explanation](https://3commas.io/academy/articles/impermanent-loss-explained)
: [IL Guide](https://rugdoc.io/education/impermanent-loss/)
: [another guide](https://blog.bancor.network/beginners-guide-to-getting-rekt-by-impermanent-loss-7c9510cb2f22)
: [Detailed explanaition](https://finematics.com/impermanent-loss-explained/)


**[IL Calculator](https://decentyields.com/impermanent-loss-calculator)**


<br><br>

###  Strategies
[How not to get reck'd by IL](https://defiyield-app-guides.medium.com/how-to-avoid-getting-rekt-with-yield-farming-7e558ce08ea1)

[5 ways to manage IL](https://www.reddit.com/r/CryptoCurrency/comments/ssaze5/5_most_effective_ways_to_manage_or_avoid/)
1. **high correlation pair**\\
It seems to be understood that pairs with high correlation (i.e. stablecoin - stablecoin) show lower risk of IP associated with a lower return in turn.\\
Stable coin LPs tend to pay a higher APY in the form of the defi protocol's own token. Some of them become absolutely worthless very quickly. The volatility of that token is a risk you're taking. You could mitigate that by using an autocompounder but the point is that the nature of the risk is different from lending. Impermanent loss shouldn't even be a worry.

2. **Adjust a side on change/ swap in and out**\\
Deposit to coins into a pool. Usually stable + ETH/MATIC/AVAX/BTC
    1. when stable increases … borrow against LP token, borrow non-stable side, then swap for more stable. Use this to pay of stable loan
    2. other way around when coin increases  \\
    
-symmetrically enter if you are bullish on both assets long-term, choose a deep pool to reduce slippage fee

-do not assymetrically enter with the asset that you believe will outperform 

-assymetrically enter with the asset that you believe is going to underperform

-do not enter pools with speculative / volatile altcoins


3. **Reduce IL risk with uneven LPs**\\
  [How to avoid IL](https://newsletter.banklesshq.com/p/how-to-avoid-impermanent-loss).
  others are: **Balancer** and **Bancor**
  
4. **Single Token Pools**\\
    Single token staking i.e. [syrup pools](https://pancakeswap.finance/pools) on pancakeswap or [bancor](https://app.bancor.network/pools) / [Bancor introduction](https://finematics.com/bancor-v2-explained/)
    
5. Provide liquidity when asset value is low.

6. Multi asset pools (>2)
