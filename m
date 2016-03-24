Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54108 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751625AbcCXNAX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 24 Mar 2016 09:00:23 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: shmobile: r8a7795: make SD clk definition specific for GEN3
Date: Thu, 24 Mar 2016 13:50:41 +0100
Message-Id: <1458823841-19899-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

About SD clocks: The clock type is Gen3 specific, the callbacks are all
Gen3 specific; I think the clock definition should also be Gen3 specific
and not in the general header file.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 11 +++++++----
 drivers/clk/renesas/renesas-cpg-mssr.h |  3 ---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index b2198aef5ed429..a9f933055663cb 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -65,6 +65,9 @@ enum r8a7795_clk_types {
 	CLK_TYPE_GEN3_SD,
 };
 
+#define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
+
 static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -102,10 +105,10 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_SD("sd0",           R8A7795_CLK_SD0,   CLK_PLL1_DIV2, 0x0074),
-	DEF_SD("sd1",           R8A7795_CLK_SD1,   CLK_PLL1_DIV2, 0x0078),
-	DEF_SD("sd2",           R8A7795_CLK_SD2,   CLK_PLL1_DIV2, 0x0268),
-	DEF_SD("sd3",           R8A7795_CLK_SD3,   CLK_PLL1_DIV2, 0x026c),
+	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_PLL1_DIV2, 0x0074),
+	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_PLL1_DIV2, 0x0078),
+	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_PLL1_DIV2, 0x0268),
+	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_PLL1_DIV2, 0x026c),
 
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 952b6957233b46..cad3c7d1b0c6f0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -53,9 +53,6 @@ enum clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
 #define DEF_DIV6P1(_name, _id, _parent, _offset)	\
 	DEF_BASE(_name, _id, CLK_TYPE_DIV6P1, _parent, .offset = _offset)
-#define DEF_SD(_name, _id, _parent, _offset)	\
-	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
-
 
     /*
      * Definitions of Module Clocks
-- 
2.7.0

