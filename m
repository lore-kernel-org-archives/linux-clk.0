Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1520502187.4264.5.camel@baylibre.com>
Subject: Re: [PATCH] clk: fix phase reported being zero
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 08 Mar 2018 10:43:07 +0100
In-Reply-To: <20180215101958.22676-1-jbrunet@baylibre.com>
References: <20180215101958.22676-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2018-02-15 at 11:19 +0100, Jerome Brunet wrote:
> While introducing clk_core_set_phase_nolock, assigning core->phase was
> mistakenly removed. Fixing this now
> 
> Fixes: 9e4d04adeb1a ("clk: add clk_core_set_phase_nolock function")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Please drop this patch if favor of 

https://lkml.kernel.org/r/1520491781-132529-1-git-send-email-shawn.lin@rock-chip
s.com

Thanks
Jerome

> ---
>  drivers/clk/clk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9d56be6ead39..b33d362239e7 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2314,6 +2314,9 @@ static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
>  	if (core->ops->set_phase)
>  		ret = core->ops->set_phase(core->hw, degrees);
>  
> +	if (!ret)
> +		core->phase = degrees;
> +
>  	trace_clk_set_phase_complete(core, degrees);
>  
>  	return ret;
