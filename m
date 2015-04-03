Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] clk: qcom: Fix parent_map translations
Date: Fri,  3 Apr 2015 17:00:03 +0300
Message-Id: <1428069603-2641-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

When we introduced the parent_map tables, we missed to update some
of the functions where mapping is translated. Fix this.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.c  |   13 ++++++++++---
 drivers/clk/qcom/clk-rcg2.c |   20 +++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 8f2f48071a7a..e30821a3ba68 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -319,7 +319,7 @@ static int clk_dyn_rcg_set_parent(struct clk_hw *hw, u8 index)
 	if (banked_p)
 		f.pre_div = ns_to_pre_div(&rcg->p[bank], ns) + 1;
 
-	f.src = index;
+	f.src = qcom_find_src_index(hw, rcg->s[bank].parent_map, index);
 	return configure_bank(rcg, &f);
 }
 
@@ -411,13 +411,19 @@ static long _freq_tbl_determine_rate(struct clk_hw *hw,
 {
 	unsigned long clk_flags;
 	struct clk *p;
+	struct clk_rcg *rcg = to_clk_rcg(hw);
+	int index;
 
 	f = qcom_find_freq(f, rate);
 	if (!f)
 		return -EINVAL;
 
+	index = qcom_find_src_index(hw, rcg->s.parent_map, f->src);
+	if (index < 0)
+		return index;
+
 	clk_flags = __clk_get_flags(hw->clk);
-	p = clk_get_parent_by_index(hw->clk, f->src);
+	p = clk_get_parent_by_index(hw->clk, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		rate = rate * f->pre_div;
 		if (f->n) {
@@ -462,8 +468,9 @@ static long clk_rcg_bypass_determine_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_rcg *rcg = to_clk_rcg(hw);
 	const struct freq_tbl *f = rcg->freq_tbl;
 	struct clk *p;
+	int index = qcom_find_src_index(hw, rcg->s.parent_map, f->src);
 
-	p = clk_get_parent_by_index(hw->clk, f->src);
+	p = clk_get_parent_by_index(hw->clk, index);
 	*p_hw = __clk_get_hw(p);
 	*p_rate = __clk_round_rate(p, rate);
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 416becce4170..b95d17fbb8d7 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -182,13 +182,19 @@ static long _freq_tbl_determine_rate(struct clk_hw *hw,
 {
 	unsigned long clk_flags;
 	struct clk *p;
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int index;
 
 	f = qcom_find_freq(f, rate);
 	if (!f)
 		return -EINVAL;
 
+	index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	if (index < 0)
+		return index;
+
 	clk_flags = __clk_get_flags(hw->clk);
-	p = clk_get_parent_by_index(hw->clk, f->src);
+	p = clk_get_parent_by_index(hw->clk, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		if (f->pre_div) {
 			rate /= 2;
@@ -381,9 +387,10 @@ static long clk_edp_pixel_determine_rate(struct clk_hw *hw, unsigned long rate,
 	s64 request;
 	u32 mask = BIT(rcg->hid_width) - 1;
 	u32 hid_div;
+	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
 
 	/* Force the correct parent */
-	*p = __clk_get_hw(clk_get_parent_by_index(hw->clk, f->src));
+	*p = __clk_get_hw(clk_get_parent_by_index(hw->clk, index));
 
 	if (src_rate == 810000000)
 		frac = frac_table_810m;
@@ -427,6 +434,7 @@ static long clk_byte_determine_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f = rcg->freq_tbl;
+	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
 	unsigned long parent_rate, div;
 	u32 mask = BIT(rcg->hid_width) - 1;
 	struct clk *p;
@@ -434,7 +442,7 @@ static long clk_byte_determine_rate(struct clk_hw *hw, unsigned long rate,
 	if (rate == 0)
 		return -EINVAL;
 
-	p = clk_get_parent_by_index(hw->clk, f->src);
+	p = clk_get_parent_by_index(hw->clk, index);
 	*p_hw = __clk_get_hw(p);
 	*p_rate = parent_rate = __clk_round_rate(p, rate);
 
@@ -496,7 +504,8 @@ static long clk_pixel_determine_rate(struct clk_hw *hw, unsigned long rate,
 	int delta = 100000;
 	const struct freq_tbl *f = rcg->freq_tbl;
 	const struct frac_entry *frac = frac_table_pixel;
-	struct clk *parent = clk_get_parent_by_index(hw->clk, f->src);
+	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	struct clk *parent = clk_get_parent_by_index(hw->clk, index);
 
 	*p = __clk_get_hw(parent);
 
@@ -525,7 +534,8 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 	int delta = 100000;
 	u32 mask = BIT(rcg->hid_width) - 1;
 	u32 hid_div;
-	struct clk *parent = clk_get_parent_by_index(hw->clk, f.src);
+	int index = qcom_find_src_index(hw, rcg->parent_map, f.src);
+	struct clk *parent = clk_get_parent_by_index(hw->clk, index);
 
 	for (; frac->num; frac++) {
 		request = (rate * frac->den) / frac->num;
