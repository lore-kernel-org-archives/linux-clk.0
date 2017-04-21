Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52269 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1041121AbdDUSer (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 14:34:47 -0400
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com,
        cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org,
        jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 3/7] clk: samsung: exynos542x: Add EPLL rate table
Date: Fri, 21 Apr 2017 19:19:47 +0200
Message-id: <1492795191-31298-4-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172029epcas5p1b32ed135c5e0f1b86fbcc54279126349@epcas5p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

A specific clock rate table is added for EPLL so it is possible
to set frequency of the EPLL output clock as multiple of various
audio sampling rates.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 87c711a..6fbd6ae 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1279,6 +1279,22 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	PLL_35XX_RATE(200000000,  200, 3, 3),
 };
 
+static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
+	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
+	PLL_36XX_RATE(400000000U, 200, 2, 2, 0),
+	PLL_36XX_RATE(393216000U, 197, 3, 2, 25690),
+	PLL_36XX_RATE(361267200U, 301, 5, 2, 3671),
+	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
+	PLL_36XX_RATE(196608000U, 197, 3, 3, -25690),
+	PLL_36XX_RATE(180633600U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(131072000U, 131, 3, 3, 4719),
+	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE( 65536000U, 131, 3, 4, 4719),
+	PLL_36XX_RATE( 49152000U, 197, 3, 5, 25690),
+	PLL_36XX_RATE( 45158400U, 301, 5, 3, 3671),
+	PLL_36XX_RATE( 32768000U, 131, 3, 5, 4719),
+};
+
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
@@ -1286,7 +1302,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 		CPLL_CON0, NULL),
 	[dpll] = PLL(pll_2550, CLK_FOUT_DPLL, "fout_dpll", "fin_pll", DPLL_LOCK,
 		DPLL_CON0, NULL),
-	[epll] = PLL(pll_2650, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
+	[epll] = PLL(pll_36xx, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
 		EPLL_CON0, NULL),
 	[rpll] = PLL(pll_2650, CLK_FOUT_RPLL, "fout_rpll", "fin_pll", RPLL_LOCK,
 		RPLL_CON0, NULL),
@@ -1401,7 +1417,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 
 	if (_get_rate("fin_pll") == 24 * MHZ) {
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
-		exynos5x_plls[epll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[bpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 	}
-- 
1.9.1

