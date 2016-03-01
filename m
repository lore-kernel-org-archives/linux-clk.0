Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH] clk: ti: Fix some errors found by static checkers
Date: Tue,  1 Mar 2016 10:54:59 -0800
Message-Id: <1456858499-28035-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/ti/clk-814x.c:34:12: warning: symbol 'dm814x_adpll_early_init' was not declared. Should it be static?
drivers/clk/ti/clk-814x.c:58:12: warning: symbol 'dm814x_adpll_enable_init_clocks' was not declared. Should it be static?
drivers/clk/ti/adpll.c:465 ti_adpll_recalc_rate() warn: should '__readw(d->regs + 20) << 18' be a 64 bit type?
drivers/clk/ti/adpll.c:945 ti_adpll_probe() error: we previously assumed 'd->clocks' could be null (see line 921)

The last one looks like a real bug because we don't return an
error on allocation failure.

Cc: Tero Kristo <t-kristo@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/adpll.c    | 4 ++--
 drivers/clk/ti/clk-814x.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index f741d79e5afd..255cafb18336 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -462,7 +462,7 @@ static unsigned long ti_adpll_recalc_rate(struct clk_hw *hw,
 	spin_lock_irqsave(&d->lock, flags);
 	frac_m = readl_relaxed(d->regs + ADPLL_FRACDIV_OFFSET);
 	frac_m &= ADPLL_FRACDIV_FRACTIONALM_MASK;
-	rate = readw_relaxed(d->regs + ADPLL_MN2DIV_OFFSET) << 18;
+	rate = (u64)readw_relaxed(d->regs + ADPLL_MN2DIV_OFFSET) << 18;
 	rate += frac_m;
 	rate *= parent_rate;
 	divider = (readw_relaxed(d->regs + ADPLL_M2NDIV_OFFSET) + 1) << 18;
@@ -919,7 +919,7 @@ static int ti_adpll_probe(struct platform_device *pdev)
 				 TI_ADPLL_NR_CLOCKS,
 				 GFP_KERNEL);
 	if (!d->clocks)
-		goto free;
+		return -ENOMEM;
 
 	err = ti_adpll_init_dco(d);
 	if (err) {
diff --git a/drivers/clk/ti/clk-814x.c b/drivers/clk/ti/clk-814x.c
index 2323643fb731..52c6efc53731 100644
--- a/drivers/clk/ti/clk-814x.c
+++ b/drivers/clk/ti/clk-814x.c
@@ -31,7 +31,7 @@ static struct ti_dt_clk dm814_clks[] = {
 
 static bool timer_clocks_initialized;
 
-int __init dm814x_adpll_early_init(void)
+static int __init dm814x_adpll_early_init(void)
 {
 	struct device_node *np;
 
@@ -55,7 +55,7 @@ static const char * const init_clocks[] = {
 	"pll290clkout",		/* DDR 481c5290.adpll.clkout */
 };
 
-int __init dm814x_adpll_enable_init_clocks(void)
+static int __init dm814x_adpll_enable_init_clocks(void)
 {
 	int i, err;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
