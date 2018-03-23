Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77965: Add MSIOF controller clocks
Date: Fri, 23 Mar 2018 10:04:54 +0100
Message-Id: <1521795895-24033-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds MSIOF{0,1,2,3} clocks to the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.18.

 drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index b1acfb60351ca35b..8fae5e9c4a77242d 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -116,6 +116,10 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("scif3",		204,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif1",		206,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif0",		207,	R8A77965_CLK_S3D4),
+	DEF_MOD("msiof3",		208,	R8A77965_CLK_MSO),
+	DEF_MOD("msiof2",		209,	R8A77965_CLK_MSO),
+	DEF_MOD("msiof1",		210,	R8A77965_CLK_MSO),
+	DEF_MOD("msiof0",		211,	R8A77965_CLK_MSO),
 	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S0D3),
 	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S0D3),
 	DEF_MOD("sys-dmac0",		219,	R8A77965_CLK_S0D3),
-- 
2.7.4
