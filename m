Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
Date: Fri, 23 Sep 2016 10:32:32 +0200
Message-Id: <1474619552-29703-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
References: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The R-Car Gen3 CPG/MSSR driver uses a mix of clk_readl()/clk_writel()
and readl()/writel() to access the clock registers. Settle on the
generic readl()/writel().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 9d76076da4948fc4..742f6dc7c15653ef 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -98,7 +98,7 @@ static int cpg_sd_clock_enable(struct clk_hw *hw)
 	u32 val, sd_fc;
 	unsigned int i;
 
-	val = clk_readl(clock->reg);
+	val = readl(clock->reg);
 
 	sd_fc = val & CPG_SD_FC_MASK;
 	for (i = 0; i < clock->div_num; i++)
@@ -111,7 +111,7 @@ static int cpg_sd_clock_enable(struct clk_hw *hw)
 	val &= ~(CPG_SD_STP_MASK);
 	val |= clock->div_table[i].val & CPG_SD_STP_MASK;
 
-	clk_writel(val, clock->reg);
+	writel(val, clock->reg);
 
 	return 0;
 }
@@ -120,14 +120,14 @@ static void cpg_sd_clock_disable(struct clk_hw *hw)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	clk_writel(clk_readl(clock->reg) | CPG_SD_STP_MASK, clock->reg);
+	writel(readl(clock->reg) | CPG_SD_STP_MASK, clock->reg);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	return !(clk_readl(clock->reg) & CPG_SD_STP_MASK);
+	return !(readl(clock->reg) & CPG_SD_STP_MASK);
 }
 
 static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
@@ -138,7 +138,7 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
 	u32 val, sd_fc;
 	unsigned int i;
 
-	val = clk_readl(clock->reg);
+	val = readl(clock->reg);
 
 	sd_fc = val & CPG_SD_FC_MASK;
 	for (i = 0; i < clock->div_num; i++)
@@ -189,10 +189,10 @@ static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= clock->div_num)
 		return -EINVAL;
 
-	val = clk_readl(clock->reg);
+	val = readl(clock->reg);
 	val &= ~(CPG_SD_STP_MASK | CPG_SD_FC_MASK);
 	val |= clock->div_table[i].val & (CPG_SD_STP_MASK | CPG_SD_FC_MASK);
-	clk_writel(val, clock->reg);
+	writel(val, clock->reg);
 
 	return 0;
 }
-- 
1.9.1
