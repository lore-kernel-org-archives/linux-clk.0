Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EDEC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 18:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20A4122B3F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 18:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbhAYShU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:37:20 -0500
Received: from inva020.nxp.com ([92.121.34.13]:41070 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbhAYShM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Jan 2021 13:37:12 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DF27E1A0AD7;
        Mon, 25 Jan 2021 19:36:25 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D1B0F1A007F;
        Mon, 25 Jan 2021 19:36:25 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BD2B92032A;
        Mon, 25 Jan 2021 19:36:25 +0100 (CET)
Date:   Mon, 25 Jan 2021 20:36:25 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH 3/3] clk: imx8mn: add clkout1/2 support
Message-ID: <20210125183625.jxibmst2k66wlyru@fsr-ub1664-175>
References: <20210125174135.1223680-1-l.stach@pengutronix.de>
 <20210125174135.1223680-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125174135.1223680-3-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-25 18:41:35, Lucas Stach wrote:
> clkout1 and clkout2 allow to supply clocks from the SoC to the board,
> which is used by some board designs to provide reference clocks.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
> This hasn't been tested on HW, but is just based on the reference manual.
> ---
>  drivers/clk/imx/clk-imx8mn.c             | 12 ++++++++++++
>  include/dt-bindings/clock/imx8mn-clock.h |  9 ++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 3c21db942d5b..324c5fd0aa04 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -281,6 +281,11 @@ static const char * const imx8mn_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sy
>  						 "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out",
>  						 "video_pll1_out", "osc_32k", };
>  
> +static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
> +					   "dummy", "dummy", "gpu_pll_out", "dummy",
> +					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
> +					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
> +
>  static struct clk_hw_onecell_data *clk_hw_data;
>  static struct clk_hw **hws;
>  
> @@ -405,6 +410,13 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MN_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
>  	hws[IMX8MN_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>  
> +	hws[IMX8MN_CLK_CLKOUT1_SEL] = imx_clk_hw_mux("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MN_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
> +	hws[IMX8MN_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
> +	hws[IMX8MN_CLK_CLKOUT2_SEL] = imx_clk_hw_mux("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MN_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
> +	hws[IMX8MN_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
> +
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (WARN_ON(IS_ERR(base))) {
> diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
> index 621ea0e87c67..d24b627cb2e7 100644
> --- a/include/dt-bindings/clock/imx8mn-clock.h
> +++ b/include/dt-bindings/clock/imx8mn-clock.h
> @@ -234,6 +234,13 @@
>  
>  #define IMX8MN_CLK_A53_CORE			214
>  
> -#define IMX8MN_CLK_END				215
> +#define IMX8MN_CLK_CLKOUT1_SEL			215
> +#define IMX8MN_CLK_CLKOUT1_DIV			216
> +#define IMX8MN_CLK_CLKOUT1			217
> +#define IMX8MN_CLK_CLKOUT2_SEL			218
> +#define IMX8MN_CLK_CLKOUT2_DIV			219
> +#define IMX8MN_CLK_CLKOUT2			220
> +
> +#define IMX8MN_CLK_END				221
>  
>  #endif
> -- 
> 2.20.1
> 
