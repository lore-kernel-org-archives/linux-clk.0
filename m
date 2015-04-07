Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] clk: qcom: Fix parent_map translations
Date: Tue,  7 Apr 2015 17:14:51 +0300
Message-Id: <1428416091-31844-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

When we introduced the parent_map tables, we missed to update some
of the functions where mapping is translated. Fix this.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

Changes since v1:
 * Pass parent map to _freq_tbl_determine_rate()

 drivers/clk/qcom/clk-rcg.c  |   26 ++++++++++++++++++++------
 drivers/clk/qcom/clk-rcg2.c |   20 +++++++++++++++-----
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 8f2f48071a7a..7b3d62674203 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -319,7 +319,7 @@ static int clk_dyn_rcg_set_parent(struct clk_hw *hw, u8 index)
 	if (banked_p)
 		f.pre_div = ns_to_pre_div(&rcg->p[bank], ns) + 1;
 
-	f.src = index;
+	f.src = qcom_find_src_index(hw, rcg->s[bank].parent_map, index);
 	return configure_bank(rcg, &f);
 }
 
@@ -407,17 +407,23 @@ clk_dyn_rcg_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 static long _freq_tbl_determine_rate(struct clk_hw *hw,
 		const struct freq_tbl *f, unsigned long rate,
 		unsigned long min_rate, unsigned long max_rate,
-		unsigned long *p_rate, struct clk_hw **p_hw)
+		unsigned long *p_rate, struct clk_hw **p_hw,
+		const struct parent_map *parent_map)
 {
 	unsigned long clk_flags;
 	struct clk *p;
+	int index;
 
 	f = qcom_find_freq(f, rate);
 	if (!f)
 		return -EINVAL;
 
+	index = qcom_find_src_index(hw, parent_map, f->src);
+	if (index < 0)
+		return index;
+
 	clk_flags = __clk_get_flags(hw->clk);
-	p = clk_get_parent_by_index(hw->clk, f->src);
+	p = clk_get_parent_by_index(hw->clk, index);
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		rate = rate * f->pre_div;
 		if (f->n) {
@@ -442,7 +448,7 @@ static long clk_rcg_determine_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_rcg *rcg = to_clk_rcg(hw);
 
 	return _freq_tbl_determine_rate(hw, rcg->freq_tbl, rate, min_rate,
-			max_rate, p_rate, p);
+			max_rate, p_rate, p, rcg->s.parent_map);
 }
 
 static long clk_dyn_rcg_determine_rate(struct clk_hw *hw, unsigned long rate,
@@ -450,9 +456,16 @@ static long clk_dyn_rcg_determine_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long *p_rate, struct clk_hw **p)
 {
 	struct clk_dyn_rcg *rcg = to_clk_dyn_rcg(hw);
+	u32 reg;
+	int bank;
+	struct src_sel *s;
+
+	regmap_read(rcg->clkr.regmap, rcg->bank_reg, &reg);
+	bank = reg_to_bank(rcg, reg);
+	s = &rcg->s[bank];
 
 	return _freq_tbl_determine_rate(hw, rcg->freq_tbl, rate, min_rate,
-			max_rate, p_rate, p);
+			max_rate, p_rate, p, s->parent_map);
 }
 
 static long clk_rcg_bypass_determine_rate(struct clk_hw *hw, unsigned long rate,
@@ -462,8 +475,9 @@ static long clk_rcg_bypass_determine_rate(struct clk_hw *hw, unsigned long rate,
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
