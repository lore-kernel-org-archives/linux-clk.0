Return-Path: <SRS0=2r8j=YP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F6FCA9EA0
	for <linux-clk@archiver.kernel.org>; Tue, 22 Oct 2019 19:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA2D52184C
	for <linux-clk@archiver.kernel.org>; Tue, 22 Oct 2019 19:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732911AbfJVTVe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Oct 2019 15:21:34 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54056 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730186AbfJVTVe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Oct 2019 15:21:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 26B362001B9;
        Tue, 22 Oct 2019 21:21:32 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 181192000AC;
        Tue, 22 Oct 2019 21:21:32 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 92BC42060F;
        Tue, 22 Oct 2019 21:21:31 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx8m: Use SYS_PLL1_800M as intermediate parent of CLK_ARM
Date:   Tue, 22 Oct 2019 22:21:28 +0300
Message-Id: <f5d2b9c53f1ed5ccb1dd3c6624f56759d92e1689.1571771777.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

During cpu frequency switching the main "CLK_ARM" is reparented to an
intermediate "step" clock. On imx8mm and imx8mn the 24M oscillator is
used for this purpose but it is extremely slow, increasing wakeup
latencies to the point that i2c transactions can timeout and system
becomes unresponsive.

Fix by switching the "step" clk to SYS_PLL1_800M, matching the behavior
of imx8m cpufreq drivers in imx vendor tree.

This bug was not immediately apparent because upstream arm64 defconfig
uses the "performance" governor by default so no cpufreq transitions
happen.

Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
Fixes: 96d6392b54db ("clk: imx: Add support for i.MX8MN clock driver")

Cc: stable@vger.kernel.org
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 2 +-
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

This is marked as "cc: stable" because it has a large impact on common
usecases and it's difficult to debug.

This was sent with a different email workaround so hope it arrives OK.

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index bbd212eb904e..a92942ea2045 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -588,11 +588,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	clks[IMX8MM_CLK_ARM] = imx_clk_cpu("arm", "arm_a53_div",
 					   clks[IMX8MM_CLK_A53_DIV],
 					   clks[IMX8MM_CLK_A53_SRC],
 					   clks[IMX8MM_ARM_PLL_OUT],
-					   clks[IMX8MM_CLK_24M]);
+					   clks[IMX8MM_SYS_PLL1_800M]);
 
 	imx_check_clocks(clks, ARRAY_SIZE(clks));
 
 	clk_data.clks = clks;
 	clk_data.clk_num = ARRAY_SIZE(clks);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ad7f2e527c70..3cd38eba58df 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -544,11 +544,11 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 
 	clks[IMX8MN_CLK_ARM] = imx_clk_cpu("arm", "arm_a53_div",
 					   clks[IMX8MN_CLK_A53_DIV],
 					   clks[IMX8MN_CLK_A53_SRC],
 					   clks[IMX8MN_ARM_PLL_OUT],
-					   clks[IMX8MN_CLK_24M]);
+					   clks[IMX8MN_SYS_PLL1_800M]);
 
 	imx_check_clocks(clks, ARRAY_SIZE(clks));
 
 	clk_data.clks = clks;
 	clk_data.clk_num = ARRAY_SIZE(clks);
-- 
2.17.1

