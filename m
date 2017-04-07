Return-Path: <pdeschrijver@nvidia.com>
Date: Fri, 7 Apr 2017 14:44:40 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Re-evaluate clock rate on min/max update
Message-ID: <20170407114440.GD25177@tbergstrom-lnx.Nvidia.com>
References: <1490103807-21821-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1490103807-21821-1-git-send-email-pdeschrijver@nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 21, 2017 at 03:43:26PM +0200, Peter De Schrijver wrote:
> Whenever a user change its min or max rate limit of a clock, we need to
> re-evaluate the current clock rate and possibly change it if the new limits
> require so. To do this clk_set_rate_range() already calls
> clk_core_set_rate_nolock, however this won't have the intended effect
> because the core clock rate hasn't changed. To fix this, move the test to
> avoid setting the same core clock rate again, to clk_set_rate() so
> clk_core_set_rate_nolock() can change the clock rate when min or max have
> been updated, even when the core clock rate has not changed.
> 

Ping! Any comments on this?

Peter.

> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/clk.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 2fa2fb8..0b815d1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1569,10 +1569,6 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
>  	if (!core)
>  		return 0;
>  
> -	/* bail early if nothing to do */
> -	if (rate == clk_core_get_rate_nolock(core))
> -		return 0;
> -
>  	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
>  		return -EBUSY;
>  
> @@ -1621,16 +1617,21 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
>   */
>  int clk_set_rate(struct clk *clk, unsigned long rate)
>  {
> -	int ret;
> +	int ret = 0;
>  
>  	if (!clk)
> -		return 0;
> +		return ret;
>  
>  	/* prevent racing with updates to the clock topology */
>  	clk_prepare_lock();
>  
> +	/* bail early if nothing to do */
> +	if (rate == clk_core_get_rate_nolock(clk->core))
> +		goto out;
> +
>  	ret = clk_core_set_rate_nolock(clk->core, rate);
>  
> +out:
>  	clk_prepare_unlock();
>  
>  	return ret;
> -- 
> 1.9.1
> 
