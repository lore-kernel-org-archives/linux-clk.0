Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Jul 2017 19:02:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 07/10] clk: rollback set_rate_range changes on failure
Message-ID: <20170712020233.GV22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-8-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170612194438.12298-8-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/12, Jerome Brunet wrote:
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

There should be some commit text here describing the problem.
Also a Fixes: tag and please put this earlier in the series.

> ---
>  drivers/clk/clk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d91236e70a04..253f1d3f0971 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1864,6 +1864,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate_protect);
>  int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>  {
>  	int ret = 0;
> +	unsigned int old_min, old_max;
>  
>  	if (!clk)
>  		return 0;
> @@ -1881,9 +1882,16 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>  		clk_core_rate_unprotect(clk->core);
>  
>  	if (min != clk->min_rate || max != clk->max_rate) {
> +		old_min = clk->min_rate;
> +		old_max = clk->max_rate;
>  		clk->min_rate = min;
>  		clk->max_rate = max;
>  		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
> +		if (ret) {
> +			/* undo changes */
> +			clk->min_rate = old_min;
> +			clk->max_rate = old_max;
> +		}
>  	}
>  
>  	if (clk->protect_count)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
