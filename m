Return-Path: <sboyd@codeaurora.org>
Date: Tue, 23 Aug 2016 23:13:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v2 02/10] clk: qcom: Add support for alpha pll hwfsm ops
Message-ID: <20160824061301.GT6502@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
 <1470904858-11930-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470904858-11930-3-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Rajendra Nayak wrote:
> Add support to enable/disable the alpha pll using hwfsm

Care to add some more description here about what's going on?

> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 109 ++++++++++++++++++++++++++++++++++-----
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 98 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index e6a03ea..bae31f9 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -62,9 +62,10 @@
>  #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
>  					   struct clk_alpha_pll_postdiv, clkr)
>  
> -static int wait_for_pll(struct clk_alpha_pll *pll)
> +static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
> +			const char *action)
>  {
> -	u32 val, mask, off;
> +	u32 val, off;
>  	int count;
>  	int ret;
>  	const char *name = clk_hw_get_name(&pll->clkr.hw);
> @@ -74,26 +75,101 @@ static int wait_for_pll(struct clk_alpha_pll *pll)
>  	if (ret)
>  		return ret;
>  
> -	if (val & PLL_VOTE_FSM_ENA)
> -		mask = PLL_ACTIVE_FLAG;
> -	else
> -		mask = PLL_LOCK_DET;
> -
> -	/* Wait for pll to enable. */

Perhaps commit text could state why we shouldn't keep extending
this model of figuring out what to poll?

>  	for (count = 100; count > 0; count--) {
>  		ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
>  		if (ret)
>  			return ret;
> -		if ((val & mask) == mask)
> +		if (inverse && (val & mask))
> +			return 0;
> +		else if ((val & mask) == mask)
>  			return 0;
>  
>  		udelay(1);
>  	}
>  
> -	WARN(1, "%s didn't enable after voting for it!\n", name);
> +	WARN(1, "%s failed to %s!\n", name, action);
>  	return -ETIMEDOUT;
>  }
>  
> +static int wait_for_pll_enable(struct clk_alpha_pll *pll, u32 mask)
> +{
> +	return wait_for_pll(pll, mask, 0, "enable");
> +}

This is only called with two masks, so maybe we can have two
functions for it or a simple macro to avoid making clients know
about the mask?

> +
> +static int wait_for_pll_disable(struct clk_alpha_pll *pll, u32 mask)
> +{
> +	return wait_for_pll(pll, mask, 1, "disable");
> +}
> +
> +static int wait_for_pll_offline(struct clk_alpha_pll *pll, u32 mask)
> +{
> +	return wait_for_pll(pll, mask, 0, "offline");
> +}

These two are only called with one mask, why have that as a parameter?

> +
> +/* alpha pll with hwfsm support */
> +#define PLL_OFFLINE_REQ		BIT(7)
> +#define PLL_FSM_ENA		BIT(20)
> +#define PLL_OFFLINE_ACK		BIT(28)
> +#define PLL_ACTIVE_FLAG		BIT(30)

Please put these up top next to the register that they're for.

> +
> +static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
> +{
> +	int ret;
> +	u32 val, off;
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +
> +	off = pll->offset;
> +	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable HW FSM mode, clear OFFLINE request */

That's pretty obvious.

> +	val |= PLL_FSM_ENA;
> +	val &= ~PLL_OFFLINE_REQ;
> +	ret = regmap_write(pll->clkr.regmap, off + PLL_MODE, val);
> +	if (ret)
> +		return ret;
> +
> +	/* Make sure enable request goes through before waiting for update */
> +	mb();
> +
> +	ret = wait_for_pll_enable(pll, PLL_ACTIVE_FLAG);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Simplify to return wait_for_pll_enable()?


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
