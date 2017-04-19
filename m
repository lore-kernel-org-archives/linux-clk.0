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
Subject: [PATCH] clk: renesas: r8a7796: Add Audio-DMAC clocks
Date: Thu, 20 Apr 2017 02:46:28 +0900
Message-Id: <1492624001-3758-8-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds A-DMAC{0,1} clocks for R8A7796 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c6c5026..f217796 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -138,6 +138,8 @@ enum clk_ids {
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S3D4),
+	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S3D4),
 	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
 	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
 	DEF_MOD("drif5",		 510,	R8A7796_CLK_S3D2),
-- 
1.9.1
