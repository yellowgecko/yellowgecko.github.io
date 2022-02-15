---
title: "Yield Farming"
layout: default
toc: false
resource: true
categories: [Strategies]
order: 3
---
#### [Reddit introductiön on Yield Farming](https://www.reddit.com/r/CryptoCurrency/comments/n0yng2/defi_explained_yield_farming/)

#### Auto Compounding/ Yield optimizers
A number of Defi platforms offer auto compounding, mostly as part of a strategy. Maybe managed strategies would be a better term. Relevant sites are
* Beefy
* yearn.finance [The  vaults ot vf](https://vaults.yearn.finance/) documents the variöus strategies
* [HappyHippo](https://happyhippo.farm) takes percentage of profit for providing strategies
* [Balancer.fi](https://balancer.fi/) \| [app](https://app.balancer.fi/) \| [strategy](https://newsletter.banklesshq.com/p/how-to-make-bank-with-balancer-liquidity) \| [v2 guide](https://newsletter.banklesshq.com/p/how-to-use-balancer-v2)
 * yield.yak
 * bifi
 * autofarm
 * wonderland
 * popsicle finance
 
### Looping
leverage yield on stable coins/ use deposit as collateral to borrow to reinvest. 
#### What is looping?
Basically you deposit, say, 1000DAI then you are allowed to borrow 800DAI. You can then redeposit that DAI and now you are allowed to borrow a further 700ishDAI. You can do this round and round until you are borrowing and lending about 5 times as much as you deposited.

It sounds mad but because you get rewards for both borrowing and lending you actually increase your income

In the end, for your initial 1000DAI you might have a position like 5000DAI lent, 4000DAI borrowed. You're earning 4% on the lend and paying 2% on the borrow so in that specific case you would be earning 200DAI and paying 80DAI per year. A 120 DAI per year profit on a 1000 DAI deposit. i.e. 12%. The only downside is a lot of your income is in a non-stable coin like MATIC or JOE or AAVE or whatever so you have to manage that in some way.

A lot of other platforms allow this same trick. It doesn't seem like it increases your liquidation risk significantly although there can be a lot of gas fees to enter and exit such a position since you are doing multiple borrow/lend cycles. You also have to be careful you don't mess something up and get liquidated.

#### Looping Tutorial
[Leverage AAVE market tokens](https://guide.qidao.community/tutorials/polygon/leverage-aave-tokens)

**Example**

Source: [Lend on stablecoin stake tokens](https://www.reddit.com/r/defi/comments/sgtbpu/what_lending_platforms_lend_on_stablecoin_stake/) and in particular [Route2Fl@twitter #1](https://twitter.com/Route2FI/status/1473626708314136585?s=20&t=RC0-nNEmxSKBBl2M9NorMw) and [Route2Fl@twitter #2](https://twitter.com/Route2FI/status/1454065822515830787)
1. Deposit $10K UST in Anchor (you get aUST)
2. Borrow mSLV with your aUST
3. Sell mSLV at Terraswap for UST
4. Repeat 4x and deposit to Anchor
5. You now have $20K UST earning 19,5% APY instead of $10K
6. Buy mSLV on dips to hedge

**Platforms**
* [Abracadabra.money](https://abracadabra.money/)
* [Revenant](https://revenant.finance/)
* [MAI finance](https://www.mai.finance/)
* [Convex finance](https://www.convexfinance.com/)
* [OIN finance](https://v3.oin.finance/)
