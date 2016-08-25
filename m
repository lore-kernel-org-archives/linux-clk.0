Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:58837 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750971AbcHYTGF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Aug 2016 15:06:05 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Chris Brandt <chris.brandt@renesas.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
Date: Thu, 25 Aug 2016 15:05:18 -0400
Message-Id: <20160825190518.20764-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Instead of hard coding EXTAL only, check if EXTAL was specified. If not,
then assume the USB clock is used as the main system clock.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/clk-rz.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index f6312c6..466b9fc 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -37,13 +37,29 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
 
 	if (strcmp(name, "pll") == 0) {
-		/* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
-		unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
-		const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
-
-		mult = cpg_mode ? (32 / 4) : 30;
-
-		return clk_register_fixed_factor(NULL, name, parent_name, 0, mult, 1);
+		u32 freq = 0;
+		struct device_node *np;
+
+		/* If a clock-frequency for extal was specified, assume EXTAL boot */
+		np = of_find_node_by_name(NULL, "extal");
+		if( np ) {
+			of_property_read_u32(np, "clock-frequency", &freq);
+			if( freq )
+				return clk_register_fixed_factor(NULL, "pll", "extal",
+					0, 30, 1);
+		}
+
+		/* Must be USB clock boot */
+		np = of_find_node_by_name(NULL, "usb_x1");
+		if( np ) {
+			of_property_read_u32(np, "clock-frequency", &freq);
+			if( freq )
+				return clk_register_fixed_factor(NULL, "pll", "usb_x1",
+					0, (32 / 4), 1);
+		}
+
+		/* No clock frequency set in DT */
+		BUG();
 	}
 
 	/* If mapping regs failed, skip non-pll clocks. System will boot anyhow */
-- 
2.9.2


