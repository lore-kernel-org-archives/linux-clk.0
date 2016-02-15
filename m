Return-Path: <magnus.damm@gmail.com>
Return-Path: <magnus.damm@gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: mturquette@baylibre.com,horms@verge.net.au,geert@linux-m68k.org,laurent.pinchart@ideasonboard.com,Magnus Damm <magnus.damm@gmail.com>,linux-clk@vger.kernel.org
Date: Mon, 15 Feb 2016 21:24:32 +0900
Message-Id: <20160215122432.28998.18180.sendpatchset@little-apple>
Subject: [PATCH] clk: shmobile: r8a7795: Add INTC-EX clock
List-ID: <linux-clk.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add the "intc-ex" clock to the r8a7795 CPG MSSR driver.

The parent clock is assumed to be S3D1 since other INTC
hardware is using this clock.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2016-02-09-v4.5-rc3

 drivers/clk/shmobile/r8a7795-cpg-mssr.c |    1 +
 1 file changed, 1 insertion(+)

--- 0001/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ work/drivers/clk/shmobile/r8a7795-cpg-mssr.c	2016-02-15 21:18:16.530513000 +0900
@@ -138,6 +138,7 @@ static const struct mssr_mod_clk r8a7795
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
+	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_S3D1),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
