Return-Path: <ramesh.shanmugasundaram@bp.renesas.com>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	laurent.pinchart+renesas@ideasonboard.com,
	geert+renesas@glider.be
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH] clk: renesas: r8a7795: Add DRIF clock
Date: Fri, 17 Jun 2016 13:25:14 +0100
Message-Id: <1466166314-10996-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

This patch adds DRIF module clocks for r8a7795 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ad01b0b..b9485ab 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -138,6 +138,14 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
+	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif6",		 509,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif5",		 510,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif4",		 511,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif3",		 512,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif2",		 513,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif1",		 514,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif0",		 515,	R8A7795_CLK_S3D2),
 	DEF_MOD("hscif4",		 516,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif3",		 517,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif2",		 518,	R8A7795_CLK_S3D1),
-- 
1.9.1
