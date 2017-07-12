Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Jul 2017 18:49:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 03/10] clk: rework calls to round and determine rate
 callbacks
Message-ID: <20170712014917.GT22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-4-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> Rework the way the callbacks round_rate and determine_rate are called. The
> goal is to do this at a single point and make it easier to add conditions
> before calling them.

This should also say that now we check the rate returned by
determine_rate ops against the min/max rates so that we don't
exceed the limits?

> 
> This rework is done to ease the integration of "protected" clock
> functionality.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c | 78 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 44 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index dceaf0ff23db..8cc4672414be 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -833,16 +833,34 @@ static int clk_disable_unused(void)
>  }
>  late_initcall_sync(clk_disable_unused);
>  
> -static int clk_core_round_rate_nolock(struct clk_core *core,
> -				      struct clk_rate_request *req)
> +static int clk_core_determine_round(struct clk_core *core,
> +				    struct clk_rate_request *req)
>  {
> -	struct clk_core *parent;
>  	long rate;
>  
> -	lockdep_assert_held(&prepare_lock);

Best to leave this in place for clk_core_determine_round().

> +	if (core->ops->determine_rate) {
> +		return core->ops->determine_rate(core->hw, req);
> +	} else if (core->ops->round_rate) {
> +		rate = core->ops->round_rate(core->hw, req->rate,
> +					     &req->best_parent_rate);
> +		if (rate < 0)
> +			return rate;
>  
> -	if (!core)
> -		return 0;
> +		req->rate = rate;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void clk_core_init_rate_req(struct clk_core *core,

Can core be const?

> +				   struct clk_rate_request *req)
> +{
> +	struct clk_core *parent;
> +
> +	if (WARN_ON(!core || !req))
> +		return;
>  
>  	parent = core->parent;
>  	if (parent) {
> @@ -852,22 +870,24 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
>  		req->best_parent_hw = NULL;
>  		req->best_parent_rate = 0;
>  	}
> +}
>  
> -	if (core->ops->determine_rate) {
> -		return core->ops->determine_rate(core->hw, req);
> -	} else if (core->ops->round_rate) {
> -		rate = core->ops->round_rate(core->hw, req->rate,
> -					     &req->best_parent_rate);
> -		if (rate < 0)
> -			return rate;
> +static int clk_core_round_rate_nolock(struct clk_core *core,
> +				      struct clk_rate_request *req)
> +{
> +	lockdep_assert_held(&prepare_lock);
>  
> -		req->rate = rate;
> -	} else if (core->flags & CLK_SET_RATE_PARENT) {
> -		return clk_core_round_rate_nolock(parent, req);
> -	} else {
> -		req->rate = core->rate;
> -	}
> +	if (!core)
> +		return 0;
> +
> +	clk_core_init_rate_req(core, req);
> +
> +	if (core->ops->determine_rate || core->ops->round_rate)
> +		return clk_core_determine_round(core, req);
> +	else if (core->flags & CLK_SET_RATE_PARENT)
> +		return clk_core_round_rate_nolock(core->parent, req);
>  
> +	req->rate = core->rate;
>  	return 0;
>  }
>  
> @@ -1356,36 +1376,26 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
>  	clk_core_get_boundaries(core, &min_rate, &max_rate);
>  
>  	/* find the closest rate and parent clk/rate */
> -	if (core->ops->determine_rate) {
> +	if (core->ops->determine_rate || core->ops->round_rate) {

This is the second time we check this, maybe another function for
clk_core_can_round(core) is in order?

>  		struct clk_rate_request req;
>  
>  		req.rate = rate;
>  		req.min_rate = min_rate;
>  		req.max_rate = max_rate;
> -		if (parent) {
> -			req.best_parent_hw = parent->hw;
> -			req.best_parent_rate = parent->rate;
> -		} else {
> -			req.best_parent_hw = NULL;
> -			req.best_parent_rate = 0;
> -		}
>  
> -		ret = core->ops->determine_rate(core->hw, &req);
> +		clk_core_init_rate_req(core, &req);
> +
> +		ret = clk_core_determine_round(core, &req);
>  		if (ret < 0)
>  			return NULL;
>  
>  		best_parent_rate = req.best_parent_rate;
>  		new_rate = req.rate;
>  		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
> -	} else if (core->ops->round_rate) {
> -		ret = core->ops->round_rate(core->hw, rate,
> -					    &best_parent_rate);
> -		if (ret < 0)
> -			return NULL;
>  
> -		new_rate = ret;
>  		if (new_rate < min_rate || new_rate > max_rate)
>  			return NULL;
> +

Nitpick: Kill this newline.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
