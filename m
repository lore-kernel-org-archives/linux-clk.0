Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32782 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730292AbeIFUi7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:38:59 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 2/2] clk: samsung: exynos5433: Add suspend state for TOP,
 CPIF & PERIC CMUs
Date: Thu, 06 Sep 2018 18:02:36 +0200
Message-id: <20180906160236.4326-3-m.szyprowski@samsung.com>
In-reply-to: <20180906160236.4326-1-m.szyprowski@samsung.com>
References: <20180906160236.4326-1-m.szyprowski@samsung.com>
        <CGME20180906160245eucas1p2800b51c95c9433501b06d92ca0f1aa94@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Before entering system suspend, one has to ensure that some clocks from
TOP, CPIF and PERIC CMUs are enabled. This is needed by the firmware
to properly perform system suspend operation. Instead of adding more and
more clocks with CRITICAL flag, simply enable those clocks directly in
respective CMU registers using 'suspend_regs' feature.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos5433.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 426980514e67..13384f4911c7 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -177,6 +177,15 @@ static const unsigned long top_clk_regs[] __initconst = {
 	ENABLE_CMU_TOP_DIV_STAT,
 };
 
+static const struct samsung_clk_reg_dump top_suspend_regs[] = {
+	/* force all aclk clocks enabled */
+	{ ENABLE_ACLK_TOP, 0x67ecffed },
+	/* ISP PLL has to be enabled for suspend: reset value + ENABLE bit */
+	{ ISP_PLL_CON0, 0x85cc0502 },
+	/* ISP PLL has to be enabled for suspend: reset value + ENABLE bit */
+	{ AUD_PLL_CON0, 0x84830202 },
+};
+
 /* list of all parent clock list */
 PNAME(mout_aud_pll_p)		= { "oscclk", "fout_aud_pll", };
 PNAME(mout_isp_pll_p)		= { "oscclk", "fout_isp_pll", };
@@ -792,6 +801,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= TOP_NR_CLK,
 	.clk_regs		= top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+	.suspend_regs		= top_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(top_suspend_regs),
 };
 
 static void __init exynos5433_cmu_top_init(struct device_node *np)
@@ -822,6 +833,13 @@ static const unsigned long cpif_clk_regs[] __initconst = {
 	ENABLE_SCLK_CPIF,
 };
 
+static const struct samsung_clk_reg_dump cpif_suspend_regs[] = {
+	/* force all sclk clocks enabled */
+	{ ENABLE_SCLK_CPIF, 0x3ff },
+	/* MPHY PLL has to be enabled for suspend: reset value + ENABLE bit */
+	{ MPHY_PLL_CON0, 0x81c70601 },
+};
+
 /* list of all parent clock list */
 PNAME(mout_mphy_pll_p)		= { "oscclk", "fout_mphy_pll", };
 
@@ -862,6 +880,8 @@ static const struct samsung_cmu_info cpif_cmu_info __initconst = {
 	.nr_clk_ids		= CPIF_NR_CLK,
 	.clk_regs		= cpif_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cpif_clk_regs),
+	.suspend_regs		= cpif_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(cpif_suspend_regs),
 };
 
 static void __init exynos5433_cmu_cpif_init(struct device_node *np)
@@ -1547,6 +1567,13 @@ static const unsigned long peric_clk_regs[] __initconst = {
 	ENABLE_IP_PERIC2,
 };
 
+static const struct samsung_clk_reg_dump peric_suspend_regs[] = {
+	/* pclk: sci, pmu, sysreg, gpio_{finger, ese, touch, nfc}, uart2-0 */
+	{ ENABLE_PCLK_PERIC0, 0xe00ff000 },
+	/* sclk: uart2-0 */
+	{ ENABLE_SCLK_PERIC, 0x7 },
+};
+
 static const struct samsung_div_clock peric_div_clks[] __initconst = {
 	/* DIV_PERIC */
 	DIV(CLK_DIV_SCLK_SCI, "div_sclk_sci", "oscclk", DIV_PERIC, 4, 4),
@@ -1705,6 +1732,8 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.nr_clk_ids		= PERIC_NR_CLK,
 	.clk_regs		= peric_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric_clk_regs),
+	.suspend_regs		= peric_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(peric_suspend_regs),
 };
 
 static void __init exynos5433_cmu_peric_init(struct device_node *np)
-- 
2.17.1
