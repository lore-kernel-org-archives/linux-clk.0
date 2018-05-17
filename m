Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7795: Add CR clock
Date: Thu, 17 May 2018 12:21:02 +0200
Message-Id: <1526552462-3476-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add the CR core clock, which is used by the Secure Engine (SCEG).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Pending successfull use of the SCEG.

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 775b0ceaa3378a83..e5b186566c097dd0 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -103,6 +103,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x26c),
 
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cr",         R8A7795_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
 
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
-- 
2.7.4
