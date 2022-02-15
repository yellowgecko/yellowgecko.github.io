---
title: "Liquidity Pools"
layout: default
toc: true
resource: true
categories: [Strategies]
order: 1
---
### Reddit
[Liquidity Pools](https://www.reddit.com/r/CryptoCurrency/comments/mfk2oi/defi_explained_liquidity_pools/ "Source on  reddit")
Quote from reddit: *Don’t think convex is a great option for stable farms unless you want volatile rewards tokens like cvx or crv. But is still a good protocol if you’re looking it make some money LPing stables or if you’re long on cvx/crv.*


Provide liquidity to a DEX for a specific pair. Obviously one faces Impermanent loss (IP), explained here:\\
: [Impermanent Loss explained](https://finematics.com/impermanent-loss-explained/)
: [Impermanent Loss](https://3commas.io/academy/articles/impermanent-loss-explained)
: [Impermanent Loss simple explanation](https://3commas.io/academy/articles/impermanent-loss-explained)

LP pay out a share of fees often in their own currency/own LP coins.  the value of which may vary or rapidly decrease. Often it is a manual task to collect and manage these rewards, frequency often limited by transaction fees.

###  Strategies
1. **high correlation pair**\\
It seems to be understood that pairs with high correlation (i.e. stablecoin - stablecoin) show lower risk of IP associated with a lower return in turn.\\
Stable coin LPs tend to pay a higher APY in the form of the defi protocol's own token. Some of them become absolutely worthless very quickly. The volatility of that token is a risk you're taking. You could mitigate that by using an autocompounder but the point is that the nature of the risk is different from lending. Impermanent loss shouldn't even be a worry.\\
2. **Adjust a side on change/ swap in and out**\\
Deposit to coins into a pool. Usually stable + ETH/MATIC/AVAX/BTC
    1. when stable increases … borrow against LP token, borrow non-stable side, then swap for more stable. Use this to pay of stable loan
    2. other way around when coin increases\\
3. **Reduce IL risk with uneven LPs**\\
  [How to avoid IL](https://newsletter.banklesshq.com/p/how-to-avoid-impermanent-loss) \\
4. **Syrup Pools**\\
    supposed to allow single token pools
