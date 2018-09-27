Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11295 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeI0Ojp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 10:39:45 -0400
Date: Thu, 27 Sep 2018 11:22:35 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Joseph Lo <josephl@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH V2] clk: tegra: Fixes for MBIST work around
Message-ID: <20180927082235.GO7636@tbergstrom-lnx.Nvidia.com>
References: <20180927023203.9218-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20180927023203.9218-1-josephl@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 27, 2018 at 10:32:03AM +0800, Joseph Lo wrote:
> Fix some incorrect data in LVL2 offset and bit mask.
> 
> Fixes: e403d0057343 ("clk: tegra: MBIST work around for Tegra210")
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
> V2:
> Add "Fixes" tag.
> ---
>  drivers/clk/tegra/clk-tegra210.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 9eb1cb14fce1..290f7cb6a051 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2603,7 +2603,7 @@ static struct tegra210_domain_mbist_war tegra210_pg_mbist_war[] = {
>  	[TEGRA_POWERGATE_MPE] = {
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
>  		.lvl2_offset = LVL2_CLK_GATE_OVRE,
> -		.lvl2_mask = BIT(2),
> +		.lvl2_mask = BIT(29),
>  	},
>  	[TEGRA_POWERGATE_SOR] = {
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> @@ -2654,14 +2654,14 @@ static struct tegra210_domain_mbist_war tegra210_pg_mbist_war[] = {
>  		.num_clks = ARRAY_SIZE(nvdec_slcg_clkids),
>  		.clk_init_data = nvdec_slcg_clkids,
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> -		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> +		.lvl2_offset = LVL2_CLK_GATE_OVRE,
>  		.lvl2_mask = BIT(9) | BIT(31),
>  	},
>  	[TEGRA_POWERGATE_NVJPG] = {
>  		.num_clks = ARRAY_SIZE(nvjpg_slcg_clkids),
>  		.clk_init_data = nvjpg_slcg_clkids,
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> -		.lvl2_offset = LVL2_CLK_GATE_OVRC,
> +		.lvl2_offset = LVL2_CLK_GATE_OVRE,
>  		.lvl2_mask = BIT(9) | BIT(31),
>  	},
>  	[TEGRA_POWERGATE_AUD] = {
> -- 
> 2.19.0
> 
