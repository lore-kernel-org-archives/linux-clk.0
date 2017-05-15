Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:42639 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758960AbdEOFzD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2017 01:55:03 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 14 May 2017 22:54:23 -0700
From: Stefan Agner <stefan@agner.ch>
To: Fabio Estevam <festevam@gmail.com>
Cc: sboyd@codeaurora.org, shawnguo@kernel.org, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH] clk: imx7d: Fix the powerdown bit location of PLL DDR
In-Reply-To: <1494791940-12499-1-git-send-email-festevam@gmail.com>
References: <1494791940-12499-1-git-send-email-festevam@gmail.com>
Message-ID: <6350d43f82a6bea3867777de46082fb6@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2017-05-14 12:59, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> According to the MX7D Reference Manual the powerdown bit of
> CCM_ANALOG_PLL_DDRn register is bit 20, so fix it accordingly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/clk/imx/clk-imx7d.c | 2 +-
>  drivers/clk/imx/clk-pllv3.c | 5 +++++
>  drivers/clk/imx/clk.h       | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 93b0364..8fa1841 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -424,7 +424,7 @@ static void __init imx7d_clocks_init(struct
> device_node *ccm_node)
>  	clks[IMX7D_PLL_VIDEO_MAIN_SRC] = imx_clk_mux("pll_video_main_src",
> base + 0x130, 14, 2, pll_bypass_src_sel,
> ARRAY_SIZE(pll_bypass_src_sel));
>  
>  	clks[IMX7D_PLL_ARM_MAIN]  = imx_clk_pllv3(IMX_PLLV3_SYS,
> "pll_arm_main", "osc", base + 0x60, 0x7f);
> -	clks[IMX7D_PLL_DRAM_MAIN] = imx_clk_pllv3(IMX_PLLV3_AV,
> "pll_dram_main", "osc", base + 0x70, 0x7f);
> +	clks[IMX7D_PLL_DRAM_MAIN] = imx_clk_pllv3(IMX_PLLV3_DDR_IMX7,
> "pll_dram_main", "osc", base + 0x70, 0x7f);
>  	clks[IMX7D_PLL_SYS_MAIN]  = imx_clk_pllv3(IMX_PLLV3_GENERIC,
> "pll_sys_main", "osc", base + 0xb0, 0x1);
>  	clks[IMX7D_PLL_ENET_MAIN] = imx_clk_pllv3(IMX_PLLV3_ENET_IMX7,
> "pll_enet_main", "osc", base + 0xe0, 0x0);
>  	clks[IMX7D_PLL_AUDIO_MAIN] = imx_clk_pllv3(IMX_PLLV3_AV,
> "pll_audio_main", "osc", base + 0xf0, 0x7f);
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index f109916..fec64b6 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -25,6 +25,7 @@
>  #define PLL_VF610_DENOM_OFFSET	0x30
>  
>  #define BM_PLL_POWER		(0x1 << 12)
> +#define BM_PLL_POWER_IMX7	(0x1 << 20)

BM_PLL_POWER_IMX7_DDR?

The other PLL on i.MX 7 still have it at 12...

Otherwise looks good to me!

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan


>  #define BM_PLL_LOCK		(0x1 << 31)
>  #define IMX7_ENET_PLL_POWER	(0x1 << 5)
>  
> @@ -451,6 +452,10 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type
> type, const char *name,
>  		pll->ref_clock = 500000000;
>  		ops = &clk_pllv3_enet_ops;
>  		break;
> +	case IMX_PLLV3_DDR_IMX7:
> +		ops = &clk_pllv3_av_ops;
> +		pll->power_bit = BM_PLL_POWER_IMX7;
> +		break;
>  	default:
>  		ops = &clk_pllv3_ops;
>  	}
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index e1f5e42..d54f072 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -35,6 +35,7 @@ enum imx_pllv3_type {
>  	IMX_PLLV3_ENET,
>  	IMX_PLLV3_ENET_IMX7,
>  	IMX_PLLV3_SYS_VF610,
> +	IMX_PLLV3_DDR_IMX7,
>  };
>  
>  struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
