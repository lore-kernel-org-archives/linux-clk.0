Return-Path: <chris.paterson2@renesas.com>
From: Chris Paterson <chris.paterson2@renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	ramesh.shanmugasundaram@bp.renesas.com,
	Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 2/3] clk: renesas: r8a7796: Add CANFD clock
Date: Tue, 22 Nov 2016 13:46:01 +0000
Message-Id: <1479822362-4749-3-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
References: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 99b19ce..b461383 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -103,6 +103,7 @@ enum clk_ids {
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
 
+	DEF_DIV6P1("canfd",     R8A7796_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A7796_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 
 	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
-- 
1.9.1
