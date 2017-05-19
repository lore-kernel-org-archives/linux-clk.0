Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 May 2017 17:13:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
	linus.walleij@linaro.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/pl111: Register the clock divider and use it.
Message-ID: <20170519001328.GA20170@codeaurora.org>
References: <20170508193348.30236-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170508193348.30236-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 05/08, Eric Anholt wrote:
> This is required for the panel to work on bcm911360, where CLCDCLK is
> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
> CLCDCLK, for platforms that have a settable rate on that one.
> 
> v2: Set SET_RATE_PARENT (caught by Linus Walleij), depend on
>     COMMON_CLK.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

One minor comment below

> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 39a5c33bce7d..2d924a6bf43c 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -288,6 +296,126 @@ const struct drm_simple_display_pipe_funcs pl111_display_funcs = {
[...]
> +
> +	return 0;
> +}
> +
> +const struct clk_ops pl111_clk_div_ops = {

static?

> +	.recalc_rate = pl111_clk_div_recalc_rate,
> +	.round_rate = pl111_clk_div_round_rate,
> +	.set_rate = pl111_clk_div_set_rate,
> +};
> +
> +static int

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
