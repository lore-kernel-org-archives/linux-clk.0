Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29494 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323AbbJTJXX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 05:23:23 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 02/10] clk/samsung: exynos5433: add pclk_decon clock
Date: Tue, 20 Oct 2015 11:22:33 +0200
Message-id: <1445332961-25419-3-git-send-email-a.hajda@samsung.com>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This undocumented gate clock is used by DECON IP.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 2 ++
 include/dt-bindings/clock/exynos5433.h | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index e037406..e7b4533 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -2822,6 +2822,8 @@ static struct samsung_gate_clock disp_gate_clks[] __initdata = {
 			ENABLE_PCLK_DISP, 2, 0, 0),
 	GATE(CLK_PCLK_DECON_TV, "pclk_decon_tv", "div_pclk_disp",
 			ENABLE_PCLK_DISP, 1, 0, 0),
+	GATE(CLK_PCLK_DECON, "pclk_decon", "div_pclk_disp",
+			ENABLE_PCLK_DISP, 0, 0, 0),
 
 	/* ENABLE_SCLK_DISP */
 	GATE(CLK_PHYCLK_MIPIDPHY1_BITCLKDIV8, "phyclk_mipidphy1_bitclkdiv8",
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 4f0d566..5c2636c 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -768,7 +768,9 @@
 #define CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY		111
 #define CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY		112
 
-#define DISP_NR_CLK					113
+#define CLK_PCLK_DECON					113
+
+#define DISP_NR_CLK					114
 
 /* CMU_AUD */
 #define CLK_MOUT_AUD_PLL_USER				1
-- 
1.9.1

