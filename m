Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org,
	Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a7796: Add USB3.0 clock
Date: Wed, 26 Jul 2017 20:23:39 +0900
Message-Id: <1501068219-3834-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds USB3.0-IF0 clock for R8A7796 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index acc6d0f..eaaf663 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -138,6 +138,7 @@ enum clk_ids {
 	DEF_MOD("sdif0",		 314,	R8A7796_CLK_SD0),
 	DEF_MOD("pcie1",		 318,	R8A7796_CLK_S3D1),
 	DEF_MOD("pcie0",		 319,	R8A7796_CLK_S3D1),
+	DEF_MOD("usb3-if0",		 328,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7796_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7796_CLK_S3D1),
 	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
-- 
1.9.1
