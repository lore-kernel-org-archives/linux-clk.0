Return-Path: <magnus.damm@gmail.com>
Return-Path: <magnus.damm@gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: mturquette@baylibre.com,horms@verge.net.au,geert@linux-m68k.org,laurent.pinchart@ideasonboard.com,Magnus Damm <magnus.damm@gmail.com>,linux-clk@vger.kernel.org
Date: Thu, 18 Feb 2016 16:14:03 +0900
Message-Id: <20160218071403.11935.50948.sendpatchset@little-apple>
Subject: [PATCH v2] clk: shmobile: r8a7795: Add INTC-EX clock
List-ID: <linux-clk.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add the "intc-ex" clock to the r8a7795 CPG MSSR driver V2.

According to information from the hardware team the INTC_EX
parent clock is CP. The next data sheet version will include
this information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/clk/shmobile/r8a7795-cpg-mssr.c |    1 +
 1 file changed, 1 insertion(+)

--- 0001/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ work/drivers/clk/shmobile/r8a7795-cpg-mssr.c	2016-02-18 16:08:25.910513000 +0900
@@ -138,6 +138,7 @@ static const struct mssr_mod_clk r8a7795
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
+	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
