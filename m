Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B50C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 19:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0456F21707
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 19:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbhAZFg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:36:26 -0500
Received: from inva021.nxp.com ([92.121.34.21]:55254 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbhAYShl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Jan 2021 13:37:41 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EF80200964;
        Mon, 25 Jan 2021 19:36:54 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 31E6C2008B9;
        Mon, 25 Jan 2021 19:36:54 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C3E52032A;
        Mon, 25 Jan 2021 19:36:54 +0100 (CET)
Date:   Mon, 25 Jan 2021 20:36:53 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH 2/3] clk: imx8mm: add clkout1/2 support
Message-ID: <20210125183653.4eb5qsgdx5aw2v4v@fsr-ub1664-175>
References: <20210125174135.1223680-1-l.stach@pengutronix.de>
 <20210125174135.1223680-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125174135.1223680-2-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-25 18:41:34, Lucas Stach wrote:
> clkout1 and clkout2 allow to supply clocks from the SoC to the board,
> which is used by some board designs to provide reference clocks.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mm.c             | 12 ++++++++++++
>  include/dt-bindings/clock/imx8mm-clock.h | 10 +++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 7c905861af5d..6a01eec36dd0 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -288,6 +288,11 @@ static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "
>  static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
>  					  "sys_pll3_out", "audio_pll1_out", "video_pll1_out", "osc_32k", };
>  
> +static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
> +					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
> +					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
> +					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
> +
>  static struct clk_hw_onecell_data *clk_hw_data;
>  static struct clk_hw **hws;
>  
> @@ -410,6 +415,13 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MM_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
>  	hws[IMX8MM_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>  
> +	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
> +	hws[IMX8MM_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
> +	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
> +	hws[IMX8MM_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
> +
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (WARN_ON(IS_ERR(base)))
> diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
> index e63a5530aed7..47c6f7f9582c 100644
> --- a/include/dt-bindings/clock/imx8mm-clock.h
> +++ b/include/dt-bindings/clock/imx8mm-clock.h
> @@ -274,6 +274,14 @@
>  
>  #define IMX8MM_CLK_A53_CORE			251
>  
> -#define IMX8MM_CLK_END				252
> +#define IMX8MM_CLK_CLKOUT1_SEL			252
> +#define IMX8MM_CLK_CLKOUT1_DIV			253
> +#define IMX8MM_CLK_CLKOUT1			254
> +#define IMX8MM_CLK_CLKOUT2_SEL			255
> +#define IMX8MM_CLK_CLKOUT2_DIV			256
> +#define IMX8MM_CLK_CLKOUT2			257
> +
> +
> +#define IMX8MM_CLK_END				258
>  
>  #endif
> -- 
> 2.20.1
> 
