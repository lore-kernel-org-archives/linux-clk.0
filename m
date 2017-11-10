Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4405 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752695AbdKJLiA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Nov 2017 06:38:00 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 1/4] clk: tegra: Add la clock for Tegra210
Date: Fri, 10 Nov 2017 13:37:45 +0200
Message-ID: <1510313868-24810-2-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
References: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock is needed by the MBIST WAR.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 12 ++++++++++++
 include/dt-bindings/clock/tegra210-car.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 6d7a613..55a5b7f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -40,6 +40,7 @@
 
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
+#define CLK_SOURCE_LA 0x1f8
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -2628,6 +2629,13 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
 
+static const char * const la_parents[] = {
+	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
+};
+
+static struct tegra_clk_periph tegra210_la =
+	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -2667,6 +2675,10 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA210_CLK_DSIB] = clk;
 
+	/* la */
+	clk = tegra_clk_register_periph("la", la_parents,
+			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
+			CLK_SOURCE_LA, 0);
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index a9dc145..5df857a 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -95,7 +95,7 @@
 #define TEGRA210_CLK_CSITE 73
 /* 74 */
 /* 75 */
-/* 76 */
+#define TEGRA210_CLK_LA 76
 /* 77 */
 #define TEGRA210_CLK_SOC_THERM 78
 #define TEGRA210_CLK_DTV 79
-- 
1.9.1

