Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: Remove clk_{register,unregister}_multiplier()
Date: Wed, 21 Oct 2015 16:33:53 -0700
Message-Id: <1445470433-28374-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These APIs aren't used, so remove them. This can be reverted if
we get a user at some point.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Suggested-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-multiplier.c | 51 --------------------------------------------
 include/linux/clk-provider.h |  7 ------
 2 files changed, 58 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 43ec269fcbff..fe7806506bf3 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -128,54 +128,3 @@ const struct clk_ops clk_multiplier_ops = {
 	.set_rate	= clk_multiplier_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_multiplier_ops);
-
-struct clk *clk_register_multiplier(struct device *dev, const char *name,
-				    const char *parent_name,
-				    unsigned long flags,
-				    void __iomem *reg, u8 shift, u8 width,
-				    u8 clk_mult_flags, spinlock_t *lock)
-{
-	struct clk_init_data init;
-	struct clk_multiplier *mult;
-	struct clk *clk;
-
-	mult = kmalloc(sizeof(*mult), GFP_KERNEL);
-	if (!mult)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = &clk_multiplier_ops;
-	init.flags = flags | CLK_IS_BASIC;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	mult->reg = reg;
-	mult->shift = shift;
-	mult->width = width;
-	mult->flags = clk_mult_flags;
-	mult->lock = lock;
-	mult->hw.init = &init;
-
-	clk = clk_register(dev, &mult->hw);
-	if (IS_ERR(clk))
-		kfree(mult);
-
-	return clk;
-}
-EXPORT_SYMBOL_GPL(clk_register_multiplier);
-
-void clk_unregister_multiplier(struct clk *clk)
-{
-	struct clk_multiplier *mult;
-	struct clk_hw *hw;
-
-	hw = __clk_get_hw(clk);
-	if (!hw)
-		return;
-
-	mult = to_clk_multiplier(hw);
-
-	clk_unregister(clk);
-	kfree(mult);
-}
-EXPORT_SYMBOL_GPL(clk_unregister_multiplier);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e9a4d1ea556e..837cd7c7c8a7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -554,13 +554,6 @@ struct clk_multiplier {
 
 extern const struct clk_ops clk_multiplier_ops;
 
-struct clk *clk_register_multiplier(struct device *dev, const char *name,
-				    const char *parent_name,
-				    unsigned long flags,
-				    void __iomem *reg, u8 shift, u8 width,
-				    u8 clk_mult_flags, spinlock_t *lock);
-void clk_unregister_multiplier(struct clk *clk);
-
 /***
  * struct clk_composite - aggregate clock of mux, divider and gate clocks
  *
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
