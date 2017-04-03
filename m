Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7745: Remove nonexisting scu-src[0789] clocks
Date: Mon,  3 Apr 2017 12:03:34 +0200
Message-Id: <1491213814-13826-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

RZ/G1E does not have the SCU-SRC[0789] modules and module clocks.

Fixes: 9127d54bb8947159 ("clk: renesas: cpg-mssr: Add R8A7745 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7745-cpg-mssr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas/r8a7745-cpg-mssr.c
index 2f15ba786c3b0ea1..08db21cc6436bdc5 100644
--- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
@@ -167,16 +167,12 @@ static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {
 	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
-	DEF_MOD("scu-src9",		1022,	MOD_CLK_ID(1017)),
-	DEF_MOD("scu-src8",		1023,	MOD_CLK_ID(1017)),
-	DEF_MOD("scu-src7",		1024,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src6",		1025,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src5",		1026,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src4",		1027,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src3",		1028,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src2",		1029,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src1",		1030,	MOD_CLK_ID(1017)),
-	DEF_MOD("scu-src0",		1031,	MOD_CLK_ID(1017)),
 	DEF_MOD("scifa3",		1106,	R8A7745_CLK_MP),
 	DEF_MOD("scifa4",		1107,	R8A7745_CLK_MP),
 	DEF_MOD("scifa5",		1108,	R8A7745_CLK_MP),
-- 
2.7.4
