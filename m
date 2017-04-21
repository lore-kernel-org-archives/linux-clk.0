Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50769 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1423020AbdDURkH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 13:40:07 -0400
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com,
        cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org,
        jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Fri, 21 Apr 2017 19:19:45 +0200
Message-id: <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The existing enable/disable ops for PLL35XX are made more generic
and used also for PLL36XX. This fixes issues in the kernel with
PLL36XX PLLs when the PLL has not been already enabled by bootloader.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 85 +++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 5229089..10c76eb 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -23,6 +23,10 @@ struct samsung_clk_pll {
 	struct clk_hw		hw;
 	void __iomem		*lock_reg;
 	void __iomem		*con_reg;
+	/* PLL enable control bit offset in @con_reg register */
+	unsigned short		enable_offs;
+	/* PLL lock status bit offset in @con_reg register */
+	unsigned short		lock_offs;
 	enum samsung_pll_type	type;
 	unsigned int		rate_count;
 	const struct samsung_pll_rate_table *rate_table;
@@ -61,6 +65,34 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
 	return rate_table[i - 1].rate;
 }
 
+static int samsung_pll3xxx_enable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp |= BIT(pll->enable_offs);
+	writel_relaxed(tmp, pll->con_reg);
+
+	/* wait lock time */
+	do {
+		cpu_relax();
+		tmp = readl_relaxed(pll->con_reg);
+	} while (!(tmp & BIT(pll->lock_offs)));
+
+	return 0;
+}
+
+static void samsung_pll3xxx_disable(struct clk_hw *hw)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 tmp;
+
+	tmp = readl_relaxed(pll->con_reg);
+	tmp |= BIT(pll->enable_offs);
+	writel_relaxed(tmp, pll->con_reg);
+}
+
 /*
  * PLL2126 Clock Type
  */
@@ -142,34 +174,6 @@ static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw,
 #define PLL35XX_LOCK_STAT_SHIFT	(29)
 #define PLL35XX_ENABLE_SHIFT	(31)
 
-static int samsung_pll35xx_enable(struct clk_hw *hw)
-{
-	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp;
-
-	tmp = readl_relaxed(pll->con_reg);
-	tmp |= BIT(PLL35XX_ENABLE_SHIFT);
-	writel_relaxed(tmp, pll->con_reg);
-
-	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
-
-	return 0;
-}
-
-static void samsung_pll35xx_disable(struct clk_hw *hw)
-{
-	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp;
-
-	tmp = readl_relaxed(pll->con_reg);
-	tmp &= ~BIT(PLL35XX_ENABLE_SHIFT);
-	writel_relaxed(tmp, pll->con_reg);
-}
-
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
@@ -239,11 +243,11 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(tmp, pll->con_reg);
 
 	/* wait_lock_time if enabled */
-	if (tmp & BIT(PLL35XX_ENABLE_SHIFT)) {
+	if (tmp & BIT(pll->enable_offs)) {
 		do {
 			cpu_relax();
 			tmp = readl_relaxed(pll->con_reg);
-		} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
+		} while (!(tmp & BIT(pll->lock_offs)));
 	}
 	return 0;
 }
@@ -252,8 +256,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	.recalc_rate = samsung_pll35xx_recalc_rate,
 	.round_rate = samsung_pll_round_rate,
 	.set_rate = samsung_pll35xx_set_rate,
-	.enable = samsung_pll35xx_enable,
-	.disable = samsung_pll35xx_disable,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
 };
 
 static const struct clk_ops samsung_pll35xx_clk_min_ops = {
@@ -275,6 +279,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 #define PLL36XX_SDIV_SHIFT	(0)
 #define PLL36XX_KDIV_SHIFT	(0)
 #define PLL36XX_LOCK_STAT_SHIFT	(29)
+#define PLL36XX_ENABLE_SHIFT	(31)
 
 static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
@@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(pll_con1, pll->con_reg + 4);
 
 	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
+	if (pll_con0 & BIT(pll->enable_offs)) {
+		do {
+			cpu_relax();
+			tmp = readl_relaxed(pll->con_reg);
+		} while (!(tmp & BIT(PLL36XX_LOCK_STAT_SHIFT)));
+	}
 
 	return 0;
 }
@@ -366,6 +373,8 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	.recalc_rate = samsung_pll36xx_recalc_rate,
 	.set_rate = samsung_pll36xx_set_rate,
 	.round_rate = samsung_pll_round_rate,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
 };
 
 static const struct clk_ops samsung_pll36xx_clk_min_ops = {
@@ -1288,6 +1297,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
+		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
 			init.ops = &samsung_pll35xx_clk_min_ops;
 		else
@@ -1306,6 +1317,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	/* clk_ops for 36xx and 2650 are similar */
 	case pll_36xx:
 	case pll_2650:
+		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
+		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
 			init.ops = &samsung_pll36xx_clk_min_ops;
 		else
-- 
1.9.1

