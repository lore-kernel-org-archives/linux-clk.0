Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 15:14:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: check the actual phase if get_phase is provided
Message-ID: <20160225231458.GH28849@codeaurora.org>
References: <1455759499-9622-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455759499-9622-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/18, Shawn Lin wrote:
> set_phase does sanity checking of degree and ask sub-driver
> to set the degree. If set_phase is limited to support the
> degree what the caller need, sub-driver may select a
> approximate value and return success state. In this case, it's
> inappropriate to assign the degree directly to clk->core->phase.
> We should ask sub-driver to decide the strategy. If sub-driver just
> want to support accurate degree, it can fail the set_phase. Otherwise,
> store the actual degree provided by sub-driver into clk->core->phase
> if get_phase is provided. Another improvemnt by this patch is that
> we can avoid to do unnecessary set_phase if the request defrees is
> already there.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> ---

Knee jerk reaction is why does the provider code set a phase that
isn't requested? Do we need some sort of clk_round_phase() API
that parallels clk_round_rate() so that drivers know what phase
they're going to get? Or do drivers not care what phase they get
when they call clk_set_phase()?

> 
> Changes in v2:
> - remove actual_degree to simplify the changes
> - bail early if nothing to to
> 
>  drivers/clk/clk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b4db67a..275e70f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1902,6 +1902,10 @@ int clk_set_phase(struct clk *clk, int degrees)
>  
>  	clk_prepare_lock();
>  
> +	/* bail early if nothing to do */
> +	if (degrees == clk->core->phase)
> +		goto out;
> +

This could be split out into a different "optimization" patch and
applied today.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
