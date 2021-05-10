Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A4CC433B4
	for <linux-clk@archiver.kernel.org>; Mon, 10 May 2021 08:54:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D96E66143C
	for <linux-clk@archiver.kernel.org>; Mon, 10 May 2021 08:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhEJIzs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 May 2021 04:55:48 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55500 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230050AbhEJIzr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 May 2021 04:55:47 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EF7F2041D1;
        Mon, 10 May 2021 10:54:42 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6217D2041D0;
        Mon, 10 May 2021 10:54:42 +0200 (CEST)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DF6B203B6;
        Mon, 10 May 2021 10:54:42 +0200 (CEST)
Date:   Mon, 10 May 2021 11:54:42 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx8mq: prevent sys1_pll_266m gating
Message-ID: <20210510085442.wn4vz2fgstym4rrj@fsr-ub1664-175>
References: <20210507171028.157728-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507171028.157728-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-05-07 19:10:28, Lucas Stach wrote:
> Gating sys1_pll_266m while the usdhc_nand_bus clock is still active (due
> to being enabled in to bootloader) leads to spurious failures of the
> uSDHC module.
> 
> b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> We probably need some solution to keep parent clocks active on the i.MX8M clock
> architecture, as long as any consumers are active, as the reference manual
> states that disabling a parent clock may lead to undefined behavior. This needs
> more work in the clock framework and/or driver. This patch fixes the obvious
> regression until we have such a solution.

I believe the solution here should be a core clock flag that forces
the core to read the gate bit value from register. The problem with this approach
is the clock core doesn't check if the child clocks are enabled when
disabling the parent clock, instead it relies on cached enabled count of the parent.
Basically, the CCF, as of now, isn't able to cope with clocks that can be
enabled/disabled from outside. This should be improved at some point.

> ---
>  drivers/clk/imx/clk-imx8mq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 4dd4ae9d022b..fce983add1fc 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -372,7 +372,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
>  	hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
>  	hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> -	hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
>  	hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
>  	hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
>  
> @@ -382,7 +381,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
>  	hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
>  	hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> -	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> +	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
>  	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
>  	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
>  
> -- 
> 2.29.2
> 
