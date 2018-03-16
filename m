Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 8/8] clk: renesas: rcar-gen3: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:22 +0100
Message-Id: <1521207622-3311-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The R-Car Gen3 CPG/MSSR driver (again) uses a mix of
clk_readl()/clk_writel() and readl()/writel() to access the clock
registers. Settle on the generic readl()/writel().

Cfr. commit 30ad3cf00e94f4a7 ("clk: renesas: rcar-gen3-cpg: Always use
readl()/writel()").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 0c8fe10d57fe2942..628b63b85d3f09c5 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -93,7 +93,7 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 	unsigned int mult;
 	u32 val;
 
-	val = clk_readl(zclk->reg) & zclk->mask;
+	val = readl(zclk->reg) & zclk->mask;
 	mult = 32 - (val >> __ffs(zclk->mask));
 
 	/* Factor of 2 is for fixed divider */
@@ -125,20 +125,20 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * 2, parent_rate);
 	mult = clamp(mult, 1U, 32U);
 
-	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	val = clk_readl(zclk->reg) & ~zclk->mask;
+	val = readl(zclk->reg) & ~zclk->mask;
 	val |= ((32 - mult) << __ffs(zclk->mask)) & zclk->mask;
-	clk_writel(val, zclk->reg);
+	writel(val, zclk->reg);
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
 	 * clock change completion.
 	 */
-	kick = clk_readl(zclk->kick_reg);
+	kick = readl(zclk->kick_reg);
 	kick |= CPG_FRQCRB_KICK;
-	clk_writel(kick, zclk->kick_reg);
+	writel(kick, zclk->kick_reg);
 
 	/*
 	 * Note: There is no HW information about the worst case latency.
@@ -150,7 +150,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * "super" safe value.
 	 */
 	for (i = 1000; i; i--) {
-		if (!(clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
 			return 0;
 
 		cpu_relax();
-- 
2.7.4
