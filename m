Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54131 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757664AbcCXNBT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 24 Mar 2016 09:01:19 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] clk: shmobile: cpg-mssr: add generic support for read-only DIV6 clocks
Date: Thu, 24 Mar 2016 14:00:38 +0100
Message-Id: <1458824442-20279-2-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Gen3 has two clocks (OSC and R) which look like a DIV6 clock but their
divider value is read-only and depends on MD pins at bootup. Add support
for such clocks by reading the value and adding a fixed clock.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Since RFC, only rebased.

 drivers/clk/renesas/renesas-cpg-mssr.c | 18 ++++++++++++------
 drivers/clk/renesas/renesas-cpg-mssr.h |  3 +++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index dfdeb7d9f60201..6f7f3f65d7ecea 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -254,7 +254,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 {
 	struct clk *clk = NULL, *parent;
 	struct device *dev = priv->dev;
-	unsigned int id = core->id;
+	unsigned int id = core->id, div = core->div;
 	const char *parent_name;
 
 	WARN_DEBUG(id >= priv->num_core_clks);
@@ -267,6 +267,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 
 	case CLK_TYPE_FF:
 	case CLK_TYPE_DIV6P1:
+	case CLK_TYPE_DIV6_RO:
 		WARN_DEBUG(core->parent >= priv->num_core_clks);
 		parent = priv->clks[core->parent];
 		if (IS_ERR(parent)) {
@@ -275,13 +276,18 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 		}
 
 		parent_name = __clk_get_name(parent);
-		if (core->type == CLK_TYPE_FF) {
-			clk = clk_register_fixed_factor(NULL, core->name,
-							parent_name, 0,
-							core->mult, core->div);
-		} else {
+
+		if (core->type == CLK_TYPE_DIV6_RO)
+			/* Multiply with the DIV6 register value */
+			div *= (readl(priv->base + core->offset) & 0x3f) + 1;
+
+		if (core->type == CLK_TYPE_DIV6P1) {
 			clk = cpg_div6_register(core->name, 1, &parent_name,
 						priv->base + core->offset);
+		} else {
+			clk = clk_register_fixed_factor(NULL, core->name,
+							parent_name, 0,
+							core->mult, div);
 		}
 		break;
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index cad3c7d1b0c6f0..0d1e3e811e79bf 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -37,6 +37,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_DIV6P1,	/* DIV6 Clock with 1 parent clock */
+	CLK_TYPE_DIV6_RO,	/* DIV6 Clock read only with extra divisor */
 
 	/* Custom definitions start here */
 	CLK_TYPE_CUSTOM,
@@ -53,6 +54,8 @@ enum clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
 #define DEF_DIV6P1(_name, _id, _parent, _offset)	\
 	DEF_BASE(_name, _id, CLK_TYPE_DIV6P1, _parent, .offset = _offset)
+#define DEF_DIV6_RO(_name, _id, _parent, _offset, _div)	\
+	DEF_BASE(_name, _id, CLK_TYPE_DIV6_RO, _parent, .offset = _offset, .div = _div, .mult = 1)
 
     /*
      * Definitions of Module Clocks
-- 
2.7.0

