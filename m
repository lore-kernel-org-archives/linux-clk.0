Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 08/26] ARM: OMAP: Convert __clk_get_rate() to provider/consumer APIs
Date: Fri, 31 Jul 2015 10:03:48 -0700
Message-Id: <1438362246-6664-9-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch to
clk_get_rate() and clk_hw_get_rate() here appropriately.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 arch/arm/mach-omap2/clkt34xx_dpll3m2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/clkt34xx_dpll3m2.c b/arch/arm/mach-omap2/clkt34xx_dpll3m2.c
index 07e1956a26ce..3f6521313c93 100644
--- a/arch/arm/mach-omap2/clkt34xx_dpll3m2.c
+++ b/arch/arm/mach-omap2/clkt34xx_dpll3m2.c
@@ -67,8 +67,8 @@ int omap3_core_dpll_m2_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (validrate != rate)
 		return -EINVAL;
 
-	sdrcrate = __clk_get_rate(sdrc_ick_p);
-	clkrate = __clk_get_rate(hw->clk);
+	sdrcrate = clk_get_rate(sdrc_ick_p);
+	clkrate = clk_hw_get_rate(hw);
 	if (rate > clkrate)
 		sdrcrate <<= ((rate / clkrate) >> 1);
 	else
@@ -86,7 +86,7 @@ int omap3_core_dpll_m2_set_rate(struct clk_hw *hw, unsigned long rate,
 	/*
 	 * XXX This only needs to be done when the CPU frequency changes
 	 */
-	_mpurate = __clk_get_rate(arm_fck_p) / CYCLES_PER_MHZ;
+	_mpurate = clk_get_rate(arm_fck_p) / CYCLES_PER_MHZ;
 	c = (_mpurate << SDRC_MPURATE_SCALE) >> SDRC_MPURATE_BASE_SHIFT;
 	c += 1;  /* for safety */
 	c *= SDRC_MPURATE_LOOPS;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
