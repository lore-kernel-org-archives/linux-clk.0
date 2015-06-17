Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
To: sboyd@codeaurora.org,
	mturquette@linaro.org
Cc: lho@apm.com,
	ksankaran@apm.com,
	fkan@apm.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2] clk: xgene: Delete duplicated name field
Date: Wed, 17 Jun 2015 23:28:49 +0200
Message-Id: <1434576529-4183-1-git-send-email-matthias.bgg@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

X-Gene clocks implement it's name in the clock private struct.
This is a duplication of the name field. We can delete the field
and rely on the common implementation to retrieve the name.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/clk-xgene.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index f26b3ac..4caee93 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -60,7 +60,6 @@ enum xgene_pll_type {
 
 struct xgene_clk_pll {
 	struct clk_hw	hw;
-	const char	*name;
 	void __iomem	*reg;
 	spinlock_t	*lock;
 	u32		pll_offset;
@@ -75,7 +74,7 @@ static int xgene_clk_pll_is_enabled(struct clk_hw *hw)
 	u32 data;
 
 	data = xgene_clk_read(pllclk->reg + pllclk->pll_offset);
-	pr_debug("%s pll %s\n", pllclk->name,
+	pr_debug("%s pll %s\n", __clk_get_name(hw->clk),
 		data & REGSPEC_RESET_F1_MASK ? "disabled" : "enabled");
 
 	return data & REGSPEC_RESET_F1_MASK ? 0 : 1;
@@ -113,7 +112,7 @@ static unsigned long xgene_clk_pll_recalc_rate(struct clk_hw *hw,
 		fref = parent_rate / nref;
 		fvco = fref * nfb;
 	}
-	pr_debug("%s pll recalc rate %ld parent %ld\n", pllclk->name,
+	pr_debug("%s pll recalc rate %ld parent %ld\n", __clk_get_name(hw->clk),
 		fvco / nout, parent_rate);
 
 	return fvco / nout;
@@ -146,7 +145,6 @@ static struct clk *xgene_register_clk_pll(struct device *dev,
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
 
-	apmclk->name = name;
 	apmclk->reg = reg;
 	apmclk->lock = lock;
 	apmclk->pll_offset = pll_offset;
@@ -210,7 +208,6 @@ struct xgene_dev_parameters {
 
 struct xgene_clk {
 	struct clk_hw	hw;
-	const char	*name;
 	spinlock_t	*lock;
 	struct xgene_dev_parameters	param;
 };
@@ -228,7 +225,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		spin_lock_irqsave(pclk->lock, flags);
 
 	if (pclk->param.csr_reg != NULL) {
-		pr_debug("%s clock enabled\n", pclk->name);
+		pr_debug("%s clock enabled\n", __clk_get_name(hw->clk));
 		reg = __pa(pclk->param.csr_reg);
 		/* First enable the clock */
 		data = xgene_clk_read(pclk->param.csr_reg +
@@ -237,7 +234,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
 		pr_debug("%s clock PADDR base %pa clk offset 0x%08X mask 0x%08X value 0x%08X\n",
-			pclk->name, &reg,
+			__clk_get_name(hw->clk), &reg,
 			pclk->param.reg_clk_offset, pclk->param.reg_clk_mask,
 			data);
 
@@ -248,7 +245,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
 		xgene_clk_write(data, pclk->param.csr_reg +
 					pclk->param.reg_csr_offset);
 		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
-			pclk->name, &reg,
+			__clk_get_name(hw->clk), &reg,
 			pclk->param.reg_csr_offset, pclk->param.reg_csr_mask,
 			data);
 	}
@@ -269,7 +266,7 @@ static void xgene_clk_disable(struct clk_hw *hw)
 		spin_lock_irqsave(pclk->lock, flags);
 
 	if (pclk->param.csr_reg != NULL) {
-		pr_debug("%s clock disabled\n", pclk->name);
+		pr_debug("%s clock disabled\n", __clk_get_name(hw->clk));
 		/* First put the CSR in reset */
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_csr_offset);
@@ -295,10 +292,10 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
 	u32 data = 0;
 
 	if (pclk->param.csr_reg != NULL) {
-		pr_debug("%s clock checking\n", pclk->name);
+		pr_debug("%s clock checking\n", __clk_get_name(hw->clk));
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
-		pr_debug("%s clock is %s\n", pclk->name,
+		pr_debug("%s clock is %s\n", __clk_get_name(hw->clk),
 			data & pclk->param.reg_clk_mask ? "enabled" :
 							"disabled");
 	}
@@ -321,11 +318,13 @@ static unsigned long xgene_clk_recalc_rate(struct clk_hw *hw,
 		data &= (1 << pclk->param.reg_divider_width) - 1;
 
 		pr_debug("%s clock recalc rate %ld parent %ld\n",
-			pclk->name, parent_rate / data, parent_rate);
+			__clk_get_name(hw->clk),
+			parent_rate / data, parent_rate);
+
 		return parent_rate / data;
 	} else {
 		pr_debug("%s clock recalc rate %ld parent %ld\n",
-			pclk->name, parent_rate, parent_rate);
+			__clk_get_name(hw->clk), parent_rate, parent_rate);
 		return parent_rate;
 	}
 }
@@ -357,7 +356,7 @@ static int xgene_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		data |= divider;
 		xgene_clk_write(data, pclk->param.divider_reg +
 					pclk->param.reg_divider_offset);
-		pr_debug("%s clock set rate %ld\n", pclk->name,
+		pr_debug("%s clock set rate %ld\n", __clk_get_name(hw->clk),
 			parent_rate / divider_save);
 	} else {
 		divider_save = 1;
@@ -419,7 +418,6 @@ static struct clk *xgene_register_clk(struct device *dev,
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
 
-	apmclk->name = name;
 	apmclk->lock = lock;
 	apmclk->hw.init = &init;
 	apmclk->param = *parameters;
-- 
1.9.1
