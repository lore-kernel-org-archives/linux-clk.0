Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37975C43387
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 12:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0888D20651
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 12:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732869AbfAPMl0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 07:41:26 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:40595 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730505AbfAPMl0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Jan 2019 07:41:26 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 32A24FB03;
        Wed, 16 Jan 2019 13:41:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3YOd_pioiJ6e; Wed, 16 Jan 2019 13:41:22 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id BC9EF475EF; Wed, 16 Jan 2019 13:41:21 +0100 (CET)
Date:   Wed, 16 Jan 2019 13:41:21 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx8mq: Add dsi_ipg_div
Message-ID: <20190116124121.GA30303@bogon.m.sigxcpu.org>
References: <20190115163823.GA32114@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190115163823.GA32114@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,
On Tue, Jan 15, 2019 at 05:38:23PM +0100, Guido Günther wrote:
> It's defined imx8mq-clock.h but wasn't assigned yet.

I've found these additional unassigned clocks (defined in
include/dt-bindings/clock/imx8mq-clock.h but not assigned in
drivers/clk/imx/clk-imx8mq.c):

IMX8MQ_CLK_A53_ROOT 
IMX8MQ_CLK_DRAM_ROOT
IMX8MQ_CLK_HEVC_ROOT
IMX8MQ_CLK_AVC_ROOT
IMX8MQ_CLK_VP9_ROOT
IMX8MQ_CLK_HEVC_INTER_ROOT
IMX8MQ_CLK_HDMI_ROOT
IMX8MQ_CLK_HDMI_PHY_ROOT
IMX8MQ_VIDEO2_PLL_OUT
IMX8MQ_CLK_M4_ROOT
IMX8MQ_CLK_M4_SRC
IMX8MQ_CLK_M4_CG
IMX8MQ_CLK_M4_DIV

I can look into adding these but just wanted to make sure they're not
sitting in a tree already.

Cheers,
 -- Guido

> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
> I'm not sure I picked the intended clock type but it gives me the right
> clock rate.
> 
>  drivers/clk/imx/clk-imx8mq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 398ab0bcd9de..6f082153714e 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -485,6 +485,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	clks[IMX8MQ_CLK_DSI_DBI] = imx8m_clk_composite("dsi_dbi", imx8mq_dsi_dbi_sels, base + 0xbc00);
>  	clks[IMX8MQ_CLK_DSI_ESC] = imx8m_clk_composite("dsi_esc", imx8mq_dsi_esc_sels, base + 0xbc80);
>  	clks[IMX8MQ_CLK_DSI_AHB] = imx8m_clk_composite("dsi_ahb", imx8mq_dsi_ahb_sels, base + 0x9200);
> +	clks[IMX8MQ_CLK_DSI_IPG_DIV] = imx_clk_divider2("dsi_ipg_div", "dsi_ahb", base + 0x9280, 0, 6);
>  	clks[IMX8MQ_CLK_CSI1_CORE] = imx8m_clk_composite("csi1_core", imx8mq_csi1_core_sels, base + 0xbd00);
>  	clks[IMX8MQ_CLK_CSI1_PHY_REF] = imx8m_clk_composite("csi1_phy_ref", imx8mq_csi1_phy_sels, base + 0xbd80);
>  	clks[IMX8MQ_CLK_CSI1_ESC] = imx8m_clk_composite("csi1_esc", imx8mq_csi1_esc_sels, base + 0xbe00);
> -- 
> 2.20.1
