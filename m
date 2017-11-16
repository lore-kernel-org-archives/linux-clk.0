Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
Date: Thu, 16 Nov 2017 10:35:37 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	hermit.wangheming@hisilicon.com, project-aspen-dev@linaro.org,
	tianshuliang <tianshuliang@hisilicon.com>
Subject: Re: [PATCH 2/3] clk: hisilicon: add emmc sample and drive clock for
 hi3798cv200 SoC
Message-ID: <20171116023533.GJ11163@dragon>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
 <1508324429-6012-3-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1508324429-6012-3-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 18, 2017 at 07:00:28AM -0400, Jiancheng Xue wrote:
> From: tianshuliang <tianshuliang@hisilicon.com>
> 
> Add emmc sample and emmc drive clock for Hi3798cv200 SoC
> 
> Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---
>  drivers/clk/hisilicon/crg-hi3798cv200.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
> index ed8bb5f..25d750c 100644
> --- a/drivers/clk/hisilicon/crg-hi3798cv200.c
> +++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
> @@ -83,6 +83,18 @@ static struct hisi_mux_clock hi3798cv200_mux_clks[] = {
>  		CLK_SET_RATE_PARENT, 0x188, 10, 2, 0, comphy1_mux_table, },
>  };
>  
> +static u32 mmc_phase_reg[] = {0, 1, 2, 3, 4, 5, 6, 7};
> +static u32 mmc_phase_val[] = {0, 45, 90, 135, 180, 225, 270, 315};
> +
> +static struct hisi_phase_clock hi3798cv200_phase_clks[] = {
> +	{ HISTB_MMC_SAMPLE_CLK, "mmc_sample", "clk_mmc_ciu",
> +	CLK_SET_RATE_PARENT, 0xa0, 12, 3, mmc_phase_val,
> +	mmc_phase_reg, ARRAY_SIZE(mmc_phase_reg)},
> +	{ HISTB_MMC_DRV_CLK, "mmc_drive", "clk_mmc_ciu",
> +	CLK_SET_RATE_PARENT, 0xa0, 16, 3, mmc_phase_val,
> +	mmc_phase_reg, ARRAY_SIZE(mmc_phase_reg)},

Can we align the indentation with other clock types, like the following?

	{ HISTB_MMC_SAMPLE_CLK, "mmc_sample", "clk_mmc_ciu",
		CLK_SET_RATE_PARENT, 0xa0, 12, 3, mmc_phase_val,
		mmc_phase_reg, ARRAY_SIZE(mmc_phase_reg) },

Also we have a space after '{' and please do the same before '}'.

Shawn

> +};
> +
>  static const struct hisi_gate_clock hi3798cv200_gate_clks[] = {
>  	/* UART */
>  	{ HISTB_UART2_CLK, "clk_uart2", "75m",
> @@ -179,11 +191,18 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
>  	if (ret)
>  		goto unregister_fixed_rate;
>  
> +	ret = hisi_clk_register_phase(&pdev->dev,
> +				hi3798cv200_phase_clks,
> +				ARRAY_SIZE(hi3798cv200_phase_clks),
> +				clk_data);
> +	if (ret)
> +		goto unregister_mux;
> +
>  	ret = hisi_clk_register_gate(hi3798cv200_gate_clks,
>  				ARRAY_SIZE(hi3798cv200_gate_clks),
>  				clk_data);
>  	if (ret)
> -		goto unregister_mux;
> +		goto unregister_phase;
>  
>  	ret = of_clk_add_provider(pdev->dev.of_node,
>  			of_clk_src_onecell_get, &clk_data->clk_data);
> @@ -201,6 +220,10 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
>  	hisi_clk_unregister_mux(hi3798cv200_mux_clks,
>  				ARRAY_SIZE(hi3798cv200_mux_clks),
>  				clk_data);
> +unregister_phase:
> +	hisi_clk_unregister_phase(hi3798cv200_phase_clks,
> +				ARRAY_SIZE(hi3798cv200_phase_clks),
> +				clk_data);
>  unregister_gate:
>  	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
>  				ARRAY_SIZE(hi3798cv200_gate_clks),
> -- 
> 2.7.4
> 
