Return-Path: <sboyd@codeaurora.org>
Date: Mon, 12 Dec 2016 23:38:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] clk: imx: pllv3: support fractional multiplier on vf610
 PLL1/PLL2
Message-ID: <20161213073858.GO5423@codeaurora.org>
References: <1481288408-16035-1-git-send-email-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1481288408-16035-1-git-send-email-nikita.yoush@cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/09, Nikita Yushchenko wrote:
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index 19f9b622981a..24a9e914e0d5 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -288,6 +291,87 @@ static const struct clk_ops clk_pllv3_av_ops = {
>  	.set_rate	= clk_pllv3_av_set_rate,
>  };
>  
> +static unsigned long clk_pllv3_vf610_recalc_rate(struct clk_hw *hw,
> +					      unsigned long parent_rate)
> +{
> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
> +	u32 mfn = readl_relaxed(pll->base + PLL_VF610_NUM_OFFSET);
> +	u32 mfd = readl_relaxed(pll->base + PLL_VF610_DENOM_OFFSET);
> +	u32 div = (readl_relaxed(pll->base) & pll->div_mask) ? 22 : 20;
> +	u64 temp64 = (u64)parent_rate;

Useless cast, please remove.

> +
> +	temp64 *= mfn;
> +	do_div(temp64, mfd);
> +
> +	return (parent_rate * div) + (u32)temp64;
> +}
> +
> +static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long *prate)
> +{
> +	unsigned long parent_rate = *prate;
> +	unsigned int mfi = (rate >= 22 * parent_rate) ? 22 : 20;

What is the importance of 22 and 20? Hint, at the least it needs
a comment.

> +	u32 mfn, mfd = 0x3fffffff;
> +	u64 temp64;
> +
> +	if (rate <= parent_rate * mfi)
> +		mfn = 0;
> +	else if (rate >= parent_rate * (mfi + 1))
> +		mfn = mfd - 1;
> +	else {
> +		/* rate = parent_rate * (mfi + mfn/mfd) */
> +		temp64 = rate - parent_rate * mfi;
> +		temp64 *= mfd;
> +		do_div(temp64, parent_rate);
> +		mfn = temp64;
> +	}
> +
> +	temp64 = ((u64)mfd * mfi + mfn) * parent_rate;
> +	do_div(temp64, mfd);
> +	return (u32)temp64;

Do we need the cast here for some reason?

> +}
> +
> +static int clk_pllv3_vf610_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
> +	unsigned int mfi = (rate >= 22 * parent_rate) ? 22 : 20;
> +	u32 val, mfn, mfd = 0x3fffffff;
> +	u64 temp64;
> +
> +	if (rate <= parent_rate * mfi)
> +		mfn = 0;
> +	else if (rate >= parent_rate * (mfi + 1))
> +		mfn = mfd - 1;
> +	else {
> +		/* rate = parent_rate * (mfi + mfn/mfd) */
> +		temp64 = rate - parent_rate * mfi;
> +		temp64 *= mfd;
> +		do_div(temp64, parent_rate);
> +		mfn = temp64;
> +	}
> +
> +	val = readl_relaxed(pll->base);
> +	if (mfi == 20)

Presumably this is another place 20 and 22 are special.

> +		val &= ~pll->div_mask;
> +	else
> +		val |= pll->div_mask;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
