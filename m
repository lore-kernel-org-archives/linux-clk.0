Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:45086 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903AbcHLQi5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2016 12:38:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/PROTO 8/9 option 3] clk: divider: Add hack to support dummy clocks
Date: Fri, 12 Aug 2016 18:38:44 +0200
Message-Id: <1471019925-29083-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471019925-29083-1-git-send-email-geert+renesas@glider.be>
References: <1471019925-29083-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allow registering dummy divider clocks that do not operate on an actual
hardware register (reg = NULL), for testing clock algorithms.

Not-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
---
 drivers/clk/clk-divider.c    | 33 +++++++++++++++++++++++----------
 include/linux/clk-provider.h |  1 +
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 96386ffc84835f12..cd1caea76d6243ec 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -141,8 +141,12 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_readl(divider->reg) >> divider->shift;
-	val &= div_mask(divider->width);
+	if (divider->reg) {
+		val = clk_readl(divider->reg) >> divider->shift;
+		val &= div_mask(divider->width);
+	} else {
+		val = divider->reg_val;
+	}
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
 				   divider->flags);
@@ -352,8 +356,12 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* if read only, just return current value */
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
-		bestdiv = clk_readl(divider->reg) >> divider->shift;
-		bestdiv &= div_mask(divider->width);
+		if (divider->reg) {
+			bestdiv = clk_readl(divider->reg) >> divider->shift;
+			bestdiv &= div_mask(divider->width);
+		} else {
+			bestdiv = divider->reg_val;
+		}
 		bestdiv = _get_div(divider->table, bestdiv, divider->flags,
 			divider->width);
 		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
@@ -396,14 +404,19 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__acquire(divider->lock);
 
-	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
-		val = div_mask(divider->width) << (divider->shift + 16);
+	if (divider->reg) {
+		if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
+			val = div_mask(divider->width) << (divider->shift + 16);
+		} else {
+			val = clk_readl(divider->reg);
+			val &= ~(div_mask(divider->width) << divider->shift);
+		}
+		val |= value << divider->shift;
+		clk_writel(val, divider->reg);
 	} else {
-		val = clk_readl(divider->reg);
-		val &= ~(div_mask(divider->width) << divider->shift);
+		pr_info("Setting %pC to value 0x%x\n", hw->clk, value);
+		divider->reg_val = value;
 	}
-	val |= value << divider->shift;
-	clk_writel(val, divider->reg);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a39c0c530778251b..8aea584750f17a74 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -389,6 +389,7 @@ struct clk_div_table {
 struct clk_divider {
 	struct clk_hw	hw;
 	void __iomem	*reg;
+	unsigned int reg_val;	// FIXME if reg is NULL
 	u8		shift;
 	u8		width;
 	u8		flags;
-- 
1.9.1

