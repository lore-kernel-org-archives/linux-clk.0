Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Jul 2017 17:12:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Message-ID: <20170726001217.GC2146@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-6-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> The patch adds clk_protect and clk_unprotect to the CCF API. These
> functions allow a consumer to inform the system that the rate of clock is
> critical to for its operations and it can't tolerate other consumers

s/for//

> changing the rate or introducing glitches while the clock is protected.


> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 163cb9832f10..d688b8f59a59 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> +
> +/**
> + * clk_rate_unprotect - unprotect the rate of a clock source
> + * @clk: the clk being unprotected
> + *
> + * clk_unprotect completes a critical section during which the clock
> + * consumer cannot tolerate any change to the clock rate. If no other clock
> + * consumers have protected clocks in the parent chain, then calls to this
> + * function will allow the clocks in the parent chain to change rates
> + * freely.
> + *
> + * Unlike the clk_set_rate_range method, which allows the rate to change
> + * within a given range, protected clocks cannot have their rate changed,
> + * either directly or indirectly due to changes further up the parent chain
> + * of clocks.
> + *
> + * Calls to clk_unprotect must be balanced with calls to clk_protect. Calls
> + * to this function may sleep, and do not return error status.
> + */
> +void clk_rate_unprotect(struct clk *clk)
> +{
> +	if (!clk)
> +		return;
> +
> +	clk_prepare_lock();
> +
> +	/*
> +	 * if there is something wrong with this consumer protect count, stop
> +	 * here before messing with the provider
> +	 */
> +	if (WARN_ON(clk->protect_count <= 0))
> +		goto out;
> +
> +	clk_core_rate_unprotect(clk->core);

Can we make this stuff non-recursive? I know that this is
basically a copy paste of prepare/unprepare code and recursion is
nice and elegant, but we really don't need to do it when we could
have a loop that's the same and doesn't blow up our stack frame
usage. I'll send a patch for prepare/enable so you get the idea.

> +	clk->protect_count--;
> +out:
> +	clk_prepare_unlock();
> +}
> +EXPORT_SYMBOL_GPL(clk_rate_unprotect);
[..]
> +
> @@ -2952,6 +3134,17 @@ void __clk_put(struct clk *clk)
>  
>  	clk_prepare_lock();
>  
> +	/*
> +	 * Before calling clk_put, all calls to clk_rate_protect from a given
> +	 * user must be balanced with calls to clk_rate_unprotect and by that
> +	 * same user
> +	 */
> +	WARN_ON(clk->protect_count);
> +
> +	/* We voiced our concern, let's sanitize the situation */
> +	for (; clk->protect_count; clk->protect_count--)
> +		clk_core_rate_unprotect(clk->core);

Does this do anything different than:

	clk->core->protect_count -= clk->protect_count;
	clk->protect_count = 1;
	clk_core_rate_unprotect(clk->core);

Just seems better to not do a loop here.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 91bd464f4c9b..b60c36f2e6b0 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -331,6 +331,30 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
>   */
>  struct clk *devm_get_clk_from_child(struct device *dev,
>  				    struct device_node *np, const char *con_id);
> +/**
> + * clk_rate_protect - inform the system when the clock rate must be protected.
> + * @clk: clock source
> + *
> + * This function informs the system that the consumer protecting the clock
> + * depends on the rate of the clock source and can't tolerate any glitches
> + * introduced by further clock rate change or re-parenting of the clock source.
> + *
> + * Must not be called from within atomic context.
> + */
> +void clk_rate_protect(struct clk *clk);

Is there any plan to use this clk_rate_protect() API? It seems
inherently racy for a clk consumer to call clk_set_rate() and
then this clk_rate_protect() API after that to lock the rate in.
How about we leave this out of the consumer API until a user
needs it?

I'm tempted to say that we could do this rate locking stuff with
clk_set_rate_range(), but with more thought that doesn't seem
possible because there's a subtle difference. The range API is
willing to accept a range of frequencies, and calling
clk_set_rate_range() with some exact frequency should fail if
that exact frequency can't be met. With this API and the
subsequent clk_set_rate_protect() API we're willing to accept
that the rate we call clk_set_rate_protect() with could be
different than the rate we actually get.

Finally, When does a consumer want the rate of a clk to change
after they call clk_set_rate() on it? I would guess that very few
consumers would be willing to accept that. Which begs the
question, if anyone will keep calling clk_set_rate() after this
API (and the clk_set_rate_protect() API) is added. It almost
seems like we would want it to be opt-out, instead of opt-in, so
that consumers would call clk_set_rate() and expect it to be a
stable clk rate after that, and they would call
clk_set_rate_trample_on_me() or something properly named when
they don't care what the rate is after they call the API.

> +
> +/**
> + * clk_rate_unprotect - release the protection of the clock source.
> + * @clk: clock source
> + *
> + * This function informs the system that the consumer previously protecting the
> + * clock rate can now deal with other consumer altering the clock source rate

other consumers

> + *
> + * The caller must balance the number of rate_protect and rate_unprotect calls.

Please say clk_rate_protect() and clk_rate_unprotect() here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
