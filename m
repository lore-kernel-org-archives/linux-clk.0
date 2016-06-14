Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19707 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbcFNPgH (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jun 2016 11:36:07 -0400
Subject: Re: [PATCH 1/3] clk: tegra: Disable spread spectrum on pll_d2
To: Thierry Reding <thierry.reding@gmail.com>
References: <20160614120044.30734-1-thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <8588e7dd-b569-b900-44c9-327fff3d203f@nvidia.com>
Date: Tue, 14 Jun 2016 11:35:56 -0400
MIME-Version: 1.0
In-Reply-To: <20160614120044.30734-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 6/14/2016 8:00 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Enabling spread spectrum on pll_d2 can lead to issues with display
> modes. HDMI monitors, for example, would report "Signal Error" and
> some modes driven over DisplayPort would generate fuzzy horizontal
> bands.
> 
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
> 

Acked-by: Rhyland Klein <rklein@nvidia.com>

-- 
nvpublic
