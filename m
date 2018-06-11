Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Make vde a child of pll_c3
Date: Mon, 11 Jun 2018 17:17:31 +0300
Message-ID: <5479310.ZEnOGiWBp7@dimapc>
In-Reply-To: <20180611082037.31796-1-thierry.reding@gmail.com>
References: <20180611082037.31796-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, 11 June 2018 11:20:37 MSK Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The current default is to leave the VDE clock's parent at the default,
> which is clk_m. However, that is not a configuration that will allow the
> VDE to function. Reparent it to pll_c3 instead to make sure the hardware
> can actually decode video content.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124.c
> b/drivers/clk/tegra/clk-tegra124.c index f5048f82c0b9..b6cf28ca2ed2 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1267,7 +1267,7 @@ static struct tegra_clk_init_table common_init_table[]
> __initdata = { { TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
> -	{ TEGRA124_CLK_VDE, TEGRA124_CLK_CLK_MAX, 600000000, 0 },
> +	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_C3, 600000000, 0 },
>  	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
>  	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
>  	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },

If clk_m isn't a valid configuration, why VDE could select it? At least TRM 
lists clk_m as a valid source and clk_m is running on a safe 120 MHz, VDE HW 
should work fine. Sounds like a clock driver bug to me.

Seems VDE clock on should be ~366 MHz according to the T40/T124 TRM. See 
"5.3.8 PLLC, PLLC2, PLLC3, and PLLC4" of the T124 TRM.

Would be nice if you could adjust the VDE clock rate / parent-clock on all 
Tegra's, i.e. explicitly set the parent clock and the rate to 300-400 MHz.
