Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/8] clk: renesas: r8a73a4: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:17 +0100
Message-Id: <1521207622-3311-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-r8a73a4.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 28d204bb659e7879..7b903ce4c9015ad7 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -71,7 +71,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 
 
 	if (!strcmp(name, "main")) {
-		u32 ckscr = clk_readl(cpg->reg + CPG_CKSCR);
+		u32 ckscr = readl(cpg->reg + CPG_CKSCR);
 
 		switch ((ckscr >> 28) & 3) {
 		case 0:	/* extal1 */
@@ -95,14 +95,14 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 		 * clock implementation and we currently have no need to change
 		 * the multiplier value.
 		 */
-		u32 value = clk_readl(cpg->reg + CPG_PLL0CR);
+		u32 value = readl(cpg->reg + CPG_PLL0CR);
 
 		parent_name = "main";
 		mult = ((value >> 24) & 0x7f) + 1;
 		if (value & BIT(20))
 			div = 2;
 	} else if (!strcmp(name, "pll1")) {
-		u32 value = clk_readl(cpg->reg + CPG_PLL1CR);
+		u32 value = readl(cpg->reg + CPG_PLL1CR);
 
 		parent_name = "main";
 		/* XXX: enable bit? */
@@ -125,7 +125,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 		default:
 			return ERR_PTR(-EINVAL);
 		}
-		value = clk_readl(cpg->reg + cr);
+		value = readl(cpg->reg + cr);
 		switch ((value >> 5) & 7) {
 		case 0:
 			parent_name = "main";
@@ -161,8 +161,7 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 			shift = 0;
 		}
 		div *= 32;
-		mult = 0x20 - ((clk_readl(cpg->reg + CPG_FRQCRC) >> shift)
-		       & 0x1f);
+		mult = 0x20 - ((readl(cpg->reg + CPG_FRQCRC) >> shift) & 0x1f);
 	} else {
 		struct div4_clk *c;
 
-- 
2.7.4
