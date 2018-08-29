Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57851 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729154AbeH2T6C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:58:02 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] clk: samsung: exynos5433: Add suspend state for TOP,
 CPIF & PERIC CMUs
Date: Wed, 29 Aug 2018 18:00:13 +0200
Message-id: <20180829160013.9447-3-m.szyprowski@samsung.com>
In-reply-to: <20180829160013.9447-1-m.szyprowski@samsung.com>
References: <20180829160013.9447-1-m.szyprowski@samsung.com>
        <CGME20180829160024eucas1p19b9912baece05c529f6bcf64b986bba9@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Before entering system suspend, one has to ensure that all TOP ACLK clocks
are enabled, so do this by storing 0x67ECFFED value to ENABLE_ACLK_TOP
register. In case of PERIC CMU, keep all UART PCLK and SCLK clocks as well
as all GPIO PCLK clocks enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 426980514e67..d34e645aba49 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -177,6 +177,12 @@ static const unsigned long top_clk_regs[] __initconst = {
 	ENABLE_CMU_TOP_DIV_STAT,
 };
 
+static const struct samsung_clk_reg_dump top_suspend_regs[] = {
+	{ ENABLE_ACLK_TOP, 0x67ECFFED }, /* all clocks enabled */
+	{ ISP_PLL_CON0, 0x85CC0502 },	/* reset value + ENABLE bit */
+	{ AUD_PLL_CON0, 0x84830202 },	/* reset value + ENABLE bit */
+};
+
 /* list of all parent clock list */
 PNAME(mout_aud_pll_p)		= { "oscclk", "fout_aud_pll", };
 PNAME(mout_isp_pll_p)		= { "oscclk", "fout_isp_pll", };
@@ -792,6 +798,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= TOP_NR_CLK,
 	.clk_regs		= top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
+	.suspend_regs		= top_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(top_suspend_regs),
 };
 
 static void __init exynos5433_cmu_top_init(struct device_node *np)
@@ -822,6 +830,11 @@ static const unsigned long cpif_clk_regs[] __initconst = {
 	ENABLE_SCLK_CPIF,
 };
 
+static const struct samsung_clk_reg_dump cpif_suspend_regs[] = {
+	{ ENABLE_SCLK_CPIF, 0x3FF },	/* all clocks enabled */
+	{ MPHY_PLL_CON0, 0x81C70601 },	/* reset value + ENABLE bit */
+};
+
 /* list of all parent clock list */
 PNAME(mout_mphy_pll_p)		= { "oscclk", "fout_mphy_pll", };
 
@@ -862,6 +875,8 @@ static const struct samsung_cmu_info cpif_cmu_info __initconst = {
 	.nr_clk_ids		= CPIF_NR_CLK,
 	.clk_regs		= cpif_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cpif_clk_regs),
+	.suspend_regs		= cpif_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(cpif_suspend_regs),
 };
 
 static void __init exynos5433_cmu_cpif_init(struct device_node *np)
@@ -1547,6 +1562,11 @@ static const unsigned long peric_clk_regs[] __initconst = {
 	ENABLE_IP_PERIC2,
 };
 
+static const struct samsung_clk_reg_dump peric_suspend_regs[] = {
+	{ ENABLE_PCLK_PERIC0, 0xE00FF000 },
+	{ ENABLE_SCLK_PERIC, 0x7 },
+};
+
 static const struct samsung_div_clock peric_div_clks[] __initconst = {
 	/* DIV_PERIC */
 	DIV(CLK_DIV_SCLK_SCI, "div_sclk_sci", "oscclk", DIV_PERIC, 4, 4),
@@ -1705,6 +1725,8 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.nr_clk_ids		= PERIC_NR_CLK,
 	.clk_regs		= peric_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric_clk_regs),
+	.suspend_regs		= peric_suspend_regs,
+	.nr_suspend_regs	= ARRAY_SIZE(peric_suspend_regs),
 };
 
 static void __init exynos5433_cmu_peric_init(struct device_node *np)
-- 
2.17.1
