Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7796: Add INTC-EX clock
Date: Thu, 20 Apr 2017 02:46:41 +0900
Message-Id: <1492624001-3758-21-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add the "intc-ex" clock to the R8A7796 CPG MSSR driver.

According to information from the hardware team the INTC-EX
parent clock is CP. The next data sheet version will include
this information.

[takeshi.kihara.df: Ported from commit f099aa075749 ("clk: shmobile:
 r8a7795: Add INTC-EX clock") to drivers/clk/renesas/r8a7796-cpg-mssr.c]
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index a5399f7..4d1d496 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -142,6 +142,7 @@ enum clk_ids {
 	DEF_MOD("pcie0",		 319,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7796_CLK_S3D1),
+	DEF_MOD("intc-ex",		 407,	R8A7796_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S3D4),
-- 
1.9.1
