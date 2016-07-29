Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 1/2] clk: zx: reform pll config info to ease code extension
Date: Fri, 29 Jul 2016 21:58:17 +0800
Message-Id: <1469800698-9374-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add power down bit and pll lock bit in pll config structure
to ease new SoC support.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/zte/clk.c | 21 ++++++++++++---------
 drivers/clk/zte/clk.h |  4 ++++
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/zte/clk.c b/drivers/clk/zte/clk.c
index 7c73c53..c4c1251 100644
--- a/drivers/clk/zte/clk.c
+++ b/drivers/clk/zte/clk.c
@@ -21,8 +21,8 @@
 #define to_clk_zx_audio(_hw) container_of(_hw, struct clk_zx_audio, hw)
 
 #define CFG0_CFG1_OFFSET 4
-#define LOCK_FLAG BIT(30)
-#define POWER_DOWN BIT(31)
+#define LOCK_FLAG 30
+#define POWER_DOWN 31
 
 static int rate_to_idx(struct clk_zx_pll *zx_pll, unsigned long rate)
 {
@@ -50,8 +50,8 @@ static int hw_to_idx(struct clk_zx_pll *zx_pll)
 	hw_cfg1 = readl_relaxed(zx_pll->reg_base + CFG0_CFG1_OFFSET);
 
 	/* For matching the value in lookup table */
-	hw_cfg0 &= ~LOCK_FLAG;
-	hw_cfg0 |= POWER_DOWN;
+	hw_cfg0 &= ~BIT(zx_pll->lock_bit);
+	hw_cfg0 |= BIT(zx_pll->pd_bit);
 
 	for (i = 0; i < zx_pll->count; i++) {
 		if (hw_cfg0 == config[i].cfg0 && hw_cfg1 == config[i].cfg1)
@@ -108,10 +108,10 @@ static int zx_pll_enable(struct clk_hw *hw)
 	u32 reg;
 
 	reg = readl_relaxed(zx_pll->reg_base);
-	writel_relaxed(reg & ~POWER_DOWN, zx_pll->reg_base);
+	writel_relaxed(reg & ~BIT(zx_pll->pd_bit), zx_pll->reg_base);
 
 	return readl_relaxed_poll_timeout(zx_pll->reg_base, reg,
-					  reg & LOCK_FLAG, 0, 100);
+					  reg & BIT(zx_pll->lock_bit), 0, 100);
 }
 
 static void zx_pll_disable(struct clk_hw *hw)
@@ -120,7 +120,7 @@ static void zx_pll_disable(struct clk_hw *hw)
 	u32 reg;
 
 	reg = readl_relaxed(zx_pll->reg_base);
-	writel_relaxed(reg | POWER_DOWN, zx_pll->reg_base);
+	writel_relaxed(reg | BIT(zx_pll->pd_bit), zx_pll->reg_base);
 }
 
 static int zx_pll_is_enabled(struct clk_hw *hw)
@@ -130,10 +130,10 @@ static int zx_pll_is_enabled(struct clk_hw *hw)
 
 	reg = readl_relaxed(zx_pll->reg_base);
 
-	return !(reg & POWER_DOWN);
+	return !(reg & BIT(zx_pll->pd_bit));
 }
 
-static const struct clk_ops zx_pll_ops = {
+const struct clk_ops zx_pll_ops = {
 	.recalc_rate = zx_pll_recalc_rate,
 	.round_rate = zx_pll_round_rate,
 	.set_rate = zx_pll_set_rate,
@@ -141,6 +141,7 @@ static const struct clk_ops zx_pll_ops = {
 	.disable = zx_pll_disable,
 	.is_enabled = zx_pll_is_enabled,
 };
+EXPORT_SYMBOL(zx_pll_ops);
 
 struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
 				unsigned long flags, void __iomem *reg_base,
@@ -164,6 +165,8 @@ struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
 	zx_pll->reg_base = reg_base;
 	zx_pll->lookup_table = lookup_table;
 	zx_pll->count = count;
+	zx_pll->lock_bit = LOCK_FLAG;
+	zx_pll->pd_bit = POWER_DOWN;
 	zx_pll->lock = lock;
 	zx_pll->hw.init = &init;
 
diff --git a/drivers/clk/zte/clk.h b/drivers/clk/zte/clk.h
index 65ae08b..8f6b5f0 100644
--- a/drivers/clk/zte/clk.h
+++ b/drivers/clk/zte/clk.h
@@ -24,6 +24,8 @@ struct clk_zx_pll {
 	const struct zx_pll_config *lookup_table; /* order by rate asc */
 	int count;
 	spinlock_t *lock;
+	u8 pd_bit;		/* power down bit */
+	u8 lock_bit;		/* pll lock flag bit */
 };
 
 struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
@@ -38,4 +40,6 @@ struct clk_zx_audio {
 struct clk *clk_register_zx_audio(const char *name,
 				  const char * const parent_name,
 				  unsigned long flags, void __iomem *reg_base);
+
+extern const struct clk_ops zx_pll_ops;
 #endif
-- 
1.9.1
