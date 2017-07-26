Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Jul 2017 17:59:00 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 06/10] clk: add clk_set_rate_protect
Message-ID: <20170726005900.GJ2146@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-7-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-7-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d688b8f59a59..d91236e70a04 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1809,6 +1809,51 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
>  EXPORT_SYMBOL_GPL(clk_set_rate);
>  
>  /**
> + * clk_set_rate_protect - specify a new rate and protect it
> + * @clk: the clk whose rate is being changed
> + * @rate: the new rate for clk
> + *
> + * This is a combination of clk_set_rate and clk_rate_protect within

s/clk_set_rate/clk_set_rate()/
s/clk_rate_protect/clk_rate_protect()/

> + * a critical section
> + *
> + * This can be used initially to ensure that at least 1 consumers is

s/consumers/consumer/

> + * statisfied when several protecting consummers are competing for the

s/consummers/consumers/

> + * same clock provider.
> + *
> + * The protection is not applied if setting the rate failed.
> + *
> + * Returns 0 on success, -EERROR otherwise.
> + */
> +int clk_set_rate_protect(struct clk *clk, unsigned long rate)
> +{
> +	int ret;
> +
> +	if (!clk)
> +		return 0;
> +
> +	/* prevent racing with updates to the clock topology */
> +	clk_prepare_lock();
> +
> +	/*
> +	 * The temporary protection removal is not here, on purpose
> +	 * This function is meant to be used in instead of clk_rate_protect,

s/in//

> +	 * so before the consumer code path protect the clock provider
> +	 */
> +
> +	ret = clk_core_set_rate_nolock(clk->core, rate);
> +

Drop newline please.

> +	if (!ret) {
> +		clk_core_rate_protect(clk->core);
> +		clk->protect_count++;
> +	}
> +
> +	clk_prepare_unlock();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_set_rate_protect);
> +
> +/**
>   * clk_set_rate_range - set a rate range for a clock source
>   * @clk: clock source
>   * @min: desired minimum clock rate in Hz, inclusive

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
