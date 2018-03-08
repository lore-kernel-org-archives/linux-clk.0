Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1520502097.4264.3.camel@baylibre.com>
Subject: Re: [PATCH] clk: update cached phase to respect the fact when
 setting phase
From: Jerome Brunet <jbrunet@baylibre.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Stable <stable@vger.kernel.org>
Date: Thu, 08 Mar 2018 10:41:37 +0100
In-Reply-To: <1520491781-132529-1-git-send-email-shawn.lin@rock-chips.com>
References: <1520491781-132529-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2018-03-08 at 14:49 +0800, Shawn Lin wrote:
> It's found that the final phase set by driver doesn't match that of
> the output from clk_summary:
> 
> dwmmc_rockchip fe310000.dwmmc: Successfully tuned phase to 346
> mmc0: new ultra high speed SDR104 SDIO card at address 0001
> 
> cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
> sdio_sample	0        1        0    50000000 0 0
> 
> It seems the cached core->phase isn't updated after the clk was
> registered. So fix this issue by updating the core->phase if setting
> phase successfully.
> 
> Fixes: 9e4d04adeb1a ("clk: add clk_core_set_phase_nolock function")
> Cc: Stable <stable@vger.kernel.org>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Good catch Shawn.
Actually, I have had already sent a fix for this issue

https://patchwork.kernel.org/patch/10220811/

But I think yours is better as it updates the phase only if the phase has
actually been set

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> 
>  drivers/clk/clk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0f686a9..617e562 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2309,8 +2309,11 @@ static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
>  
>  	trace_clk_set_phase(core, degrees);
>  
> -	if (core->ops->set_phase)
> +	if (core->ops->set_phase) {
>  		ret = core->ops->set_phase(core->hw, degrees);
> +		if (!ret)
> +			core->phase = degrees;
> +	}
>  
>  	trace_clk_set_phase_complete(core, degrees);
>  
