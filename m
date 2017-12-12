Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45360 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751234AbdLLPFv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Dec 2017 10:05:51 -0500
Subject: Re: [PATCH 02/10] clk: qcom: Fix .set_rate to handle alpha PLLs w/wo
 dynamic update
To: Ilia Lin <ilialin@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, will.deacon@arm.com, tfinkel@codeaurora.org,
        qualcomm-lt@lists.linaro.org, celster@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>
References: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org>
 <1513081897-31612-3-git-send-email-ilialin@codeaurora.org>
From: Julien Thierry <julien.thierry@arm.com>
Message-ID: <ee78b47f-4fdb-01eb-ba04-c1172b7b7b00@arm.com>
Date: Tue, 12 Dec 2017 15:05:45 +0000
MIME-Version: 1.0
In-Reply-To: <1513081897-31612-3-git-send-email-ilialin@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 12/12/17 12:31, Ilia Lin wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> From: Taniya Das <tdas@codeaurora.org>
> 
> Alpha PLLs which do not support dynamic update feature
> need to be explicitly disabled before a rate change.
> The ones which do support dynamic update do so within a
> single vco range, so add a min/max freq check for such
> PLLs so they fall in the vco range.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 71 +++++++++++++++++++++++++++++++++-------
>   drivers/clk/qcom/clk-alpha-pll.h |  5 +++
>   2 files changed, 65 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 47a1da3..ecb9e7f 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -376,19 +376,46 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
>   	return alpha_pll_calc_rate(prate, l, a);
>   }
>   
> -static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> -				  unsigned long prate)
> +static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long prate,
> +			      int (*enable)(struct clk_hw *hw),
> +			      void (*disable)(struct clk_hw *hw))
>   {
> +	bool enabled;

Some remarks about this.

>   	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>   	const struct pll_vco *vco;
>   	u32 l, off = pll->offset;
>   	u64 a;
>   
>   	rate = alpha_pll_round_rate(rate, prate, &l, &a);
> -	vco = alpha_pll_find_vco(pll, rate);
> -	if (!vco) {
> -		pr_err("alpha pll not in a valid vco range\n");
> -		return -EINVAL;
> +	enabled = clk_hw_is_enabled(hw);

This is not needed unless we go through the 'else' branch.

> +
> +	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
> +		/*
> +		 * PLLs which support dynamic updates support one single
> +		 * vco range, between min_rate and max_rate supported
> +		 */
> +		if (rate < pll->min_rate || rate > pll->max_rate) {
> +			pr_err("alpha pll rate outside supported min/max range\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/*
> +		 * All alpha PLLs which do not support dynamic update,
> +		 * should be disabled before a vco update.
> +		 */
> +		if (enabled)
> +			disable(hw);
> +
> +		vco = alpha_pll_find_vco(pll, rate);
> +		if (!vco) {
> +			pr_err("alpha pll not in a valid vco range\n");
> +			return -EINVAL;
> +		}
> +
> +		regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
> +				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> +				   vco->val << PLL_VCO_SHIFT);
>   	}
>   
>   	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
> @@ -401,16 +428,29 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
>   	}
>   
> -	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
> -			   PLL_VCO_MASK << PLL_VCO_SHIFT,
> -			   vco->val << PLL_VCO_SHIFT);
> -
>   	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
>   			   PLL_ALPHA_EN);
>   
> +	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
> +		enable(hw);
> +

This condition is only "did we disable the clock and need to reenable it?".

To make it clearer, I'd suggest renaming 'enabled' to something like 
'need_reenabling' and the code look like this:

static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
			      unsigned long prate,
			      int (*enable)(struct clk_hw *hw),
			      void (*disable)(struct clk_hw *hw))
{
	bool need_reenabling = false;

	[...]

	if(pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
		[...]
	} else {
		if (clk_hw_is_enabled(hw)) {
			disable(hw);
			need_reenabling = true;
		}
		[...]
	}

	[...]

	if (need_reenabling)
		enable(hw);

}


Cheers,

-- 
Julien Thierry
