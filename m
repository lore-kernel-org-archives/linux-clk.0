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
Subject: [PATCH] clk: renesas: r8a7796: Add Sound DVC clocks
Date: Thu, 20 Apr 2017 02:46:36 +0900
Message-Id: <1492624001-3758-16-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch adds adds SCU(DVC{0,1}) clocks for R8A7796 SoC.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 9a18cb7..1e16b17 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -220,6 +220,8 @@ enum clk_ids {
 	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
 	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
 	DEF_MOD("scu-all",		1017,	R8A7796_CLK_S3D4),
+	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
+	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-ctu1-mix1",	1020,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-ctu0-mix0",	1021,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-src9",		1022,	MOD_CLK_ID(1017)),
-- 
1.9.1
