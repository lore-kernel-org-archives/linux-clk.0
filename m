Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] clk: renesas: r8a7796: Correct name of watchdog clock
Date: Mon, 13 Mar 2017 17:19:50 +0100
Message-Id: <1489421994-19707-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

There's only a single watchdog clock, and it's named "rwdt".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 12a23c18bc1e7eb5..55003194a2561c95 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -135,7 +135,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("sdif2",		 312,	R8A7796_CLK_SD2),
 	DEF_MOD("sdif1",		 313,	R8A7796_CLK_SD1),
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
-	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
+	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
 	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
 	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
-- 
2.7.4
