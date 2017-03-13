Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/7] clk: renesas: r8a7795: Correct parent clock and sort order for Audio DMACs
Date: Mon, 13 Mar 2017 17:19:48 +0100
Message-Id: <1489421994-19707-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The parent clock of the Audio DMACs is the "ZS" AXI bus clock, which
maps to S3D1 or R-Car H3 ES1.x.
All module clocks must be sorted by clock ID.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 2add8218e0f7a6c0..cde470ce81e449cf 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -142,8 +142,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("rwdt0",		 402,	R8A7795_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
-	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
-	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
+	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D1),
+	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D1),
 	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
 	DEF_MOD("drif6",		 509,	R8A7795_CLK_S3D2),
 	DEF_MOD("drif5",		 510,	R8A7795_CLK_S3D2),
-- 
2.7.4
