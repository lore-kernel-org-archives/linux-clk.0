Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] clk: renesas: rza1: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:20 +0100
Message-Id: <1521207622-3311-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-rz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index 127c58135c8fec76..67dd712aa723c77c 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -75,9 +75,9 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	 * let them run at fixed current speed and implement the details later.
 	 */
 	if (strcmp(name, "i") == 0)
-		val = (clk_readl(cpg->reg + CPG_FRQCR) >> 8) & 3;
+		val = (readl(cpg->reg + CPG_FRQCR) >> 8) & 3;
 	else if (strcmp(name, "g") == 0)
-		val = clk_readl(cpg->reg + CPG_FRQCR2) & 3;
+		val = readl(cpg->reg + CPG_FRQCR2) & 3;
 	else
 		return ERR_PTR(-EINVAL);
 
-- 
2.7.4
