Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a7796: Add watchdog module clock
Date: Mon, 27 Jun 2016 19:39:25 +0200
Message-Id: <1467049165-7025-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1467049165-7025-1-git-send-email-geert+renesas@glider.be>
References: <1467049165-7025-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add the module clock for the Watchdog Timer (WDT) controller on the
Renesas R-Car M3-W (r8a7796) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index ea9ed38943a3969c..c0dee762ed23bfc4 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -104,6 +104,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("scif2",		 310,	R8A7796_CLK_S3D4),
+	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
 };
 
-- 
1.9.1
