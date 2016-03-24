Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54137 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756054AbcCXNBr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 24 Mar 2016 09:01:47 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: shmobile: r8a7795: add R clk
Date: Thu, 24 Mar 2016 14:00:40 +0100
Message-Id: <1458824442-20279-4-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

R can select between two parents. We deal with it like this: During
initialization, check if EXTALR is populated. If so, use it for R. If
not, use R_Internal. clk_mux doesn't help here because we don't want to
switch parents depending on the clock rate. The clock rate (and source)
should stay constant for the watchdog, so I think a setup like this
during initialization makes sense.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Since RFC, remove FIXME by using clk_get_rate() via clk.h

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index d305bcd3ef6619..c260da5e70e116 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -26,6 +27,7 @@
 
 #include "renesas-cpg-mssr.h"
 
+#define CPG_RCKCR	0x240
 
 enum clk_ids {
 	/* External Input Clocks */
@@ -60,6 +62,7 @@ enum r8a7795_clk_types {
 	CLK_TYPE_GEN3_PLL3,
 	CLK_TYPE_GEN3_PLL4,
 	CLK_TYPE_GEN3_SD,
+	CLK_TYPE_GEN3_R,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
@@ -114,8 +117,11 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 
-	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8),
-	DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 32),
+	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
+	DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, CPG_RCKCR, 32),
+
+	/* must come after EXTALR because we need its rate */
+	DEF_BASE("r",           R8A7795_CLK_R, CLK_TYPE_GEN3_R, R8A7795_CLK_RINT),
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
@@ -581,6 +587,18 @@ struct clk * __init r8a7795_cpg_clk_register(struct device *dev,
 	case CLK_TYPE_GEN3_SD:
 		return cpg_sd_clk_register(core, base, __clk_get_name(parent));
 
+	case CLK_TYPE_GEN3_R:
+		/* RINT is default. Only if EXTALR is populated, we switch to it */
+		value = readl(base + CPG_RCKCR) & 0x3f;
+
+		if (clk_get_rate(clks[CLK_EXTALR])) {
+			parent = clks[CLK_EXTALR];
+			value |= BIT(15);
+		}
+
+		writel(value, base + CPG_RCKCR);
+		break;
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.7.0

