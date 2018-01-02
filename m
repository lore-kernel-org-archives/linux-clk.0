Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	ABE Hiroshige <hiroshige.abe.zc@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7796: Add FDP clock
Date: Tue,  2 Jan 2018 16:21:43 +0100
Message-Id: <1514906503-8535-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

From: ABE Hiroshige <hiroshige.abe.zc@renesas.com>

This patch adds FDP1-0 clock to the R8A7796 SoC.

Signed-off-by: ABE Hiroshige <hiroshige.abe.zc@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: s/fdp0/fdp1-0/]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This gets rid of the following error messages during boot and system
resume:

    renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 119: -2
    rcar_fdp1 fe940000.fdp1: failed to add to PM domain a3vc: -2

To be queued in clk-renesas-for-v4.16.
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 83a68e51e4ec1d12..dfb267a92f2a20d3 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -117,6 +117,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("fdp1-0",		 119,	R8A7796_CLK_S0D1),
 	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),
-- 
2.7.4
