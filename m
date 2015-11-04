Return-Path: <nicolas.pitre@linaro.org>
Return-Path: <nicolas.pitre@linaro.org>
Date: Tue, 3 Nov 2015 23:17:11 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Tero Kristo <t-kristo@ti.com>, Michael Turquette <mturquette@baylibre.com>
cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] ti/fapll: fix wrong do_div() usage
Message-ID: <alpine.LFD.2.20.1511032314240.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

do_div() is meant to be used with an unsigned dividend.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index f4b2e9888b..66a0d0ed8b 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -168,7 +168,7 @@ static unsigned long ti_fapll_recalc_rate(struct clk_hw *hw,
 {
 	struct fapll_data *fd = to_fapll(hw);
 	u32 fapll_n, fapll_p, v;
-	long long rate;
+	u64 rate;
 
 	if (ti_fapll_clock_is_bypass(fd))
 		return parent_rate;
@@ -314,7 +314,7 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 {
 	struct fapll_synth *synth = to_synth(hw);
 	u32 synth_div_m;
-	long long rate;
+	u64 rate;
 
 	/* The audio_pll_clk1 is hardwired to produce 32.768KiHz clock */
 	if (!synth->div)
