Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: clk-conf: Do not print error messages if EPROBE_DEFER
Date: Wed,  4 Jan 2017 11:12:33 +0100
Message-Id: <1483524753-32213-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

EPROBE_DEFER is not an error, hence printing an error message like

	clk: couldn't get clock 0 for /soc/display@feb00000

may confuse the user.

Suppress error messages in case of probe deferral to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-conf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 674785d968a3e1c5..e0e02a6e59009e7a 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -40,8 +40,9 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			return 0;
 		pclk = of_clk_get_from_provider(&clkspec);
 		if (IS_ERR(pclk)) {
-			pr_warn("clk: couldn't get parent clock %d for %s\n",
-				index, node->full_name);
+			if (PTR_ERR(pclk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get parent clock %d for %s\n",
+					index, node->full_name);
 			return PTR_ERR(pclk);
 		}
 
@@ -55,8 +56,9 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 		}
 		clk = of_clk_get_from_provider(&clkspec);
 		if (IS_ERR(clk)) {
-			pr_warn("clk: couldn't get assigned clock %d for %s\n",
-				index, node->full_name);
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get assigned clock %d for %s\n",
+					index, node->full_name);
 			rc = PTR_ERR(clk);
 			goto err;
 		}
@@ -99,8 +101,9 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 
 			clk = of_clk_get_from_provider(&clkspec);
 			if (IS_ERR(clk)) {
-				pr_warn("clk: couldn't get clock %d for %s\n",
-					index, node->full_name);
+				if (PTR_ERR(clk) != -EPROBE_DEFER)
+					pr_warn("clk: couldn't get clock %d for %s\n",
+						index, node->full_name);
 				return PTR_ERR(clk);
 			}
 
-- 
1.9.1
