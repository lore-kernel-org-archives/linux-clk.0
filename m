Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Jul 2017 19:00:41 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 04/10] clk: use round rate to bail out early in
 set_rate
Message-ID: <20170712020041.GU22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-5-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-5-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> The current implementation of clk_core_set_rate_nolock bails out early if

Add () to functions please.

> the requested rate is exactly the same as the one set. It should bail out
> if the request would not result in rate a change.  This important when

s/in rate a change/in a rate change/
s/This important/This is important/

> rate is not exactly what is requested, which is fairly common with PLLs.

s/rate/the rate/

> 
> Ex: provider able to give any rate with steps of 100Hz
>  - 1st consumer request 48000Hz and gets it.
>  - 2nd consumer request 48010Hz as well. If we were to perform the usual
>    mechanism, we would get 48000Hz as well. The clock would not change so
>    there is no point performing any checks to make sure the clock can
>    change, we know it won't.

I think Peter reported a similar problem as to what you're
describing. Can you further explain a problem situation that this
patch is fixing based on that thread (I can find the link if
needed)? Some of this series if fixing rate constraints actually,
so please Cc him on future patch sets.

> 
> This is important to prepare the addition of the clock protection
> mechanism
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8cc4672414be..163cb9832f10 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1570,15 +1570,34 @@ static void clk_change_rate(struct clk_core *core)
>  		clk_change_rate(core->new_child);
>  }
>  
> +static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
> +						     unsigned long req_rate)
> +{
> +	int ret;
> +	struct clk_rate_request req;
> +
> +	if (!core)
> +		return 0;

This is impossible because the only call site checks for core
being NULL already.

> +
> +	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> +	req.rate = req_rate;
> +
> +	ret = clk_core_round_rate_nolock(core, &req);
> +
> +	return ret ? 0 : req.rate;

What if the return value is negative? We should bail the set rate
call instead of continuing on?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
