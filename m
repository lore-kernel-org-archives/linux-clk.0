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
Subject: [PATCH] clk: renesas: r8a7796: Add EHCI/OHCI clocks
Date: Thu, 20 Apr 2017 02:46:27 +0900
Message-Id: <1492624001-3758-7-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch adds EHCI/OHCI{0,1} clocks for R8A7796 SoC.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 1d8c5c2..c6c5026 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -165,6 +165,8 @@ enum clk_ids {
 	DEF_MOD("vspd0",		 623,	R8A7796_CLK_S0D2),
 	DEF_MOD("vspb",			 626,	R8A7796_CLK_S0D1),
 	DEF_MOD("vspi0",		 631,	R8A7796_CLK_S0D1),
+	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D4),
+	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D4),
 	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
 	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
 	DEF_MOD("du2",			 722,	R8A7796_CLK_S2D1),
-- 
1.9.1
