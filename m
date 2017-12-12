Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 12 Dec 2017 12:02:00 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] clk: tegra20: Add 216 MHz entry for PLL_X
Message-ID: <20171212100200.GW32106@tbergstrom-lnx.Nvidia.com>
References: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 11, 2017 at 09:50:09PM +0300, Dmitry Osipenko wrote:
> The cpufreq driver uses 216 MHz as the lowest CPU clock frequency, but
> clock driver doesn't provide that rate, so the requested clock is rounded
> up to 312 MHz. Let's add entry for 216 MHz to match with cpufreq.
> 

This seems odd. If there's no table entry, _calc_rate should kick in and
calculate the parameters for 216MHz. Any idea why this is not happening?

Peter.

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index cbd5a2e5c569..e33d7548a4e9 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -269,6 +269,11 @@ static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
>  	{ 13000000,  312000000,  312, 13, 1, 12 },
>  	{ 19200000,  312000000,  260, 16, 1,  8 },
>  	{ 26000000,  312000000,  312, 26, 1, 12 },
> +	/* 216 MHz */
> +	{ 12000000, 216000000,  216,  12, 1, 12 },
> +	{ 13000000, 216000000,  216,  13, 1, 12 },
> +	{ 19200000, 216000000,  180,  16, 1,  8 },
> +	{ 26000000, 216000000,  216,  26, 1, 12 },
>  	{        0,          0,    0,  0, 0,  0 },
>  };
>  
> -- 
> 2.15.1
> 
