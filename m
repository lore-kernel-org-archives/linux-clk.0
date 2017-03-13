Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] clk: renesas: r8a7795: Correct name of watchdog clock
Date: Mon, 13 Mar 2017 17:19:49 +0100
Message-Id: <1489421994-19707-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

There's only a single watchdog clock, and it's named "rwdt".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index cde470ce81e449cf..4e176e7f958b133d 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -139,7 +139,7 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
-	DEF_MOD("rwdt0",		 402,	R8A7795_CLK_R),
+	DEF_MOD("rwdt",			 402,	R8A7795_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D1),
-- 
2.7.4
