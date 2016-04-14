Return-Path: <ysato@users.sourceforge.jp>
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Add 16bit register access for clk-divider.
Date: Thu, 14 Apr 2016 16:17:43 +0900
Message-Id: <1460618263-30967-1-git-send-email-ysato@users.sourceforge.jp>
List-ID: <linux-clk.vger.kernel.org>

Some SoC use 16bit-word register. And required 16bit-word access.
This changes add 16-bit access mode.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/clk/clk-divider.c    | 10 ++++++++--
 include/linux/clk-provider.h | 13 +++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 00e035b..16026bb 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -141,7 +141,10 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_readl(divider->reg) >> divider->shift;
+	if (divider->flags & CLK_DIVIDER_WORD_REG)
+		val = clk_readw(divider->reg) >> divider->shift;
+	else
+		val = clk_readl(divider->reg) >> divider->shift;
 	val &= div_mask(divider->width);
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
@@ -403,7 +406,10 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 		val &= ~(div_mask(divider->width) << divider->shift);
 	}
 	val |= value << divider->shift;
-	clk_writel(val, divider->reg);
+	if (divider->flags & CLK_DIVIDER_WORD_REG)
+		clk_writew(val, divider->reg);
+	else
+		clk_writel(val, divider->reg);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index da95258..34f1455 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -369,6 +369,8 @@ struct clk_div_table {
  * CLK_DIVIDER_MAX_AT_ZERO - For dividers which are like CLK_DIVIDER_ONE_BASED
  *	except when the value read from the register is zero, the divisor is
  *	2^width of the field.
+ * CLK_DIVIDER_WORD_REG - The driver use 16-bit access function for register.
+ *	Usally 32-bit access.
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -389,6 +391,7 @@ struct clk_divider {
 #define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
+#define CLK_DIVIDER_WORD_REG		BIT(7)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
@@ -791,6 +794,16 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 
 #endif	/* platform dependent I/O accessors */
 
+static inline u32 clk_readw(u32 __iomem *reg)
+{
+	return readw(reg);
+}
+
+static inline void clk_writew(u32 val, u32 __iomem *reg)
+{
+	writew(val, reg);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
 				void *data, const struct file_operations *fops);
-- 
2.7.0
