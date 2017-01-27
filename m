Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17412 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934396AbdA0LnK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2017 06:43:10 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKF00HNQQZB8V80@mailout1.w1.samsung.com> for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:11 +0000 (GMT)
Received: from eusmges2.samsung.com (unknown [203.254.199.241])
 by     eucas1p2.samsung.com (KnoxPortal)
 with ESMTP id  20170127110911eucas1p26f4ef7b93d7957bc9d1f3d7f1f3ca145~dnFdkw7450986409864eucas1p2f
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180])
 by     eucas1p2.samsung.com (KnoxPortal)
 with ESMTP id  20170127110910eucas1p257e5cb0582f58f98ff1f2c1b502f8037~dnFcpoQX40375603756eucas1p2A
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:10 +0000 (GMT)
Received: from AMDC2765.digital.local ([106.116.147.25])
 by     eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit  (built May  5 2014))
 with ESMTPA id <0OKF001FRQZ1L520@eusync1.samsung.com>  for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 RESEND 1/3] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Fri, 27 Jan 2017 12:09:00 +0100
Message-id: <1485515341-29911-2-git-send-email-m.szyprowski@samsung.com>
In-reply-to: <1485515341-29911-1-git-send-email-m.szyprowski@samsung.com>
References: <1485515341-29911-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170127110910eucas1p257e5cb0582f58f98ff1f2c1b502f8037@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
to setup initial clock configuration for display subsystem in device tree
in order to avoid dependency on the configuration left by the bootloader.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsugn.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
 include/dt-bindings/clock/exynos5433.h | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 8fd7f6e88e3c..6ee91ae875c3 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -2559,8 +2559,10 @@ static void __init exynos5433_cmu_g2d_init(struct device_node *np)
 	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 188000000),
 	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 100000000),
 	/* PHY clocks from MIPI_DPHY0 */
-	FRATE(0, "phyclk_mipidphy0_bitclkdiv8_phy", NULL, 0, 188000000),
-	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, 0, 100000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY, "phyclk_mipidphy0_bitclkdiv8_phy",
+			NULL, 0, 188000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY, "phyclk_mipidphy0_rxclkesc0_phy",
+			NULL, 0, 100000000),
 	/* PHY clocks from HDMI_PHY */
 	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
 			NULL, 0, 300000000),
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 4fa6bb2136e3..be39d23e6a32 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -771,7 +771,10 @@
 
 #define CLK_PCLK_DECON					113
 
-#define DISP_NR_CLK					114
+#define CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY		114
+#define CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY		115
+
+#define DISP_NR_CLK					116
 
 /* CMU_AUD */
 #define CLK_MOUT_AUD_PLL_USER				1
-- 
1.9.1

