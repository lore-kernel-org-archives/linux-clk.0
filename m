Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 1/3] clk: sunxi-ng: Support fixed post-dividers on NM style clocks
Date: Fri,  8 Dec 2017 16:35:10 +0800
Message-Id: <20171208083512.24080-2-wens@csie.org>
In-Reply-To: <20171208083512.24080-1-wens@csie.org>
References: <20171208083512.24080-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On the A83T, the audio PLL should have its div1 set to 0, or /1, and
div2 set to 1, or /2. This setting is the default, and is required
to match the sigma-delta modulation parameters from the BSP kernel.

To do this, we first add fixed post-divider to the NM style clocks,
which is the type of clock the audio PLL clock is modeled into.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 50 ++++++++++++++++++++++++++++++++-----------
 drivers/clk/sunxi-ng/ccu_nm.h |  2 ++
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index 7620aa973a6e..a16de092bf94 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -70,11 +70,18 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
+	unsigned long rate;
 	unsigned long n, m;
 	u32 reg;
 
-	if (ccu_frac_helper_is_enabled(&nm->common, &nm->frac))
-		return ccu_frac_helper_read_rate(&nm->common, &nm->frac);
+	if (ccu_frac_helper_is_enabled(&nm->common, &nm->frac)) {
+		rate = ccu_frac_helper_read_rate(&nm->common, &nm->frac);
+
+		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nm->fixed_post_div;
+
+		return rate;
+	}
 
 	reg = readl(nm->common.base + nm->common.reg);
 
@@ -90,15 +97,15 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	if (ccu_sdm_helper_is_enabled(&nm->common, &nm->sdm)) {
-		unsigned long rate =
-			ccu_sdm_helper_read_rate(&nm->common, &nm->sdm,
-						 m, n);
-		if (rate)
-			return rate;
-	}
+	if (ccu_sdm_helper_is_enabled(&nm->common, &nm->sdm))
+		rate = ccu_sdm_helper_read_rate(&nm->common, &nm->sdm, m, n);
+	else
+		rate = parent_rate * n / m;
+
+	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nm->fixed_post_div;
 
-	return parent_rate * n / m;
+	return rate;
 }
 
 static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -107,11 +114,20 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
 	struct _ccu_nm _nm;
 
-	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate))
+	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate *= nm->fixed_post_div;
+
+	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate)) {
+		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nm->fixed_post_div;
 		return rate;
+	}
 
-	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, rate))
+	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, rate)) {
+		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nm->fixed_post_div;
 		return rate;
+	}
 
 	_nm.min_n = nm->n.min ?: 1;
 	_nm.max_n = nm->n.max ?: 1 << nm->n.width;
@@ -119,8 +135,12 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
 
 	ccu_nm_find_best(*parent_rate, rate, &_nm);
+	rate = *parent_rate * _nm.n / _nm.m;
+
+	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nm->fixed_post_div;
 
-	return *parent_rate * _nm.n / _nm.m;
+	return rate;
 }
 
 static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -131,6 +151,10 @@ static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 reg;
 
+	/* Adjust target rate according to post-dividers */
+	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate = rate * nm->fixed_post_div;
+
 	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate)) {
 		spin_lock_irqsave(nm->common.lock, flags);
 
diff --git a/drivers/clk/sunxi-ng/ccu_nm.h b/drivers/clk/sunxi-ng/ccu_nm.h
index c623b0c7a23c..eba586b4c7d0 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.h
+++ b/drivers/clk/sunxi-ng/ccu_nm.h
@@ -36,6 +36,8 @@ struct ccu_nm {
 	struct ccu_frac_internal	frac;
 	struct ccu_sdm_internal		sdm;
 
+	unsigned int		fixed_post_div;
+
 	struct ccu_common	common;
 };
 
-- 
2.15.0
