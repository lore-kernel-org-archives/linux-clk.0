Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 12 Dec 2017 12:18:16 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] clk: tegra: Specify VDE clock rate
Message-ID: <20171212101816.GZ32106@tbergstrom-lnx.Nvidia.com>
References: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
 <41813e7cda9ade75637d6c25b0a1b004462058f4.1513018131.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <41813e7cda9ade75637d6c25b0a1b004462058f4.1513018131.git.digetx@gmail.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 11, 2017 at 09:50:11PM +0300, Dmitry Osipenko wrote:
> Currently VDE clock rate is determined by clock config left from
> bootloader, let's not rely on it and explicitly specify the clock
> rate in the CCF driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
>  drivers/clk/tegra/clk-tegra114.c | 1 +
>  drivers/clk/tegra/clk-tegra124.c | 2 +-
>  drivers/clk/tegra/clk-tegra20.c  | 1 +
>  drivers/clk/tegra/clk-tegra30.c  | 1 +
>  4 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index f39e09d1bdba..3523852accd8 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1189,6 +1189,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA114_CLK_XUSB_HS_SRC, TEGRA114_CLK_XUSB_SS_DIV2, 61200000, 0 },
>  	{ TEGRA114_CLK_XUSB_FALCON_SRC, TEGRA114_CLK_PLL_P, 204000000, 0 },
>  	{ TEGRA114_CLK_XUSB_HOST_SRC, TEGRA114_CLK_PLL_P, 102000000, 0 },
> +	{ TEGRA114_CLK_VDE, TEGRA114_CLK_CLK_MAX, 600000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA114_CLK_CLK_MAX, TEGRA114_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> index c802fbcbc5fa..dda7c2163521 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1268,7 +1268,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
>  	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
> -	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_P, 0, 0 },
> +	{ TEGRA124_CLK_VDE, TEGRA124_CLK_CLK_MAX, 600000000, 0 },
>  	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
>  	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
>  	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index c39e7e2446d8..66d9a2c91b9c 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1056,6 +1056,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA20_CLK_DISP2, TEGRA20_CLK_PLL_P, 600000000, 0 },
>  	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> +	{ TEGRA20_CLK_VDE, TEGRA20_CLK_CLK_MAX, 300000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index 54d2c3436a31..aa47617850a6 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1269,6 +1269,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
> +	{ TEGRA30_CLK_VDE, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>  };
> -- 
> 2.15.1
> 
