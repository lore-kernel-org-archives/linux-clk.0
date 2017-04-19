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
Subject: [PATCH] clk: renesas: r8a7796: Add Sound SSI clock
Date: Thu, 20 Apr 2017 02:46:34 +0900
Message-Id: <1492624001-3758-14-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch adds SSI(all) and SSI{0,1,2,3,4,5,6,7,8,9} clocks for R8A7796
SoC.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 27afd48..9be8187 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -208,6 +208,17 @@ enum clk_ids {
 	DEF_MOD("i2c2",			 929,	R8A7796_CLK_S3D2),
 	DEF_MOD("i2c1",			 930,	R8A7796_CLK_S3D2),
 	DEF_MOD("i2c0",			 931,	R8A7796_CLK_S3D2),
+	DEF_MOD("ssi-all",		1005,	R8A7796_CLK_S3D4),
+	DEF_MOD("ssi9",			1006,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi8",			1007,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi7",			1008,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi6",			1009,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi5",			1010,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi4",			1011,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi3",			1012,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi2",			1013,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
+	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
 };
 
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
-- 
1.9.1
