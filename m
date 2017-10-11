Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: r8a7795: Correct parent clock of INTC-AP
Date: Wed, 11 Oct 2017 10:29:50 +0200
Message-Id: <1507710592-13740-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
References: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to the R-Car Gen3 Hardware Manual Errata for Rev 0.55 of
September 8, 2017, the parent clock of the INTC-AP module clock on R-Car
H3 ES2.0 is S0D3.

This change has no functional impact.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 1c931d8ec0ccba24..775b0ceaa3378a83 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -151,7 +151,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
 	DEF_MOD("rwdt",			 402,	R8A7795_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
-	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
+	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S0D3),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S0D3),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S0D3),
 	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
@@ -350,6 +350,7 @@ static const struct mssr_mod_reparent r8a7795es1_mod_reparent[] __initconst = {
 	{ MOD_CLK_ID(217), R8A7795_CLK_S3D1 },	/* SYS-DMAC2 */
 	{ MOD_CLK_ID(218), R8A7795_CLK_S3D1 },	/* SYS-DMAC1 */
 	{ MOD_CLK_ID(219), R8A7795_CLK_S3D1 },	/* SYS-DMAC0 */
+	{ MOD_CLK_ID(408), R8A7795_CLK_S3D1 },	/* INTC-AP */
 	{ MOD_CLK_ID(501), R8A7795_CLK_S3D1 },	/* AUDMAC1 */
 	{ MOD_CLK_ID(502), R8A7795_CLK_S3D1 },	/* AUDMAC0 */
 	{ MOD_CLK_ID(523), R8A7795_CLK_S3D4 },	/* PWM */
-- 
2.7.4
