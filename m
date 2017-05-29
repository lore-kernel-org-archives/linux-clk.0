Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1496049452.7514.5.camel@baylibre.com>
Subject: Re: [PATCH v2 11/11] clk: move CLK_SET_RATE_GATE protection from
 prepare to enable
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, Linus
 Walleij <linus.walleij@linaro.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Date: Mon, 29 May 2017 11:17:32 +0200
In-Reply-To: <20170521215958.19743-12-jbrunet@baylibre.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
	 <20170521215958.19743-12-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2017-05-21 at 23:59 +0200, Jerome Brunet wrote:
> CLK_SET_RATE_GATE name suggest that the rate can be set when the provider
> is gated (disabled). With the current implementation, the rate can only be
> set when the provider is unprepared, while it should be allowed to set a
> prepared and disable provider.
> Fix this by moving the rate protection mechanism in the enable/disable
> core functions
> 

I'll drop this patch in the v3.
The protection count should only be touch while holding the prepare_lock.
This was disaster waiting to happen ... :(

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 6ee5fc59cf1f..e6e5048ce186 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -491,9 +491,6 @@ static void clk_core_unprepare(struct clk_core *core)
>  	if (WARN_ON(core->prepare_count == 1 && core->flags &
> CLK_IS_CRITICAL))
>  		return;
>  
> -	if (core->flags & CLK_SET_RATE_GATE)
> -		clk_core_rate_unprotect(core);
> -
>  	if (--core->prepare_count > 0)
>  		return;
>  
> @@ -564,14 +561,6 @@ static int clk_core_prepare(struct clk_core *core)
>  
>  	core->prepare_count++;
>  
> -	/*
> -	 * CLK_SET_RATE_GATE is a special case of clock protection
> -	 * Instead of a consumer protection, the provider is protecting
> -	 * itself when prepared
> -	 */
> -	if (core->flags & CLK_SET_RATE_GATE)
> -		clk_core_rate_protect(core);
> -
>  	return 0;
>  }
>  
> @@ -716,6 +705,9 @@ static void clk_core_disable(struct clk_core *core)
>  	if (WARN_ON(core->enable_count == 1 && core->flags &
> CLK_IS_CRITICAL))
>  		return;
>  
> +	if (core->flags & CLK_SET_RATE_GATE)
> +		clk_core_rate_unprotect(core);
> +
>  	if (--core->enable_count > 0)
>  		return;
>  
> @@ -791,6 +783,15 @@ static int clk_core_enable(struct clk_core *core)
>  	}
>  
>  	core->enable_count++;
> +
> +	/*
> +	 * CLK_SET_RATE_GATE is a special case of clock protection
> +	 * Instead of a consumer protection, the provider is protecting
> +	 * itself when enabled
> +	 */
> +	if (core->flags & CLK_SET_RATE_GATE)
> +		clk_core_rate_protect(core);
> +
>  	return 0;
>  }
>  
