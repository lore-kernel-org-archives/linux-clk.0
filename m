Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77980: Correct parent clock of PCIEC0
Date: Mon,  9 Apr 2018 14:29:22 +0200
Message-Id: <1523276962-5465-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to the R-Car Gen3 Hardware Manual Errata for Rev 0.80 of
December 22, 2017, the parent clock of the PCIe module clock on R-Car
V3H is S2D2.

Fixes: ce15783c510a9905 ("clk: renesas: cpg-mssr: add R8A77980 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.18.

 drivers/clk/renesas/r8a77980-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 7aaae73a321a216f..d7ebd9ec00594fc8 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -116,7 +116,7 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 	DEF_MOD("sys-dmac1",		 218,	R8A77980_CLK_S0D3),
 	DEF_MOD("tpu0",			 304,	R8A77980_CLK_S3D4),
 	DEF_MOD("sdif",			 314,	R8A77980_CLK_SD0),
-	DEF_MOD("pciec0",		 319,	R8A77980_CLK_S3D1),
+	DEF_MOD("pciec0",		 319,	R8A77980_CLK_S2D2),
 	DEF_MOD("intc-ex",		 407,	R8A77980_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A77980_CLK_S0D3),
 	DEF_MOD("hscif3",		 517,	R8A77980_CLK_S3D1),
-- 
2.7.4
