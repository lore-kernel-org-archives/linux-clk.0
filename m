Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17364 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbcFNPhT (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2016 11:37:19 -0400
Subject: Re: [PATCH 3/3] clk: tegra: Enable sor1 and sor1_src on Tegra210
To: Thierry Reding <thierry.reding@gmail.com>
References: <20160614120044.30734-1-thierry.reding@gmail.com>
 <20160614120044.30734-3-thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <a9bdfd66-5571-287f-3928-6cbe6967a0a6@nvidia.com>
Date: Tue, 14 Jun 2016 11:37:10 -0400
MIME-Version: 1.0
In-Reply-To: <20160614120044.30734-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 6/14/2016 8:00 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Make the sor1 and sor1_src clocks available on Tegra210. They will be
> used by the display driver to support HDMI and DP.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 2 ++
>  include/dt-bindings/clock/tegra210-car.h | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index cd141a364c9d..8e37eda37449 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2093,6 +2093,8 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
>  	[tegra_clk_dpaux1] = { .dt_id = TEGRA210_CLK_DPAUX1, .present = true },
>  	[tegra_clk_sor0] = { .dt_id = TEGRA210_CLK_SOR0, .present = true },
>  	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA210_CLK_SOR0_LVDS, .present = true },
> +	[tegra_clk_sor1] = { .dt_id = TEGRA210_CLK_SOR1, .present = true },
> +	[tegra_clk_sor1_src] = { .dt_id = TEGRA210_CLK_SOR1_SRC, .present = true },
>  	[tegra_clk_gpu] = { .dt_id = TEGRA210_CLK_GPU, .present = true },
>  	[tegra_clk_pll_g_ref] = { .dt_id = TEGRA210_CLK_PLL_G_REF, .present = true, },
>  	[tegra_clk_uartb_8] = { .dt_id = TEGRA210_CLK_UARTB, .present = true },
> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
> index bd3530e56d46..35288b20f2c9 100644
> --- a/include/dt-bindings/clock/tegra210-car.h
> +++ b/include/dt-bindings/clock/tegra210-car.h
> @@ -308,7 +308,7 @@
>  #define TEGRA210_CLK_CLK_OUT_3 279
>  #define TEGRA210_CLK_BLINK 280
>  /* 281 */
> -/* 282 */
> +#define TEGRA210_CLK_SOR1_SRC 282
>  /* 283 */
>  #define TEGRA210_CLK_XUSB_HOST_SRC 284
>  #define TEGRA210_CLK_XUSB_FALCON_SRC 285
> 

Acked-by: Rhyland Klein <rklein@nvidia.com>

-- 
nvpublic
