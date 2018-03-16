Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/8] clk: renesas: r8a7740: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:18 +0100
Message-Id: <1521207622-3311-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-r8a7740.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 2f7ce6696b6c0f1d..d074f8e982d0851c 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -98,20 +98,20 @@ r8a7740_cpg_register_clock(struct device_node *np, struct r8a7740_cpg *cpg,
 		 * clock implementation and we currently have no need to change
 		 * the multiplier value.
 		 */
-		u32 value = clk_readl(cpg->reg + CPG_FRQCRC);
+		u32 value = readl(cpg->reg + CPG_FRQCRC);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x7f) + 1;
 	} else if (!strcmp(name, "pllc1")) {
-		u32 value = clk_readl(cpg->reg + CPG_FRQCRA);
+		u32 value = readl(cpg->reg + CPG_FRQCRA);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x7f) + 1;
 		div = 2;
 	} else if (!strcmp(name, "pllc2")) {
-		u32 value = clk_readl(cpg->reg + CPG_PLLC2CR);
+		u32 value = readl(cpg->reg + CPG_PLLC2CR);
 		parent_name = "system";
 		mult = ((value >> 24) & 0x3f) + 1;
 	} else if (!strcmp(name, "usb24s")) {
-		u32 value = clk_readl(cpg->reg + CPG_USBCKCR);
+		u32 value = readl(cpg->reg + CPG_USBCKCR);
 		if (value & BIT(7))
 			/* extal2 */
 			parent_name = of_clk_get_parent_name(np, 1);
-- 
2.7.4
