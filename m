Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
CC: <geert+renesas@glider.be>, <horms@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a7795: Fix SD clocks
Date: Wed, 13 Jul 2016 12:20:49 +0900
Message-ID: <1468380049-5712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

According to the datasheet, SDn clocks are from the SDSRC clock. And
the SDSRC has a 1/2 divider. So, we should have ".sdsrc" as an internal
core clock. Otherwise, since the sdhi driver will calculate clock for
a sd card using the wrong parent clock rate, and then performance will
be not good.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ca5519c..5f99f7c 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -91,6 +91,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_FIXED(".s1",        CLK_S1,            CLK_PLL1_DIV2,  3, 1),
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
+	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
 
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
@@ -109,10 +110,10 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_PLL1_DIV2, 0x0074),
-	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_PLL1_DIV2, 0x0078),
-	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_PLL1_DIV2, 0x0268),
-	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_PLL1_DIV2, 0x026c),
+	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC, 0x0074),
+	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC, 0x0078),
+	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC, 0x0268),
+	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC, 0x026c),
 
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
-- 
1.9.1
