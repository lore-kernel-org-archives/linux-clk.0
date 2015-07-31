Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 16/26] clk: qcom: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:56 -0700
Message-Id: <1438362246-6664-17-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/clk-pll.c      |  8 ++------
 drivers/clk/qcom/clk-rcg.c      | 17 ++++++++---------
 drivers/clk/qcom/clk-rcg2.c     | 29 +++++++++++++----------------
 drivers/clk/qcom/mmcc-msm8960.c | 10 ++++++----
 4 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index a34656bec648..5b940d629045 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -138,13 +138,9 @@ struct pll_freq_tbl *find_freq(const struct pll_freq_tbl *f, unsigned long rate)
 static int
 clk_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
-	struct clk *parent = __clk_get_parent(hw->clk);
 	struct clk_pll *pll = to_clk_pll(hw);
 	const struct pll_freq_tbl *f;
 
-	req->best_parent_hw = __clk_get_hw(parent);
-	req->best_parent_rate = __clk_get_rate(parent);
-
 	f = find_freq(pll->freq_tbl, req->rate);
 	if (!f)
 		req->rate = clk_pll_recalc_rate(hw, req->best_parent_rate);
@@ -198,7 +194,7 @@ static int wait_for_pll(struct clk_pll *pll)
 	u32 val;
 	int count;
 	int ret;
-	const char *name = __clk_get_name(pll->clkr.hw.clk);
+	const char *name = clk_hw_get_name(&pll->clkr.hw);
 
 	/* Wait for pll to enable. */
 	for (count = 200; count > 0; count--) {
@@ -217,7 +213,7 @@ static int wait_for_pll(struct clk_pll *pll)
 static int clk_pll_vote_enable(struct clk_hw *hw)
 {
 	int ret;
-	struct clk_pll *p = to_clk_pll(__clk_get_hw(__clk_get_parent(hw->clk)));
+	struct clk_pll *p = to_clk_pll(clk_hw_get_parent(hw));
 
 	ret = clk_enable_regmap(hw);
 	if (ret)
diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 070162abc2b6..fd8b3c68634f 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -59,7 +59,7 @@ static u8 clk_rcg_get_parent(struct clk_hw *hw)
 
 err:
 	pr_debug("%s: Clock %s has invalid parent, using default.\n",
-		 __func__, __clk_get_name(hw->clk));
+		 __func__, clk_hw_get_name(hw));
 	return 0;
 }
 
@@ -95,7 +95,7 @@ static u8 clk_dyn_rcg_get_parent(struct clk_hw *hw)
 
 err:
 	pr_debug("%s: Clock %s has invalid parent, using default.\n",
-		 __func__, __clk_get_name(hw->clk));
+		 __func__, clk_hw_get_name(hw));
 	return 0;
 }
 
@@ -409,7 +409,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 		const struct parent_map *parent_map)
 {
 	unsigned long clk_flags, rate = req->rate;
-	struct clk *p;
+	struct clk_hw *p;
 	int index;
 
 	f = qcom_find_freq(f, rate);
@@ -421,7 +421,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 		return index;
 
 	clk_flags = clk_hw_get_flags(hw);
-	p = clk_get_parent_by_index(hw->clk, index);
+	p = clk_hw_get_parent_by_index(hw, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		rate = rate * f->pre_div;
 		if (f->n) {
@@ -431,9 +431,9 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 			rate = tmp;
 		}
 	} else {
-		rate =  __clk_get_rate(p);
+		rate =  clk_hw_get_rate(p);
 	}
-	req->best_parent_hw = __clk_get_hw(p);
+	req->best_parent_hw = p;
 	req->best_parent_rate = rate;
 	req->rate = f->freq;
 
@@ -472,9 +472,8 @@ static int clk_rcg_bypass_determine_rate(struct clk_hw *hw,
 	struct clk *p;
 	int index = qcom_find_src_index(hw, rcg->s.parent_map, f->src);
 
-	p = clk_get_parent_by_index(hw->clk, index);
-	req->best_parent_hw = __clk_get_hw(p);
-	req->best_parent_rate = __clk_round_rate(p, req->rate);
+	req->best_parent_hw = p = clk_hw_get_parent_by_index(hw, index);
+	req->best_parent_rate = clk_hw_round_rate(p, req->rate);
 	req->rate = req->best_parent_rate;
 
 	return 0;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 98cf7192a61d..9aec1761fd29 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -80,7 +80,7 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
 
 err:
 	pr_debug("%s: Clock %s has invalid parent, using default.\n",
-		 __func__, __clk_get_name(hw->clk));
+		 __func__, clk_hw_get_name(hw));
 	return 0;
 }
 
@@ -89,7 +89,7 @@ static int update_config(struct clk_rcg2 *rcg)
 	int count, ret;
 	u32 cmd;
 	struct clk_hw *hw = &rcg->clkr.hw;
-	const char *name = __clk_get_name(hw->clk);
+	const char *name = clk_hw_get_name(hw);
 
 	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
 				 CMD_UPDATE, CMD_UPDATE);
@@ -180,7 +180,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw,
 		const struct freq_tbl *f, struct clk_rate_request *req)
 {
 	unsigned long clk_flags, rate = req->rate;
-	struct clk *p;
+	struct clk_hw *p;
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	int index;
 
@@ -193,7 +193,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw,
 		return index;
 
 	clk_flags = clk_hw_get_flags(hw);
-	p = clk_get_parent_by_index(hw->clk, index);
+	p = clk_hw_get_parent_by_index(hw, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		if (f->pre_div) {
 			rate /= 2;
@@ -207,9 +207,9 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw,
 			rate = tmp;
 		}
 	} else {
-		rate =  __clk_get_rate(p);
+		rate =  clk_hw_get_rate(p);
 	}
-	req->best_parent_hw = __clk_get_hw(p);
+	req->best_parent_hw = p;
 	req->best_parent_rate = rate;
 	req->rate = f->freq;
 
@@ -384,11 +384,10 @@ static int clk_edp_pixel_determine_rate(struct clk_hw *hw,
 	u32 mask = BIT(rcg->hid_width) - 1;
 	u32 hid_div;
 	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
-	struct clk *p = clk_get_parent_by_index(hw->clk, index);
 
 	/* Force the correct parent */
-	req->best_parent_hw = __clk_get_hw(p);
-	req->best_parent_rate = __clk_get_rate(p);
+	req->best_parent_hw = clk_hw_get_parent_by_index(hw, index);
+	req->best_parent_rate = clk_hw_get_rate(req->best_parent_hw);
 
 	if (req->best_parent_rate == 810000000)
 		frac = frac_table_810m;
@@ -436,14 +435,13 @@ static int clk_byte_determine_rate(struct clk_hw *hw,
 	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
 	unsigned long parent_rate, div;
 	u32 mask = BIT(rcg->hid_width) - 1;
-	struct clk *p;
+	struct clk_hw *p;
 
 	if (req->rate == 0)
 		return -EINVAL;
 
-	p = clk_get_parent_by_index(hw->clk, index);
-	req->best_parent_hw = __clk_get_hw(p);
-	req->best_parent_rate = parent_rate = __clk_round_rate(p, req->rate);
+	req->best_parent_hw = p = clk_hw_get_parent_by_index(hw, index);
+	req->best_parent_rate = parent_rate = clk_hw_round_rate(p, req->rate);
 
 	div = DIV_ROUND_UP((2 * parent_rate), req->rate) - 1;
 	div = min_t(u32, div, mask);
@@ -504,14 +502,13 @@ static int clk_pixel_determine_rate(struct clk_hw *hw,
 	const struct freq_tbl *f = rcg->freq_tbl;
 	const struct frac_entry *frac = frac_table_pixel;
 	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
-	struct clk *parent = clk_get_parent_by_index(hw->clk, index);
 
-	req->best_parent_hw = __clk_get_hw(parent);
+	req->best_parent_hw = clk_hw_get_parent_by_index(hw, index);
 
 	for (; frac->num; frac++) {
 		request = (req->rate * frac->den) / frac->num;
 
-		src_rate = __clk_round_rate(parent, request);
+		src_rate = clk_hw_round_rate(req->best_parent_hw, request);
 		if ((src_rate < (request - delta)) ||
 			(src_rate > (request + delta)))
 			continue;
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 97e98278c21a..bad02aebf959 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -509,7 +509,6 @@ static int pix_rdi_set_parent(struct clk_hw *hw, u8 index)
 	int ret = 0;
 	u32 val;
 	struct clk_pix_rdi *rdi = to_clk_pix_rdi(hw);
-	struct clk *clk = hw->clk;
 	int num_parents = clk_hw_get_num_parents(hw);
 
 	/*
@@ -521,7 +520,8 @@ static int pix_rdi_set_parent(struct clk_hw *hw, u8 index)
 	 * needs to be on at what time.
 	 */
 	for (i = 0; i < num_parents; i++) {
-		ret = clk_prepare_enable(clk_get_parent_by_index(clk, i));
+		struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
+		ret = clk_prepare_enable(p->clk);
 		if (ret)
 			goto err;
 	}
@@ -549,8 +549,10 @@ static int pix_rdi_set_parent(struct clk_hw *hw, u8 index)
 	udelay(1);
 
 err:
-	for (i--; i >= 0; i--)
-		clk_disable_unprepare(clk_get_parent_by_index(clk, i));
+	for (i--; i >= 0; i--) {
+		struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
+		clk_disable_unprepare(p->clk);
+	}
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

