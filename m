Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15079 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbcFNO6E (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2016 10:58:04 -0400
Date: Tue, 14 Jun 2016 17:57:56 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Alexandre Courbot <gnurou@gmail.com>,
	Rhyland Klein <rklein@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: tegra: Disable spread spectrum on pll_d2
Message-ID: <20160614145756.GE12863@tbergstrom-lnx.Nvidia.com>
References: <20160614120044.30734-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20160614120044.30734-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 14, 2016 at 02:00:42PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Enabling spread spectrum on pll_d2 can lead to issues with display
> modes. HDMI monitors, for example, would report "Signal Error" and
> some modes driven over DisplayPort would generate fuzzy horizontal
> bands.
> 

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>

The only display clock we should enable spread spectrum for, is pll_dp.
AFAIK the DP spec specifies the amount of spread which can be tolerated.

Peter.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 6bd1235d09b1..cd141a364c9d 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -1914,8 +1914,9 @@ static struct tegra_clk_pll_params pll_d2_params = {
>  	.sdm_din_mask = PLLA_SDM_DIN_MASK,
>  	.sdm_ctrl_reg = PLLD2_MISC1,
>  	.sdm_ctrl_en_mask = PLLD2_SDM_EN_MASK,
> -	.ssc_ctrl_reg = PLLD2_MISC1,
> -	.ssc_ctrl_en_mask = PLLD2_SSC_EN_MASK,
> +	/* disable spread-spectrum for pll_d2 */
> +	.ssc_ctrl_reg = 0,
> +	.ssc_ctrl_en_mask = 0,
>  	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
>  	.pdiv_tohw = pll_qlin_pdiv_to_hw,
>  	.div_nmp = &pllss_nmp,
> -- 
> 2.8.3
> 
