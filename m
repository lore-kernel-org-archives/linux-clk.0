Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5171 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbcFWP1Q (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2016 11:27:16 -0400
Subject: Re: [PATCH 1/2] clk: tegra: Make sor_safe the parent of dpaux and
 dpaux1
To: Thierry Reding <thierry.reding@gmail.com>
References: <20160623105231.24383-1-thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <dac57911-c93d-06dd-99b4-71133c230be7@nvidia.com>
Date: Thu, 23 Jun 2016 11:27:07 -0400
MIME-Version: 1.0
In-Reply-To: <20160623105231.24383-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 6/23/2016 6:52 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> It turns out that sor_safe, rather than pll_p, is the parent of the
> dpaux and dpaux1 clocks.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index aab32af77aa2..fe295b4102ca 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2466,11 +2466,11 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  					1, 2);
>  	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
>  
> -	clk = tegra_clk_register_periph_fixed("dpaux", "pll_p", 0, clk_base,
> +	clk = tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_base,
>  					      1, 17, 181);
>  	clks[TEGRA210_CLK_DPAUX] = clk;
>  
> -	clk = tegra_clk_register_periph_fixed("dpaux1", "pll_p", 0, clk_base,
> +	clk = tegra_clk_register_periph_fixed("dpaux1", "sor_safe", 0, clk_base,
>  					      1, 17, 207);
>  	clks[TEGRA210_CLK_DPAUX1] = clk;
>  
> 

Acked-by: Rhyland Klein <rklein@nvidia.com>

-- 
nvpublic
