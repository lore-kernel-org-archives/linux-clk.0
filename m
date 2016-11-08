Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] clk: pxa: Use __iomem properly and staticize lock variable
Date: Tue,  8 Nov 2016 14:47:56 -0800
Message-Id: <20161108224756.25842-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This function is passed an __iomem pointer but we use a u32
pointer instead which makes checkers like spare complain.
Furthermore, "lock" is a pretty poor variable name for a string
that will go into lockdep reports and the symbol isn't marked
static. Cleanup all this.

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/pxa/clk-pxa.c | 7 ++++---
 drivers/clk/pxa/clk-pxa.h | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 50fb9d0ea58d..29fc71617bad 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -38,7 +38,7 @@
 #define MDREFR_DB2_MASK	(MDREFR_K2DB2 | MDREFR_K1DB2)
 #define MDREFR_DRI_MASK	0xFFF
 
-DEFINE_SPINLOCK(lock);
+static DEFINE_SPINLOCK(pxa_clk_lock);
 
 static struct clk *pxa_clocks[CLK_MAX];
 static struct clk_onecell_data onecell_data = {
@@ -109,7 +109,7 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks)
 		pxa_clk->lp = clks[i].lp;
 		pxa_clk->hp = clks[i].hp;
 		pxa_clk->gate = clks[i].gate;
-		pxa_clk->gate.lock = &lock;
+		pxa_clk->gate.lock = &pxa_clk_lock;
 		clk = clk_register_composite(NULL, clks[i].name,
 					     clks[i].parent_names, 2,
 					     &pxa_clk->hw, &cken_mux_ops,
@@ -155,7 +155,8 @@ void pxa2xx_core_turbo_switch(bool on)
 }
 
 void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
-			u32 (*mdrefr_dri)(unsigned int), u32 *mdrefr, u32 *cccr)
+			u32 (*mdrefr_dri)(unsigned int), void __iomem *mdrefr,
+			void __iomem *cccr)
 {
 	unsigned int clkcfg = freq->clkcfg;
 	unsigned int unused, preset_mdrefr, postset_mdrefr;
diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index 58abfa816d53..2b90c5917b32 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -155,8 +155,8 @@ void clk_pxa_dt_common_init(struct device_node *np);
 
 void pxa2xx_core_turbo_switch(bool on);
 void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
-			u32 (*mdrefr_dri)(unsigned int), u32 *mdrefr,
-			u32 *cccr);
+			u32 (*mdrefr_dri)(unsigned int), void __iomem *mdrefr,
+			void __iomem *cccr);
 int pxa2xx_determine_rate(struct clk_rate_request *req,
 			  struct pxa2xx_freq *freqs,  int nb_freqs);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
