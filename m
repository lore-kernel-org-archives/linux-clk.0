Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55BBB151.6040700@linaro.org>
Date: Fri, 31 Jul 2015 12:33:05 -0500
From: Alex Elder <elder@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 11/26] clk: bcm: Convert to clk_hw based provider APIs
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org> <1438362246-6664-12-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-12-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2015 12:03 PM, Stephen Boyd wrote:
> We're removing struct clk from the clk provider API, so switch
> this code to using the clk_hw based provider APIs.
> 
> Cc: Alex Elder <elder@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/clk/bcm/clk-kona.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
> index 05fa322bc5fb..3a15347b4233 100644
> --- a/drivers/clk/bcm/clk-kona.c
> +++ b/drivers/clk/bcm/clk-kona.c
> @@ -1011,7 +1011,7 @@ static long kona_peri_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	struct bcm_clk_div *div = &bcm_clk->u.peri->div;
>  
>  	if (!divider_exists(div))
> -		return __clk_get_rate(hw->clk);
> +		return clk_hw_get_rate(hw);
>  
>  	/* Quietly avoid a zero rate */
>  	return round_rate(bcm_clk->ccu, div, &bcm_clk->u.peri->pre_div,
> @@ -1022,8 +1022,7 @@ static int kona_peri_clk_determine_rate(struct clk_hw *hw,
>  					struct clk_rate_request *req)
>  {
>  	struct kona_clk *bcm_clk = to_kona_clk(hw);
> -	struct clk *clk = hw->clk;
> -	struct clk *current_parent;
> +	struct clk_hw *current_parent;
>  	unsigned long parent_rate;
>  	unsigned long best_delta;
>  	unsigned long best_rate;
> @@ -1048,14 +1047,14 @@ static int kona_peri_clk_determine_rate(struct clk_hw *hw,
>  	}
>  
>  	/* Unless we can do better, stick with current parent */
> -	current_parent = clk_get_parent(clk);
> -	parent_rate = __clk_get_rate(current_parent);
> +	current_parent = clk_hw_get_parent(hw);
> +	parent_rate = clk_hw_get_rate(current_parent);
>  	best_rate = kona_peri_clk_round_rate(hw, req->rate, &parent_rate);
>  	best_delta = abs(best_rate - req->rate);
>  
>  	/* Check whether any other parent clock can produce a better result */
>  	for (which = 0; which < parent_count; which++) {
> -		struct clk *parent = clk_get_parent_by_index(clk, which);
> +		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, which);
>  		unsigned long delta;
>  		unsigned long other_rate;
>  
> @@ -1064,14 +1063,14 @@ static int kona_peri_clk_determine_rate(struct clk_hw *hw,
>  			continue;
>  
>  		/* We don't support CLK_SET_RATE_PARENT */
> -		parent_rate = __clk_get_rate(parent);
> +		parent_rate = clk_hw_get_rate(parent);
>  		other_rate = kona_peri_clk_round_rate(hw, req->rate,
>  						      &parent_rate);
>  		delta = abs(other_rate - req->rate);
>  		if (delta < best_delta) {
>  			best_delta = delta;
>  			best_rate = other_rate;
> -			req->best_parent_hw = __clk_get_hw(parent);
> +			req->best_parent_hw = parent;
>  			req->best_parent_rate = parent_rate;
>  		}
>  	}
> @@ -1139,7 +1138,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (parent_rate > (unsigned long)LONG_MAX)
>  		return -EINVAL;
>  
> -	if (rate == __clk_get_rate(hw->clk))
> +	if (rate == clk_hw_get_rate(hw))
>  		return 0;
>  
>  	if (!divider_exists(div))
> @@ -1258,6 +1257,7 @@ bool __init kona_ccu_init(struct ccu_data *ccu)
>  	unsigned long flags;
>  	unsigned int which;
>  	struct clk **clks = ccu->clk_data.clks;
> +	struct kona_clk *kona_clks = ccu->kona_clks;
>  	bool success = true;
>  
>  	flags = ccu_lock(ccu);
> @@ -1268,7 +1268,7 @@ bool __init kona_ccu_init(struct ccu_data *ccu)
>  
>  		if (!clks[which])
>  			continue;
> -		bcm_clk = to_kona_clk(__clk_get_hw(clks[which]));
> +		bcm_clk = &kona_clks[which];
>  		success &= __kona_clk_init(bcm_clk);
>  	}
>  
> 

