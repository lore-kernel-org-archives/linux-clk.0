Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sn1nam02on0045.outbound.protection.outlook.com ([104.47.36.45]:58080
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751281AbdFFPcb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Jun 2017 11:32:31 -0400
Message-ID: <1496763146.28352.39.camel@nxp.com>
Subject: Re: [PATCH v2] clk: imx7d: Fix the powerdown bit location of PLL DDR
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, <sboyd@codeaurora.org>
CC: <shawnguo@kernel.org>, <kernel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <stefan@agner.ch>,
        Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 6 Jun 2017 18:32:26 +0300
In-Reply-To: <1494849305-1405-1-git-send-email-festevam@gmail.com>
References: <1494849305-1405-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-05-15 at 08:55 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> According to the MX7D Reference Manual the powerdown bit of
> CCM_ANALOG_PLL_DDRn register is bit 20, so fix it accordingly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
> ---
> Changes since v1:
> - Rename to IMX7_DDR_PLL_POWER to make it consistent with the other
> special case for the powerdown bit (IMX7_ENET_PLL_POWER) - Stefan
> 
>  drivers/clk/imx/clk-imx7d.c | 2 +-
>  drivers/clk/imx/clk-pllv3.c | 5 +++++
>  drivers/clk/imx/clk.h       | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 93b0364..8fa1841 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -424,7 +424,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
>  	clks[IMX7D_PLL_VIDEO_MAIN_SRC] = imx_clk_mux("pll_video_main_src", base + 0x130, 14, 2, pll_bypass_src_sel, ARRAY_SIZE(pll_bypass_src_sel));
>  
>  	clks[IMX7D_PLL_ARM_MAIN]  = imx_clk_pllv3(IMX_PLLV3_SYS, "pll_arm_main", "osc", base + 0x60, 0x7f);
> -	clks[IMX7D_PLL_DRAM_MAIN] = imx_clk_pllv3(IMX_PLLV3_AV, "pll_dram_main", "osc", base + 0x70, 0x7f);
> +	clks[IMX7D_PLL_DRAM_MAIN] = imx_clk_pllv3(IMX_PLLV3_DDR_IMX7, "pll_dram_main", "osc", base + 0x70, 0x7f);
>  	clks[IMX7D_PLL_SYS_MAIN]  = imx_clk_pllv3(IMX_PLLV3_GENERIC, "pll_sys_main", "osc", base + 0xb0, 0x1);
>  	clks[IMX7D_PLL_ENET_MAIN] = imx_clk_pllv3(IMX_PLLV3_ENET_IMX7, "pll_enet_main", "osc", base + 0xe0, 0x0);
>  	clks[IMX7D_PLL_AUDIO_MAIN] = imx_clk_pllv3(IMX_PLLV3_AV, "pll_audio_main", "osc", base + 0xf0, 0x7f);
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index f109916..0039b16 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -27,6 +27,7 @@
>  #define BM_PLL_POWER		(0x1 << 12)
>  #define BM_PLL_LOCK		(0x1 << 31)
>  #define IMX7_ENET_PLL_POWER	(0x1 << 5)
> +#define IMX7_DDR_PLL_POWER	(0x1 << 20)
>  
>  /**
>   * struct clk_pllv3 - IMX PLL clock version 3
> @@ -451,6 +452,10 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
>  		pll->ref_clock = 500000000;
>  		ops = &clk_pllv3_enet_ops;
>  		break;
> +	case IMX_PLLV3_DDR_IMX7:
> +		pll->power_bit = IMX7_ENET_PLL_POWER;
> +		ops = &clk_pllv3_av_ops;
> +		break;

Maybe you mean IMX7_DDR_PLL_POWER here?

This patch made it way into next-20170606 and broke boot on imx7d-sdb.
There is no console output but bisection points to this patch.

Changing power_bit to IMX7_DDR_PLL_POWER seems to make it work.

--
Regards,
Leonard
