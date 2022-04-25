Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2A3C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 09:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbiDYJ4k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239974AbiDYJ4T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 05:56:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0722E403D3
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 02:52:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOn-0008Mo-Ji; Mon, 25 Apr 2022 11:52:53 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOo-0057Ws-93; Mon, 25 Apr 2022 11:52:52 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nivOm-0015Vq-2S; Mon, 25 Apr 2022 11:52:52 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        David Jander <david@protonic.nl>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/2] clk: imx8mp: Enable no longer handled gates
Date:   Mon, 25 Apr 2022 11:52:48 +0200
Message-Id: <20220425095249.259406-2-s.hauer@pengutronix.de>
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
was removed in d097cc045b649. We shouldn't assume these gates are at
their reset-default enabled state. Enable them to let the kernel work
when the bootloader has changed the values.

Fixes: d097cc045b649 ("clk: imx8mp: remove SYS PLL 1/2 clock gates")
Reported-by: David Jander <david@protonic.nl>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-imx8mp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 18f5b7c3ca9d8..10446a1b509e7 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -407,6 +407,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	void __iomem *anatop_base, *ccm_base;
+	u32 val;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
 	anatop_base = of_iomap(np, 0);
@@ -480,6 +481,15 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", anatop_base + 0x84, 11);
 	hws[IMX8MP_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", anatop_base + 0x114, 11);
 
+	/*
+	 * The gates in CCM_ANALOG_SYS_PLL1_GEN_CTRL are not handled by the
+	 * driver, make sure they are all enabled.
+	 */
+	val = readl(anatop_base + 0x94);
+	val |= BIT(13) | BIT(15) | BIT(17) | BIT(19) | BIT(21) | BIT(23) |
+	       BIT(25) | BIT(27);
+	writel(val, anatop_base + 0x94);
+
 	hws[IMX8MP_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass", anatop_base + 0x94, 11);
 
 	hws[IMX8MP_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
@@ -494,6 +504,15 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass", anatop_base + 0x104, 11);
 
+	/*
+	 * The gates in CCM_ANALOG_SYS_PLL2_GEN_CTRL are not handled by the
+	 * driver, make sure they are all enabled.
+	 */
+	val = readl(anatop_base + 0x104);
+	val |= BIT(13) | BIT(15) | BIT(17) | BIT(19) | BIT(21) | BIT(23) |
+	       BIT(25) | BIT(27);
+	writel(val, anatop_base + 0x104);
+
 	hws[IMX8MP_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
 	hws[IMX8MP_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
 	hws[IMX8MP_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
-- 
2.30.2

