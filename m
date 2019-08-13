Return-Path: <SRS0=gnDx=WJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93043C32757
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 727102067D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfHMRFk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 13:05:40 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57760 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbfHMRFk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 13:05:40 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7C4452000AD;
        Tue, 13 Aug 2019 19:05:37 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 69CAA2000A4;
        Tue, 13 Aug 2019 19:05:37 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id DCDC92060E;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] clk: imx8mn: Add GIC clock
Date:   Tue, 13 Aug 2019 20:05:31 +0300
Message-Id: <aac1c184fd39a96239618ec9bdcc95c5520abb8d.1565715590.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is enabled by default but if it's not explicitly defined and marked
as critical then its parent might get turned off.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mn.c             | 5 +++++
 include/dt-bindings/clock/imx8mn-clock.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 106cc417c19b..3a71bb37c656 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -269,10 +269,14 @@ static const char * const imx8mn_usb_core_sels[] = {"osc_24m", "sys_pll1_100m",
 
 static const char * const imx8mn_usb_phy_sels[] = {"osc_24m", "sys_pll1_100m", "sys_pll1_40m",
 						   "sys_pll2_100m", "sys_pll2_200m", "clk_ext2",
 						   "clk_ext3", "audio_pll2_out", };
 
+static const char * const imx8mn_gic_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_40m",
+					"sys_pll2_100m", "sys_pll1_800m", "clk_ext2",
+					"clk_ext4", "audio_pll2_out" };
+
 static const char * const imx8mn_ecspi1_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_40m",
 						  "sys_pll1_160m", "sys_pll1_800m", "sys_pll3_out",
 						  "sys_pll2_250m", "audio_pll2_out", };
 
 static const char * const imx8mn_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_40m",
@@ -522,10 +526,11 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	clks[IMX8MN_CLK_UART2] = imx8m_clk_composite("uart2", imx8mn_uart2_sels, base + 0xaf80);
 	clks[IMX8MN_CLK_UART3] = imx8m_clk_composite("uart3", imx8mn_uart3_sels, base + 0xb000);
 	clks[IMX8MN_CLK_UART4] = imx8m_clk_composite("uart4", imx8mn_uart4_sels, base + 0xb080);
 	clks[IMX8MN_CLK_USB_CORE_REF] = imx8m_clk_composite("usb_core_ref", imx8mn_usb_core_sels, base + 0xb100);
 	clks[IMX8MN_CLK_USB_PHY_REF] = imx8m_clk_composite("usb_phy_ref", imx8mn_usb_phy_sels, base + 0xb180);
+	clks[IMX8MN_CLK_GIC] = imx8m_clk_composite_critical("gic", imx8mn_gic_sels, base + 0xb200);
 	clks[IMX8MN_CLK_ECSPI1] = imx8m_clk_composite("ecspi1", imx8mn_ecspi1_sels, base + 0xb280);
 	clks[IMX8MN_CLK_ECSPI2] = imx8m_clk_composite("ecspi2", imx8mn_ecspi2_sels, base + 0xb300);
 	clks[IMX8MN_CLK_PWM1] = imx8m_clk_composite("pwm1", imx8mn_pwm1_sels, base + 0xb380);
 	clks[IMX8MN_CLK_PWM2] = imx8m_clk_composite("pwm2", imx8mn_pwm2_sels, base + 0xb400);
 	clks[IMX8MN_CLK_PWM3] = imx8m_clk_composite("pwm3", imx8mn_pwm3_sels, base + 0xb480);
diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 5255b1c2420e..d7b201652f4c 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -207,9 +207,10 @@
 #define IMX8MN_CLK_SDMA3_ROOT			189
 #define IMX8MN_CLK_TMU_ROOT			190
 #define IMX8MN_CLK_ARM				191
 #define IMX8MN_CLK_NAND_USDHC_BUS_RAWNAND_CLK	192
 #define IMX8MN_CLK_GPU_CORE_ROOT		193
+#define IMX8MN_CLK_GIC				194
 
-#define IMX8MN_CLK_END				194
+#define IMX8MN_CLK_END				195
 
 #endif
-- 
2.17.1

