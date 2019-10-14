Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15274C4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 13:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D824F21A49
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571058513;
	bh=h6rziWwo7iOTHA7xwgtBI1rft22mR5Qb12OeTENjx58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aiz1Iq3KIbkZJm9XgXqbIc/01UwfgNBt5PJ8nFKNmSVXiQ/8vdHhaqQYhEnDIaX1l
	 d3AQm4saROySr7FDvaiBO10S+ErmRMoiPHv/0X+MmXyaWxC7G4ghoralm+NLSixLs6
	 +v3oUMheFIS2799PgjIdus1X6RDAUUUEuufY8ngo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfJNNId (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:08:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbfJNNId (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Oct 2019 09:08:33 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2B90217D9;
        Mon, 14 Oct 2019 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571058512;
        bh=h6rziWwo7iOTHA7xwgtBI1rft22mR5Qb12OeTENjx58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gAxActGlQNHy8WXiGjxlWNyABj2KSH62ujfHtNUGiNQTyFM/Ospbo9b7UKtm7ia6V
         dcRxUA/tXZ4sEdC1sbFWNsCj41vf4ks8PWcx083rE9qS4C6lWAGX7YxnxPah1W+Gak
         ieGD+LwwuWTx7O6L3iBc8BvTu+NZGePiySe8e7Iw=
Date:   Mon, 14 Oct 2019 21:08:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: imx8mq: Define gates for pll1/2 fixed
 dividers
Message-ID: <20191014130809.GU12262@dragon>
References: <cover.1570461771.git.leonard.crestez@nxp.com>
 <e0fbd662171cfa00e0170a5cfb7d09016c7f70dc.1570461771.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0fbd662171cfa00e0170a5cfb7d09016c7f70dc.1570461771.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 07, 2019 at 06:24:53PM +0300, Leonard Crestez wrote:
> On imx8mq there are 9 fixed-factor dividers for SYS_PLL1 and SYS_PLL2
> each with their own gate but these gates are not currently defined in
> the clock tree.
> 
> Add them between sys1/2_pll_out and the fixed dividers.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

It conflicts with Laurentiu's patch "clk: imx8mq: Add VIDEO2_PLL clock".
Can you rebase your patch on top of my clk/imx branch please?

Shawn

> ---
>  drivers/clk/imx/clk-imx8mq.c             | 62 ++++++++++++++++--------
>  include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
>  2 files changed, 63 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 41fc9c63356e..2350d0d84c37 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -344,30 +344,52 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  
>  	clks[IMX8MQ_SYS1_PLL_OUT] = imx_clk_sccg_pll("sys1_pll_out", sys1_pll_out_sels, ARRAY_SIZE(sys1_pll_out_sels), 0, 0, 0, base + 0x30, CLK_IS_CRITICAL);
>  	clks[IMX8MQ_SYS2_PLL_OUT] = imx_clk_sccg_pll("sys2_pll_out", sys2_pll_out_sels, ARRAY_SIZE(sys2_pll_out_sels), 0, 0, 1, base + 0x3c, CLK_IS_CRITICAL);
>  	clks[IMX8MQ_SYS3_PLL_OUT] = imx_clk_sccg_pll("sys3_pll_out", sys3_pll_out_sels, ARRAY_SIZE(sys3_pll_out_sels), 0, 0, 1, base + 0x48, CLK_IS_CRITICAL);
>  	clks[IMX8MQ_DRAM_PLL_OUT] = imx_clk_sccg_pll("dram_pll_out", dram_pll_out_sels, ARRAY_SIZE(dram_pll_out_sels), 0, 0, 0, base + 0x60, CLK_IS_CRITICAL);
> -	/* SYS PLL fixed output */
> -	clks[IMX8MQ_SYS1_PLL_40M] = imx_clk_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
> -	clks[IMX8MQ_SYS1_PLL_80M] = imx_clk_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
> -	clks[IMX8MQ_SYS1_PLL_100M] = imx_clk_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
> -	clks[IMX8MQ_SYS1_PLL_133M] = imx_clk_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
> -	clks[IMX8MQ_SYS1_PLL_160M] = imx_clk_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
> -	clks[IMX8MQ_SYS1_PLL_200M] = imx_clk_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
> -	clks[IMX8MQ_SYS1_PLL_266M] = imx_clk_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
> -	clks[IMX8MQ_SYS1_PLL_400M] = imx_clk_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
> -	clks[IMX8MQ_SYS1_PLL_800M] = imx_clk_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
> -
> -	clks[IMX8MQ_SYS2_PLL_50M] = imx_clk_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
> -	clks[IMX8MQ_SYS2_PLL_100M] = imx_clk_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
> -	clks[IMX8MQ_SYS2_PLL_125M] = imx_clk_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
> -	clks[IMX8MQ_SYS2_PLL_166M] = imx_clk_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
> -	clks[IMX8MQ_SYS2_PLL_200M] = imx_clk_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
> -	clks[IMX8MQ_SYS2_PLL_250M] = imx_clk_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
> -	clks[IMX8MQ_SYS2_PLL_333M] = imx_clk_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
> -	clks[IMX8MQ_SYS2_PLL_500M] = imx_clk_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
> -	clks[IMX8MQ_SYS2_PLL_1000M] = imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
> +
> +	/* SYS PLL1 fixed output */
> +	clks[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
> +	clks[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
> +	clks[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
> +	clks[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
> +	clks[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
> +	clks[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> +	clks[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
> +	clks[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
> +	clks[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
> +
> +	clks[IMX8MQ_SYS1_PLL_40M] = imx_clk_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
> +	clks[IMX8MQ_SYS1_PLL_80M] = imx_clk_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
> +	clks[IMX8MQ_SYS1_PLL_100M] = imx_clk_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
> +	clks[IMX8MQ_SYS1_PLL_133M] = imx_clk_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
> +	clks[IMX8MQ_SYS1_PLL_160M] = imx_clk_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
> +	clks[IMX8MQ_SYS1_PLL_200M] = imx_clk_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> +	clks[IMX8MQ_SYS1_PLL_266M] = imx_clk_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> +	clks[IMX8MQ_SYS1_PLL_400M] = imx_clk_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
> +	clks[IMX8MQ_SYS1_PLL_800M] = imx_clk_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
> +
> +	/* SYS PLL2 fixed output */
> +	clks[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
> +	clks[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
> +	clks[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
> +	clks[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
> +	clks[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
> +	clks[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
> +	clks[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
> +	clks[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
> +	clks[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
> +
> +	clks[IMX8MQ_SYS2_PLL_50M] = imx_clk_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
> +	clks[IMX8MQ_SYS2_PLL_100M] = imx_clk_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
> +	clks[IMX8MQ_SYS2_PLL_125M] = imx_clk_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
> +	clks[IMX8MQ_SYS2_PLL_166M] = imx_clk_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
> +	clks[IMX8MQ_SYS2_PLL_200M] = imx_clk_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
> +	clks[IMX8MQ_SYS2_PLL_250M] = imx_clk_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
> +	clks[IMX8MQ_SYS2_PLL_333M] = imx_clk_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
> +	clks[IMX8MQ_SYS2_PLL_500M] = imx_clk_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
> +	clks[IMX8MQ_SYS2_PLL_1000M] = imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
>  
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (WARN_ON(IS_ERR(base)))
>  		return PTR_ERR(base);
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> index 65463673d25e..853c9a9e66fd 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -401,7 +401,27 @@
>  #define IMX8MQ_CLK_GPIO5_ROOT			263
>  
>  #define IMX8MQ_CLK_SNVS_ROOT			264
>  #define IMX8MQ_CLK_GIC				265
>  
> -#define IMX8MQ_CLK_END				266
> +#define IMX8MQ_SYS1_PLL_40M_CG			266
> +#define IMX8MQ_SYS1_PLL_80M_CG			267
> +#define IMX8MQ_SYS1_PLL_100M_CG			268
> +#define IMX8MQ_SYS1_PLL_133M_CG			269
> +#define IMX8MQ_SYS1_PLL_160M_CG			270
> +#define IMX8MQ_SYS1_PLL_200M_CG			271
> +#define IMX8MQ_SYS1_PLL_266M_CG			272
> +#define IMX8MQ_SYS1_PLL_400M_CG			273
> +#define IMX8MQ_SYS1_PLL_800M_CG			274
> +#define IMX8MQ_SYS2_PLL_50M_CG			275
> +#define IMX8MQ_SYS2_PLL_100M_CG			276
> +#define IMX8MQ_SYS2_PLL_125M_CG			277
> +#define IMX8MQ_SYS2_PLL_166M_CG			278
> +#define IMX8MQ_SYS2_PLL_200M_CG			279
> +#define IMX8MQ_SYS2_PLL_250M_CG			280
> +#define IMX8MQ_SYS2_PLL_333M_CG			281
> +#define IMX8MQ_SYS2_PLL_500M_CG			282
> +#define IMX8MQ_SYS2_PLL_1000M_CG		283
> +
> +#define IMX8MQ_CLK_END				284
> +
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
> -- 
> 2.17.1
> 
