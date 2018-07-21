Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	carlo@caione.org,
	khilman@baylibre.com,
	linux-clk@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] clk: meson: meson8b: use the regmap in the internal reset controller
Date: Sat, 21 Jul 2018 21:14:00 +0200
Message-Id: <20180721191400.15558-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180721191400.15558-1-martin.blumenstingl@googlemail.com>
References: <20180721191400.15558-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

For now the reset controller was using raw register access because the
early init did not initialize the regmap. However, now that clocks are
initialized early we can simply use the regmap also for the reset
controller.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1caaa780201b..e961ee9fec20 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -23,7 +23,7 @@ static DEFINE_SPINLOCK(meson_clk_lock);
 
 struct meson8b_clk_reset {
 	struct reset_controller_dev reset;
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static const struct pll_rate_table sys_pll_rate_table[] = {
@@ -1059,7 +1059,6 @@ static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
 		container_of(rcdev, struct meson8b_clk_reset, reset);
 	unsigned long flags;
 	const struct meson8b_clk_reset_line *reset;
-	u32 val;
 
 	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
 		return -EINVAL;
@@ -1068,12 +1067,12 @@ static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&meson_clk_lock, flags);
 
-	val = readl(meson8b_clk_reset->base + reset->reg);
 	if (assert)
-		val |= BIT(reset->bit_idx);
+		regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
+				   BIT(reset->bit_idx), BIT(reset->bit_idx));
 	else
-		val &= ~BIT(reset->bit_idx);
-	writel(val, meson8b_clk_reset->base + reset->reg);
+		regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
+				   BIT(reset->bit_idx), 0);
 
 	spin_unlock_irqrestore(&meson_clk_lock, flags);
 
@@ -1126,7 +1125,7 @@ static void __init meson8b_clkc_init(struct device_node *np)
 		return;
 
 	/* Reset Controller */
-	rstc->base = clk_base;
+	rstc->regmap = map;
 	rstc->reset.ops = &meson8b_clk_reset_ops;
 	rstc->reset.nr_resets = ARRAY_SIZE(meson8b_clk_reset_bits);
 	rstc->reset.of_node = np;
-- 
2.18.0
