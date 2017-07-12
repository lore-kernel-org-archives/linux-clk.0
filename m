Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Jul 2017 18:21:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 01/10] clk: take the prepare lock out of
 clk_core_set_parent
Message-ID: <20170712012120.GR22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-2-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fc58c52a26b4..f5c371532509 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1787,7 +1787,8 @@ bool clk_has_parent(struct clk *clk, struct clk *parent)
>  }
>  EXPORT_SYMBOL_GPL(clk_has_parent);
>  
> -static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
> +static int clk_core_set_parent_nolock(struct clk_core *core,
> +				      struct clk_core *parent)
>  {
>  	int ret = 0;
>  	int p_index = 0;
> @@ -1796,23 +1797,16 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
>  	if (!core)
>  		return 0;
>  
> -	/* prevent racing with updates to the clock topology */
> -	clk_prepare_lock();

Please add a lockdep assertion as we have in other places in this
file so that callers can't mess up calling the nolock function
without the lock held themselves.

> -
>  	if (core->parent == parent)
> -		goto out;
> +		return 0;
>  
>  	/* verify ops for for multi-parent clks */
> -	if ((core->num_parents > 1) && (!core->ops->set_parent)) {
> -		ret = -ENOSYS;
> -		goto out;
> -	}
> +	if ((core->num_parents > 1) && (!core->ops->set_parent))

Nitpick: drop the extra parenthesis here.

> +		return -ENOSYS;
>  
>  	/* check that we are allowed to re-parent if the clock is in use */
> -	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
> -		ret = -EBUSY;
> -		goto out;
> -	}
> +	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
> +		return -EBUSY;
>  
>  	/* try finding the new parent index */
>  	if (parent) {
> @@ -1820,8 +1814,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
>  		if (p_index < 0) {
>  			pr_debug("%s: clk %s can not be parent of clk %s\n",
>  					__func__, parent->name, core->name);
> -			ret = p_index;
> -			goto out;
> +			return p_index;
>  		}
>  		p_rate = parent->rate;
>  	}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
