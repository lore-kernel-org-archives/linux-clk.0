Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7795: Correct pwm, gpio, and i2c parent clocks on ES2.0
Date: Thu, 11 May 2017 11:51:15 +0200
Message-Id: <1494496275-2433-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Cfr. the errata of April 14, 2017, for the R-Car Gen3 Hardware Manual
Rev. 0.53E.

These have no user-visible effect, as the clock frequencies stay the
same.

Fixes: 5573d194128b4733 ("clk: renesas: r8a7795: Add support for R-Car H3 ES2.0")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.13.

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 39 ++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 5808803cec487774..c091a8e024b88d32 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -166,7 +166,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("hscif1",		 519,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif0",		 520,	R8A7795_CLK_S3D1),
 	DEF_MOD("thermal",		 522,	R8A7795_CLK_CP),
-	DEF_MOD("pwm",			 523,	R8A7795_CLK_S3D4),
+	DEF_MOD("pwm",			 523,	R8A7795_CLK_S0D12),
 	DEF_MOD("fcpvd3",		 600,	R8A7795_CLK_S2D1), /* ES1.x */
 	DEF_MOD("fcpvd2",		 601,	R8A7795_CLK_S0D2),
 	DEF_MOD("fcpvd1",		 602,	R8A7795_CLK_S0D2),
@@ -222,22 +222,22 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("imr2",			 821,	R8A7795_CLK_S0D2),
 	DEF_MOD("imr1",			 822,	R8A7795_CLK_S0D2),
 	DEF_MOD("imr0",			 823,	R8A7795_CLK_S0D2),
-	DEF_MOD("gpio7",		 905,	R8A7795_CLK_CP),
-	DEF_MOD("gpio6",		 906,	R8A7795_CLK_CP),
-	DEF_MOD("gpio5",		 907,	R8A7795_CLK_CP),
-	DEF_MOD("gpio4",		 908,	R8A7795_CLK_CP),
-	DEF_MOD("gpio3",		 909,	R8A7795_CLK_CP),
-	DEF_MOD("gpio2",		 910,	R8A7795_CLK_CP),
-	DEF_MOD("gpio1",		 911,	R8A7795_CLK_CP),
-	DEF_MOD("gpio0",		 912,	R8A7795_CLK_CP),
+	DEF_MOD("gpio7",		 905,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio6",		 906,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio5",		 907,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio4",		 908,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio3",		 909,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio2",		 910,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio1",		 911,	R8A7795_CLK_S3D4),
+	DEF_MOD("gpio0",		 912,	R8A7795_CLK_S3D4),
 	DEF_MOD("can-fd",		 914,	R8A7795_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A7795_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A7795_CLK_S3D4),
-	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S3D2),
-	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S3D2),
+	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S0D6),
+	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c-dvfs",		 926,	R8A7795_CLK_CP),
-	DEF_MOD("i2c4",			 927,	R8A7795_CLK_S3D2),
-	DEF_MOD("i2c3",			 928,	R8A7795_CLK_S3D2),
+	DEF_MOD("i2c4",			 927,	R8A7795_CLK_S0D6),
+	DEF_MOD("i2c3",			 928,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c1",			 930,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c0",			 931,	R8A7795_CLK_S3D2),
@@ -350,6 +350,7 @@ static const struct mssr_mod_reparent r8a7795es1_mod_reparent[] __initconst = {
 	{ MOD_CLK_ID(219), R8A7795_CLK_S3D1 },	/* SYS-DMAC0 */
 	{ MOD_CLK_ID(501), R8A7795_CLK_S3D1 },	/* AUDMAC1 */
 	{ MOD_CLK_ID(502), R8A7795_CLK_S3D1 },	/* AUDMAC0 */
+	{ MOD_CLK_ID(523), R8A7795_CLK_S3D4 },	/* PWM */
 	{ MOD_CLK_ID(601), R8A7795_CLK_S2D1 },	/* FCPVD2 */
 	{ MOD_CLK_ID(602), R8A7795_CLK_S2D1 },	/* FCPVD1 */
 	{ MOD_CLK_ID(603), R8A7795_CLK_S2D1 },	/* FCPVD0 */
@@ -380,6 +381,18 @@ static const struct mssr_mod_reparent r8a7795es1_mod_reparent[] __initconst = {
 	{ MOD_CLK_ID(821), R8A7795_CLK_S2D1 },	/* IMR2 */
 	{ MOD_CLK_ID(822), R8A7795_CLK_S2D1 },	/* IMR1 */
 	{ MOD_CLK_ID(823), R8A7795_CLK_S2D1 },	/* IMR0 */
+	{ MOD_CLK_ID(905), R8A7795_CLK_CP },	/* GPIO7 */
+	{ MOD_CLK_ID(906), R8A7795_CLK_CP },	/* GPIO6 */
+	{ MOD_CLK_ID(907), R8A7795_CLK_CP },	/* GPIO5 */
+	{ MOD_CLK_ID(908), R8A7795_CLK_CP },	/* GPIO4 */
+	{ MOD_CLK_ID(909), R8A7795_CLK_CP },	/* GPIO3 */
+	{ MOD_CLK_ID(910), R8A7795_CLK_CP },	/* GPIO2 */
+	{ MOD_CLK_ID(911), R8A7795_CLK_CP },	/* GPIO1 */
+	{ MOD_CLK_ID(912), R8A7795_CLK_CP },	/* GPIO0 */
+	{ MOD_CLK_ID(918), R8A7795_CLK_S3D2 },	/* I2C6 */
+	{ MOD_CLK_ID(919), R8A7795_CLK_S3D2 },	/* I2C5 */
+	{ MOD_CLK_ID(927), R8A7795_CLK_S3D2 },	/* I2C4 */
+	{ MOD_CLK_ID(928), R8A7795_CLK_S3D2 },	/* I2C3 */
 };
 
 
-- 
2.7.4
