Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37692 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751291AbdCMQUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2017 12:20:10 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] clk: renesas: r8a7796: Reformat core clock table
Date: Mon, 13 Mar 2017 17:19:52 +0100
Message-Id: <1489421994-19707-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

For easier comparison with other clock drivers.
No functional changes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 55003194a2561c95..f7787101b8d0406c 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -54,8 +54,8 @@ enum clk_ids {
 
 static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	/* External Clock Inputs */
-	DEF_INPUT("extal",  CLK_EXTAL),
-	DEF_INPUT("extalr", CLK_EXTALR),
+	DEF_INPUT("extal",      CLK_EXTAL),
+	DEF_INPUT("extalr",     CLK_EXTALR),
 
 	/* Internal Core Clocks */
 	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
@@ -95,10 +95,10 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A7796_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7796_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A7796_CLK_SD0,   CLK_SDSRC,    0x0074),
-	DEF_GEN3_SD("sd1",      R8A7796_CLK_SD1,   CLK_SDSRC,    0x0078),
-	DEF_GEN3_SD("sd2",      R8A7796_CLK_SD2,   CLK_SDSRC,    0x0268),
-	DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   CLK_SDSRC,    0x026c),
+	DEF_GEN3_SD("sd0",      R8A7796_CLK_SD0,   CLK_SDSRC,     0x074),
+	DEF_GEN3_SD("sd1",      R8A7796_CLK_SD1,   CLK_SDSRC,     0x078),
+	DEF_GEN3_SD("sd2",      R8A7796_CLK_SD2,   CLK_SDSRC,     0x268),
+	DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   CLK_SDSRC,     0x26c),
 
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
-- 
2.7.4

