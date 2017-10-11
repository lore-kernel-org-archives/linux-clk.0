Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] clk: renesas: r8a77995: Correct parent clock of INTC-AP
Date: Wed, 11 Oct 2017 10:29:52 +0200
Message-Id: <1507710592-13740-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
References: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to the R-Car Gen3 Hardware Manual Errata for Rev 0.55 of
September 8, 2017, the parent clock of the INTC-AP module clock on R-Car
D3 is S1D2.

This change has no functional impact.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index e594cf8ee63b64e0..ea4cafbe6e851aca 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -127,7 +127,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 	DEF_MOD("usb-dmac1",		 331,	R8A77995_CLK_S3D1),
 	DEF_MOD("rwdt",			 402,	R8A77995_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A77995_CLK_CP),
-	DEF_MOD("intc-ap",		 408,	R8A77995_CLK_S3D1),
+	DEF_MOD("intc-ap",		 408,	R8A77995_CLK_S1D2),
 	DEF_MOD("audmac0",		 502,	R8A77995_CLK_S3D1),
 	DEF_MOD("hscif3",		 517,	R8A77995_CLK_S3D1C),
 	DEF_MOD("hscif0",		 520,	R8A77995_CLK_S3D1C),
-- 
2.7.4
