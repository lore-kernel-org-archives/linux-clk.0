Return-Path: <ramesh.shanmugasundaram@bp.renesas.com>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH] clk: renesas: r8a7796: Add DRIF clock
Date: Thu, 13 Oct 2016 10:31:48 +0100
Message-Id: <1476351108-54370-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

This patch adds DRIF module clocks for r8a7796 SoC.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
Hi Geert, All,

   This patch is based on renesas-drivers repo (tag:renesas-drivers-2016-10-04-v4.8)

Thanks,
Ramesh.
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index f0302fb..f2f56e1 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -128,6 +128,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif5",		 510,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif4",		 511,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif3",		 512,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif2",		 513,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif1",		 514,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif0",		 515,	R8A7796_CLK_S3D2),
 	DEF_MOD("hscif4",		 516,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif3",		 517,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif2",		 518,	R8A7796_CLK_S3D1),
-- 
1.9.1
