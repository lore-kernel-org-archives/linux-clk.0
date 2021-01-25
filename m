Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1AEC433E9
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 18:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AE5B22ADC
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 18:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbhAYSUy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:20:54 -0500
Received: from inva020.nxp.com ([92.121.34.13]:46196 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbhAYST6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Jan 2021 13:19:58 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B655A1A1361;
        Mon, 25 Jan 2021 19:19:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A95351A0ADA;
        Mon, 25 Jan 2021 19:19:07 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 949732032A;
        Mon, 25 Jan 2021 19:19:07 +0100 (CET)
Date:   Mon, 25 Jan 2021 20:19:07 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/3] clk: imx8mq: add PLL monitor output
Message-ID: <20210125181907.wimfh26tvmoy3kl7@fsr-ub1664-175>
References: <20210125174135.1223680-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125174135.1223680-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-25 18:41:33, Lucas Stach wrote:
> The PLL monitor is mentioned as a debug feature in the reference manual,
> but there are some boards that use this clock output as a reference clock
> for board level components. Add support for those clocks in the clock
> driver, so this clock output can be used properly.
> 
> Note that the VIDEO1, GPU and VPU mux inputs are rotated compared to the
> description in the reference manual. The order in this patch has been
> empirically validated.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/clk/imx/clk-imx8mq.c             | 22 ++++++++++++++++++++++
>  include/dt-bindings/clock/imx8mq-clock.h | 16 +++++++++++++++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 779ea69e639c..4dd4ae9d022b 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -270,6 +270,14 @@ static const char * const imx8mq_clko1_sels[] = {"osc_25m", "sys1_pll_800m", "os
>  static const char * const imx8mq_clko2_sels[] = {"osc_25m", "sys2_pll_200m", "sys1_pll_400m", "sys2_pll_166m",
>  					  "sys3_pll_out", "audio_pll1_out", "video_pll1_out", "ckil", };
>  
> +static const char * const pllout_monitor_sels[] = {"osc_25m", "osc_27m", "dummy", "dummy", "ckil",
> +						   "audio_pll1_out_monitor", "audio_pll2_out_monitor",
> +						   "video_pll1_out_monitor", "gpu_pll_out_monitor",
> +						   "vpu_pll_out_monitor", "arm_pll_out_monitor",
> +						   "sys_pll1_out_monitor", "sys_pll2_out_monitor",
> +						   "sys_pll3_out_monitor", "dram_pll_out_monitor",
> +						   "video_pll2_out_monitor", };
> +
>  static struct clk_hw_onecell_data *clk_hw_data;
>  static struct clk_hw **hws;
>  
> @@ -399,6 +407,20 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
>  	hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
>  
> +	hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
> +	hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> +	hws[IMX8MQ_CLK_MON_VIDEO_PLL1_DIV] = imx_clk_hw_divider("video_pll1_out_monitor", "video_pll1_bypass", base + 0x78, 8, 3);
> +	hws[IMX8MQ_CLK_MON_GPU_PLL_DIV] = imx_clk_hw_divider("gpu_pll_out_monitor", "gpu_pll_bypass", base + 0x78, 12, 3);
> +	hws[IMX8MQ_CLK_MON_VPU_PLL_DIV] = imx_clk_hw_divider("vpu_pll_out_monitor", "vpu_pll_bypass", base + 0x78, 16, 3);
> +	hws[IMX8MQ_CLK_MON_ARM_PLL_DIV] = imx_clk_hw_divider("arm_pll_out_monitor", "arm_pll_bypass", base + 0x78, 20, 3);
> +	hws[IMX8MQ_CLK_MON_SYS_PLL1_DIV] = imx_clk_hw_divider("sys_pll1_out_monitor", "sys1_pll_out", base + 0x7c, 0, 3);
> +	hws[IMX8MQ_CLK_MON_SYS_PLL2_DIV] = imx_clk_hw_divider("sys_pll2_out_monitor", "sys2_pll_out", base + 0x7c, 4, 3);
> +	hws[IMX8MQ_CLK_MON_SYS_PLL3_DIV] = imx_clk_hw_divider("sys_pll3_out_monitor", "sys3_pll_out", base + 0x7c, 8, 3);
> +	hws[IMX8MQ_CLK_MON_DRAM_PLL_DIV] = imx_clk_hw_divider("dram_pll_out_monitor", "dram_pll_out", base + 0x7c, 12, 3);
> +	hws[IMX8MQ_CLK_MON_VIDEO_PLL2_DIV] = imx_clk_hw_divider("video_pll2_out_monitor", "video2_pll_out", base + 0x7c, 16, 3);
> +	hws[IMX8MQ_CLK_MON_SEL] = imx_clk_hw_mux("pllout_monitor_sel", base + 0x74, 0, 4, pllout_monitor_sels, ARRAY_SIZE(pllout_monitor_sels));
> +	hws[IMX8MQ_CLK_MON_CLK2_OUT] = imx_clk_hw_gate("pllout_monitor_clk2", "pllout_monitor_sel", base + 0x74, 4);
> +
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (WARN_ON(IS_ERR(base)))
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> index 9b8045d75b8b..82e907ce7bdd 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -431,6 +431,20 @@
>  
>  #define IMX8MQ_CLK_A53_CORE			289

This goes through a different tree.

> -#define IMX8MQ_CLK_END				290
> +#define IMX8MQ_CLK_MON_AUDIO_PLL1_DIV		290
> +#define IMX8MQ_CLK_MON_AUDIO_PLL2_DIV		291
> +#define IMX8MQ_CLK_MON_VIDEO_PLL1_DIV		292
> +#define IMX8MQ_CLK_MON_GPU_PLL_DIV		293
> +#define IMX8MQ_CLK_MON_VPU_PLL_DIV		294
> +#define IMX8MQ_CLK_MON_ARM_PLL_DIV		295
> +#define IMX8MQ_CLK_MON_SYS_PLL1_DIV		296
> +#define IMX8MQ_CLK_MON_SYS_PLL2_DIV		297
> +#define IMX8MQ_CLK_MON_SYS_PLL3_DIV		298
> +#define IMX8MQ_CLK_MON_DRAM_PLL_DIV		299
> +#define IMX8MQ_CLK_MON_VIDEO_PLL2_DIV		300
> +#define IMX8MQ_CLK_MON_SEL			301
> +#define IMX8MQ_CLK_MON_CLK2_OUT			302
> +
> +#define IMX8MQ_CLK_END				303
>  
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
> -- 
> 2.20.1
> 

Everything else looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
