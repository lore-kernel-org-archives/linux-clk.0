Return-Path: <dev@lynxeye.de>
Message-ID: <1461262614.2494.1.camel@lynxeye.de>
Subject: Re: [PATCH 1/2] clk: tegra30: init PLL_C to sane rate
From: Lucas Stach <dev@lynxeye.de>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	 <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry
 Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Date: Thu, 21 Apr 2016 20:16:54 +0200
In-Reply-To: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
References: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Montag, den 29.02.2016, 21:46 +0100 schrieb Lucas Stach:
> If the bootloader does not touch PLL_C it will stay in its reset
> state, failing to lock when enabled. This leads to consumers of
> this clock to fail probing. Fix this by always programming the
> PLL with a sane rate, which allows it to lock, at startup.
> 
Those 2 patches haven't been applied, as far as I can see. Any comments
on them?

> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-
> tegra30.c
> index 0478565..236e2db 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1372,6 +1372,7 @@ static struct tegra_clk_init_table init_table[]
> __initdata = {
>  	{ TEGRA30_CLK_SBC4, TEGRA30_CLK_PLL_P, 100000000, 0 },
>  	{ TEGRA30_CLK_SBC5, TEGRA30_CLK_PLL_P, 100000000, 0 },
>  	{ TEGRA30_CLK_SBC6, TEGRA30_CLK_PLL_P, 100000000, 0 },
> +	{ TEGRA30_CLK_PLL_C, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
>  	{ TEGRA30_CLK_HOST1X, TEGRA30_CLK_PLL_C, 150000000, 0 },
>  	{ TEGRA30_CLK_DISP1, TEGRA30_CLK_PLL_P, 600000000, 0 },
>  	{ TEGRA30_CLK_DISP2, TEGRA30_CLK_PLL_P, 600000000, 0 },
