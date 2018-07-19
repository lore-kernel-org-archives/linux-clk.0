Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9367 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731663AbeGSQIr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jul 2018 12:08:47 -0400
Subject: Re: [PATCH] clk: tegra: Fixes for MBIST work around
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC: Joseph Lo <josephl@nvidia.com>
References: <1532010323-28534-1-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <68ef3adc-01da-173a-4e6d-f1edb0d2eb0b@nvidia.com>
Date: Thu, 19 Jul 2018 16:25:03 +0100
MIME-Version: 1.0
In-Reply-To: <1532010323-28534-1-git-send-email-pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 19/07/18 15:25, Peter De Schrijver wrote:
> From: Joseph Lo <josephl@nvidia.com>
> 
> Fix some incorrect data in LVL2 offset and bit mask.

Fixes tag?
 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index d92f1d7..e71a9ce 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2603,7 +2603,7 @@ struct utmi_clk_param {
>  	[TEGRA_POWERGATE_MPE] = {
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
>  		.lvl2_offset = LVL2_CLK_GATE_OVRE,
> -		.lvl2_mask = BIT(2),
> +		.lvl2_mask = BIT(29),
>  	},
>  	[TEGRA_POWERGATE_SOR] = {
>  		.handle_lvl2_ovr = tegra210_generic_mbist_war,
> @@ -2654,14 +2654,14 @@ struct utmi_clk_param {
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

Otherwise looks good to me. 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
