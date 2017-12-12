Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 12 Dec 2017 12:15:36 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] clk: tegra20: Correct PLL_C_OUT1 setup
Message-ID: <20171212101536.GY32106@tbergstrom-lnx.Nvidia.com>
References: <09480d74d240d8e77b3989cfe85e6e624eaee866.1513018140.git.digetx@gmail.com>
 <4c15ac578fd847bc4047384ae2f8cadd6b9e9fe4.1513018140.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <4c15ac578fd847bc4047384ae2f8cadd6b9e9fe4.1513018140.git.digetx@gmail.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 11, 2017 at 09:50:12PM +0300, Dmitry Osipenko wrote:
> PLL_C_OUT_1 can't produce 216 MHz defined in the init_table. Let's
> set it to 240 MHz and explicitly specify HCLK rate for consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index 32763dfbfaba..c39e7e2446d8 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1026,9 +1026,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 0 },
>  	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 0 },
>  	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
> -	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
> -	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 0 },
> -	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 0 },
> +	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
> +	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 240000000, 0 },
> +	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
>  	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
>  	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
> -- 
> 2.15.1
> 
