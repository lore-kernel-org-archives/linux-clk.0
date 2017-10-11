Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: r8a7796: Correct parent clock of INTC-AP
Date: Wed, 11 Oct 2017 10:29:51 +0200
Message-Id: <1507710592-13740-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
References: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to the R-Car Gen3 Hardware Manual Errata for Rev 0.55 of
September 8, 2017, the parent clock of the INTC-AP module clock on R-Car
M3-W is S0D3.

This change has no functional impact.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 48731741b59e0c89..83a68e51e4ec1d12 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -145,7 +145,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("usb-dmac1",		 331,	R8A7796_CLK_S3D1),
 	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7796_CLK_CP),
-	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S0D3),
 	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S0D3),
 	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S0D3),
 	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
-- 
2.7.4
