Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2587EC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 09:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbiDYJ4i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240453AbiDYJ4V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 05:56:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105E1403DB
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 02:52:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOn-0008Mp-M0; Mon, 25 Apr 2022 11:52:53 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOo-0057Wv-DZ; Mon, 25 Apr 2022 11:52:52 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOm-0015Vt-3C; Mon, 25 Apr 2022 11:52:52 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        David Jander <david@protonic.nl>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/2] clk: imx8mq: Enable no longer handled gates
Date:   Mon, 25 Apr 2022 11:52:49 +0200
Message-Id: <20220425095249.259406-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425095249.259406-1-s.hauer@pengutronix.de>
References: <20220425095249.259406-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Handling of the divided pll output gates in CCM_ANALOG_SYS_PLL1_GEN_CTRL
was removed in c586f53ae159c. We shouldn't assume these gates are at
their reset-default enabled state. Enable them to let the kernel work
when the bootloader has changed the values.

Fixes: c586f53ae159c ("clk: imx8mq: remove SYS PLL 1/2 clock gates")
Reported-by: David Jander <david@protonic.nl>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-imx8mq.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 83cc2b1c32947..55b72ff0c6a41 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -286,6 +286,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	u32 val;
 	int err;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
@@ -357,6 +358,15 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MQ_DRAM_PLL_OUT] = imx_clk_hw_sscg_pll("dram_pll_out", dram_pll_out_sels, ARRAY_SIZE(dram_pll_out_sels), 0, 0, 0, base + 0x60, CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
 	hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
 
+	/*
+	 * The gates in CCM_ANALOG_SYS_PLL_CFG0 are not handled by the driver,
+	 * make sure they are all enabled.
+	 */
+	val = readl(base + 0x30);
+	val |= BIT(9) | BIT(11) | BIT(13) | BIT(15) | BIT(17) | BIT(19) |
+	       BIT(21) | BIT(23) | BIT(25);
+	writel(val, base + 0x30);
+
 	/* SYS PLL1 fixed output */
 	hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
 	hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
@@ -368,6 +378,15 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
 	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
 
+	/*
+	 * The gates in CCM_ANALOG_SYS_PLL2_CFG0 are not handled by the driver,
+	 * make sure they are all enabled.
+	 */
+	val = readl(base + 0x3c);
+	val |= BIT(9) | BIT(11) | BIT(13) | BIT(15) | BIT(17) | BIT(19) |
+	       BIT(21) | BIT(23) | BIT(25);
+	writel(val, base + 0x3c);
+
 	/* SYS PLL2 fixed output */
 	hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
 	hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
-- 
2.30.2

