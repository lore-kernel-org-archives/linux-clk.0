Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8169 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbcFWM0g (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2016 08:26:36 -0400
Subject: Re: [PATCH 2/2] clk: tegra: Micro-optimize Tegra210 clock setup
To: Thierry Reding <thierry.reding@gmail.com>
References: <20160623105231.24383-1-thierry.reding@gmail.com>
 <20160623105231.24383-2-thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Rhyland Klein <rklein@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <576BD575.8010808@nvidia.com>
Date: Thu, 23 Jun 2016 13:26:29 +0100
MIME-Version: 1.0
In-Reply-To: <20160623105231.24383-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 23/06/16 11:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> sor_safe being the parent of the dpaux and dpaux1 clocks, it's not only
> natural, but also slightly more efficient, to initialize it before its
> children. This avoids orphaning the dpaux and dpaux1 clocks only to get
> them reparented when the sor_safe clock is registered.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index fe295b4102ca..b4df5c46642f 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2466,6 +2466,10 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  					1, 2);
>  	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
>  
> +	clk = tegra_clk_register_periph_fixed("sor_safe", "pll_p", 0, clk_base,
> +					      1, 17, 222);
> +	clks[TEGRA210_CLK_SOR_SAFE] = clk;
> +
>  	clk = tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_base,
>  					      1, 17, 181);
>  	clks[TEGRA210_CLK_DPAUX] = clk;
> @@ -2474,10 +2478,6 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  					      1, 17, 207);
>  	clks[TEGRA210_CLK_DPAUX1] = clk;
>  
> -	clk = tegra_clk_register_periph_fixed("sor_safe", "pll_p", 0, clk_base,
> -					      1, 17, 222);
> -	clks[TEGRA210_CLK_SOR_SAFE] = clk;
> -
>  	/* pll_d_dsi_out */
>  	clk = clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
>  				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
