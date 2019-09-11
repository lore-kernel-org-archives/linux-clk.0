Return-Path: <SRS0=WWrt=XG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE18CECDE20
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 12:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C669E21928
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 12:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfIKMFf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Sep 2019 08:05:35 -0400
Received: from inva021.nxp.com ([92.121.34.21]:46444 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbfIKMFf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Sep 2019 08:05:35 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 913CB2002E1;
        Wed, 11 Sep 2019 14:05:33 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 83C3D2002E0;
        Wed, 11 Sep 2019 14:05:33 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id DFE0B205DE;
        Wed, 11 Sep 2019 14:05:32 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clk: imx8mq: Define gates for pll1/2 fixed dividers
Date:   Wed, 11 Sep 2019 15:05:27 +0300
Message-Id: <f880a040c3adecbdb3870dca32083da16607e915.1568203237.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568203237.git.leonard.crestez@nxp.com>
References: <cover.1568203237.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1568203237.git.leonard.crestez@nxp.com>
References: <cover.1568203237.git.leonard.crestez@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On imx8mq there are 9 fixed-factor dividers for SYS_PLL1 and SYS_PLL2
each with their own gate but these gates are not currently defined.

Add the other gates to the clock tree between sys1/2_pll_out and the
fixed dividers.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c             | 62 ++++++++++++++++--------
 include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
 2 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 4c90eb06a591..154c8655f29d 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -344,30 +344,52 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 
 	clks[IMX8MQ_SYS1_PLL_OUT] = imx_clk_sccg_pll("sys1_pll_out", sys1_pll_out_sels, ARRAY_SIZE(sys1_pll_out_sels), 0, 0, 0, base + 0x30, CLK_IS_CRITICAL);
 	clks[IMX8MQ_SYS2_PLL_OUT] = imx_clk_sccg_pll("sys2_pll_out", sys2_pll_out_sels, ARRAY_SIZE(sys2_pll_out_sels), 0, 0, 1, base + 0x3c, CLK_IS_CRITICAL);
 	clks[IMX8MQ_SYS3_PLL_OUT] = imx_clk_sccg_pll("sys3_pll_out", sys3_pll_out_sels, ARRAY_SIZE(sys3_pll_out_sels), 0, 0, 1, base + 0x48, CLK_IS_CRITICAL);
 	clks[IMX8MQ_DRAM_PLL_OUT] = imx_clk_sccg_pll("dram_pll_out", dram_pll_out_sels, ARRAY_SIZE(dram_pll_out_sels), 0, 0, 0, base + 0x60, CLK_IS_CRITICAL);
-	/* SYS PLL fixed output */
-	clks[IMX8MQ_SYS1_PLL_40M] = imx_clk_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
-	clks[IMX8MQ_SYS1_PLL_80M] = imx_clk_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
-	clks[IMX8MQ_SYS1_PLL_100M] = imx_clk_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
-	clks[IMX8MQ_SYS1_PLL_133M] = imx_clk_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
-	clks[IMX8MQ_SYS1_PLL_160M] = imx_clk_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
-	clks[IMX8MQ_SYS1_PLL_200M] = imx_clk_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
-	clks[IMX8MQ_SYS1_PLL_266M] = imx_clk_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
-	clks[IMX8MQ_SYS1_PLL_400M] = imx_clk_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
-	clks[IMX8MQ_SYS1_PLL_800M] = imx_clk_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
-
-	clks[IMX8MQ_SYS2_PLL_50M] = imx_clk_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
-	clks[IMX8MQ_SYS2_PLL_100M] = imx_clk_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
-	clks[IMX8MQ_SYS2_PLL_125M] = imx_clk_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
-	clks[IMX8MQ_SYS2_PLL_166M] = imx_clk_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
-	clks[IMX8MQ_SYS2_PLL_200M] = imx_clk_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
-	clks[IMX8MQ_SYS2_PLL_250M] = imx_clk_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
-	clks[IMX8MQ_SYS2_PLL_333M] = imx_clk_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
-	clks[IMX8MQ_SYS2_PLL_500M] = imx_clk_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
-	clks[IMX8MQ_SYS2_PLL_1000M] = imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
+
+	/* SYS PLL1 fixed output */
+	clks[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
+	clks[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
+	clks[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
+	clks[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
+	clks[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
+	clks[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
+	clks[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
+	clks[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
+	clks[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
+
+	clks[IMX8MQ_SYS1_PLL_40M] = imx_clk_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
+	clks[IMX8MQ_SYS1_PLL_80M] = imx_clk_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
+	clks[IMX8MQ_SYS1_PLL_100M] = imx_clk_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
+	clks[IMX8MQ_SYS1_PLL_133M] = imx_clk_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
+	clks[IMX8MQ_SYS1_PLL_160M] = imx_clk_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
+	clks[IMX8MQ_SYS1_PLL_200M] = imx_clk_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
+	clks[IMX8MQ_SYS1_PLL_266M] = imx_clk_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
+	clks[IMX8MQ_SYS1_PLL_400M] = imx_clk_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
+	clks[IMX8MQ_SYS1_PLL_800M] = imx_clk_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
+
+	/* SYS PLL2 fixed output */
+	clks[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
+	clks[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
+	clks[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
+	clks[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
+	clks[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
+	clks[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
+	clks[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
+	clks[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
+	clks[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
+
+	clks[IMX8MQ_SYS2_PLL_50M] = imx_clk_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
+	clks[IMX8MQ_SYS2_PLL_100M] = imx_clk_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
+	clks[IMX8MQ_SYS2_PLL_125M] = imx_clk_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
+	clks[IMX8MQ_SYS2_PLL_166M] = imx_clk_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
+	clks[IMX8MQ_SYS2_PLL_200M] = imx_clk_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
+	clks[IMX8MQ_SYS2_PLL_250M] = imx_clk_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
+	clks[IMX8MQ_SYS2_PLL_333M] = imx_clk_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
+	clks[IMX8MQ_SYS2_PLL_500M] = imx_clk_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
+	clks[IMX8MQ_SYS2_PLL_1000M] = imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
 
 	np = dev->of_node;
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(IS_ERR(base)))
 		return PTR_ERR(base);
diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
index 65463673d25e..9b031f93b7d1 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -401,7 +401,27 @@
 #define IMX8MQ_CLK_GPIO5_ROOT			263
 
 #define IMX8MQ_CLK_SNVS_ROOT			264
 #define IMX8MQ_CLK_GIC				265
 
-#define IMX8MQ_CLK_END				266
+#define IMX8MQ_SYS1_PLL_40M_CG			266
+#define IMX8MQ_SYS1_PLL_80M_CG			267
+#define IMX8MQ_SYS1_PLL_100M_CG			268
+#define IMX8MQ_SYS1_PLL_133M_CG			269
+#define IMX8MQ_SYS1_PLL_160M_CG			270
+#define IMX8MQ_SYS1_PLL_200M_CG			271
+#define IMX8MQ_SYS1_PLL_266M_CG			272
+#define IMX8MQ_SYS1_PLL_400M_CG			273
+#define IMX8MQ_SYS1_PLL_800M_CG			274
+#define IMX8MQ_SYS2_PLL_50M_CG			275
+#define IMX8MQ_SYS2_PLL_100M_CG			276
+#define IMX8MQ_SYS2_PLL_125M_CG			277
+#define IMX8MQ_SYS2_PLL_166M_CG			278
+#define IMX8MQ_SYS2_PLL_200M_CG			279
+#define IMX8MQ_SYS2_PLL_250M_CG			280
+#define IMX8MQ_SYS2_PLL_333M_CG			281
+#define IMX8MQ_SYS2_PLL_500M_CG			282
+#define IMX8MQ_SYS2_PLL_1000M_CG		283
+
+#define IMX8MQ_CLK_END				384
+
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
-- 
2.17.1

