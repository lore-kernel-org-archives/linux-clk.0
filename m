Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D63AC43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 16:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67EBF2086D
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 16:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfAOQo4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 11:44:56 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:45141 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387654AbfAOQo4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Jan 2019 11:44:56 -0500
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Jan 2019 11:44:55 EST
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id D5422FB04;
        Tue, 15 Jan 2019 17:38:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WesFIwBP-esX; Tue, 15 Jan 2019 17:38:24 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 051AB47354; Tue, 15 Jan 2019 17:38:23 +0100 (CET)
Date:   Tue, 15 Jan 2019 17:38:23 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: imx8mq: Add dsi_ipg_div
Message-ID: <20190115163823.GA32114@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It's defined imx8mq-clock.h but wasn't assigned yet.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
I'm not sure I picked the intended clock type but it gives me the right
clock rate.

 drivers/clk/imx/clk-imx8mq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 398ab0bcd9de..6f082153714e 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -485,6 +485,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	clks[IMX8MQ_CLK_DSI_DBI] = imx8m_clk_composite("dsi_dbi", imx8mq_dsi_dbi_sels, base + 0xbc00);
 	clks[IMX8MQ_CLK_DSI_ESC] = imx8m_clk_composite("dsi_esc", imx8mq_dsi_esc_sels, base + 0xbc80);
 	clks[IMX8MQ_CLK_DSI_AHB] = imx8m_clk_composite("dsi_ahb", imx8mq_dsi_ahb_sels, base + 0x9200);
+	clks[IMX8MQ_CLK_DSI_IPG_DIV] = imx_clk_divider2("dsi_ipg_div", "dsi_ahb", base + 0x9280, 0, 6);
 	clks[IMX8MQ_CLK_CSI1_CORE] = imx8m_clk_composite("csi1_core", imx8mq_csi1_core_sels, base + 0xbd00);
 	clks[IMX8MQ_CLK_CSI1_PHY_REF] = imx8m_clk_composite("csi1_phy_ref", imx8mq_csi1_phy_sels, base + 0xbd80);
 	clks[IMX8MQ_CLK_CSI1_ESC] = imx8m_clk_composite("csi1_esc", imx8mq_csi1_esc_sels, base + 0xbe00);
-- 
2.20.1
