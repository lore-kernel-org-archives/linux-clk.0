Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	rnayak@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [RFC 01/12] clk: qcom: support for register offsets from rcg2 clock node
Date: Thu, 27 Jul 2017 16:40:14 +0530
Message-Id: <1501153825-5181-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The current driver hardcodes the RCG2 register offsets. Some of
the RCG2’s use different offsets from the default one.

This patch adds the support to provide the register offsets array in
RCG2 clock node. If RCG2 clock node contains the register offsets
then this will be used instead of default one.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h  | 11 +++++++
 drivers/clk/qcom/clk-rcg2.c | 78 ++++++++++++++++++++++++++++-----------------
 2 files changed, 60 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 1b3e8d2..54add3b 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -17,6 +17,14 @@
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
 
+enum {
+	CLK_RCG2_CMD,
+	CLK_RCG2_CFG,
+	CLK_RCG2_M,
+	CLK_RCG2_N,
+	CLK_RCG2_D,
+};
+
 struct freq_tbl {
 	unsigned long freq;
 	u8 src;
@@ -154,6 +162,8 @@ struct clk_dyn_rcg {
  * @cmd_rcgr: corresponds to *_CMD_RCGR
  * @mnd_width: number of bits in m/n/d values
  * @hid_width: number of bits in half integer divider
+ * @offsets: offsets of RCG2 register from cmd_rcgr.
+ *	     default will be used in case of null
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
  * @current_freq: last cached frequency when using branches with shared RCGs
@@ -164,6 +174,7 @@ struct clk_rcg2 {
 	u32			cmd_rcgr;
 	u8			mnd_width;
 	u8			hid_width;
+	const u8		*offsets;
 	const struct parent_map	*parent_map;
 	const struct freq_tbl	*freq_tbl;
 	unsigned long		current_freq;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 1a0985a..7e1c8aa 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2013-2017 The Linux Foundation. All rights reserved.
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -26,7 +26,6 @@
 #include "clk-rcg.h"
 #include "common.h"
 
-#define CMD_REG			0x0
 #define CMD_UPDATE		BIT(0)
 #define CMD_ROOT_EN		BIT(1)
 #define CMD_DIRTY_CFG		BIT(4)
@@ -35,7 +34,6 @@
 #define CMD_DIRTY_D		BIT(7)
 #define CMD_ROOT_OFF		BIT(31)
 
-#define CFG_REG			0x4
 #define CFG_SRC_DIV_SHIFT	0
 #define CFG_SRC_SEL_SHIFT	8
 #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
@@ -43,22 +41,34 @@
 #define CFG_MODE_MASK		(0x3 << CFG_MODE_SHIFT)
 #define CFG_MODE_DUAL_EDGE	(0x2 << CFG_MODE_SHIFT)
 
-#define M_REG			0x8
-#define N_REG			0xc
-#define D_REG			0x10
+#define rcg2_cmd(rcg, offsets)	(rcg->cmd_rcgr)
+#define rcg2_cfg(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_CFG])
+#define rcg2_m(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_M])
+#define rcg2_n(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_N])
+#define rcg2_d(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_D])
+
+#define to_rcg2_offsets(rcg)	(rcg->offsets ?		\
+				 rcg->offsets : rcg2_default_offsets)
 
 enum freq_policy {
 	FLOOR,
 	CEIL,
 };
 
+static const u8 rcg2_default_offsets[] = {
+	[CLK_RCG2_CFG] = 0x4,
+	[CLK_RCG2_M] = 0x8,
+	[CLK_RCG2_N] = 0xc,
+	[CLK_RCG2_D] = 0x10,
+};
+
 static int clk_rcg2_is_enabled(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	u32 cmd;
 	int ret;
 
-	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
+	ret = regmap_read(rcg->clkr.regmap, rcg2_cmd(rcg, offsets), &cmd);
 	if (ret)
 		return ret;
 
@@ -68,11 +78,12 @@ static int clk_rcg2_is_enabled(struct clk_hw *hw)
 static u8 clk_rcg2_get_parent(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	int num_parents = clk_hw_get_num_parents(hw);
 	u32 cfg;
 	int i, ret;
 
-	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	ret = regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets), &cfg);
 	if (ret)
 		goto err;
 
@@ -96,14 +107,15 @@ static int update_config(struct clk_rcg2 *rcg)
 	struct clk_hw *hw = &rcg->clkr.hw;
 	const char *name = clk_hw_get_name(hw);
 
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg2_cmd(rcg, offsets),
 				 CMD_UPDATE, CMD_UPDATE);
 	if (ret)
 		return ret;
 
 	/* Wait for update to take effect */
 	for (count = 500; count > 0; count--) {
-		ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
+		ret = regmap_read(rcg->clkr.regmap, rcg2_cmd(rcg, offsets),
+				  &cmd);
 		if (ret)
 			return ret;
 		if (!(cmd & CMD_UPDATE))
@@ -118,10 +130,11 @@ static int update_config(struct clk_rcg2 *rcg)
 static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	int ret;
 	u32 cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg2_cfg(rcg, offsets),
 				 CFG_SRC_SEL_MASK, cfg);
 	if (ret)
 		return ret;
@@ -158,15 +171,16 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	u32 cfg, hid_div, m = 0, n = 0, mode = 0, mask;
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets), &cfg);
 
 	if (rcg->mnd_width) {
 		mask = BIT(rcg->mnd_width) - 1;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + M_REG, &m);
+		regmap_read(rcg->clkr.regmap, rcg2_m(rcg, offsets), &m);
 		m &= mask;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + N_REG, &n);
+		regmap_read(rcg->clkr.regmap, rcg2_n(rcg, offsets), &n);
 		n =  ~n;
 		n &= mask;
 		n += m;
@@ -252,6 +266,7 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
 	u32 cfg, mask;
 	struct clk_hw *hw = &rcg->clkr.hw;
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
 
 	if (index < 0)
@@ -260,17 +275,17 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + M_REG, mask, f->m);
+				rcg2_m(rcg, offsets), mask, f->m);
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + N_REG, mask, ~(f->n - f->m));
+				rcg2_n(rcg, offsets), mask, ~(f->n - f->m));
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + D_REG, mask, ~f->n);
+				rcg2_d(rcg, offsets), mask, ~f->n);
 		if (ret)
 			return ret;
 	}
@@ -282,7 +297,7 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	ret = regmap_update_bits(rcg->clkr.regmap,
-			rcg->cmd_rcgr + CFG_REG, mask, cfg);
+			rcg2_cfg(rcg, offsets), mask, cfg);
 	if (ret)
 		return ret;
 
@@ -365,7 +380,7 @@ static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
 	int ret, count;
 
 	/* force enable RCG */
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg2_cmd(rcg, offsets),
 				 CMD_ROOT_EN, CMD_ROOT_EN);
 	if (ret)
 		return ret;
@@ -386,7 +401,7 @@ static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
 		return ret;
 
 	/* clear force enable RCG */
-	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+	return regmap_update_bits(rcg->clkr.regmap, rcg2_cmd(rcg, offsets),
 				 CMD_ROOT_EN, 0);
 }
 
@@ -468,6 +483,7 @@ static int clk_edp_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	struct freq_tbl f = *rcg->freq_tbl;
 	const struct frac_entry *frac;
 	int delta = 100000;
@@ -489,8 +505,8 @@ static int clk_edp_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 		    (src_rate > (request + delta)))
 			continue;
 
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
+		regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets),
+			    &hid_div);
 		f.pre_div = hid_div;
 		f.pre_div >>= CFG_SRC_DIV_SHIFT;
 		f.pre_div &= mask;
@@ -514,6 +530,7 @@ static int clk_edp_pixel_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	const struct freq_tbl *f = rcg->freq_tbl;
 	const struct frac_entry *frac;
 	int delta = 100000;
@@ -539,8 +556,8 @@ static int clk_edp_pixel_determine_rate(struct clk_hw *hw,
 		    (req->best_parent_rate > (request + delta)))
 			continue;
 
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
+		regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets),
+			    &hid_div);
 		hid_div >>= CFG_SRC_DIV_SHIFT;
 		hid_div &= mask;
 
@@ -649,6 +666,7 @@ static int clk_byte2_set_rate(struct clk_hw *hw, unsigned long rate,
 			 unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	struct freq_tbl f = { 0 };
 	unsigned long div;
 	int i, num_parents = clk_hw_get_num_parents(hw);
@@ -660,7 +678,7 @@ static int clk_byte2_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	f.pre_div = div;
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets), &cfg);
 	cfg &= CFG_SRC_SEL_MASK;
 	cfg >>= CFG_SRC_SEL_SHIFT;
 
@@ -727,6 +745,7 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	struct freq_tbl f = { 0 };
 	const struct frac_entry *frac = frac_table_pixel;
 	unsigned long request;
@@ -735,7 +754,7 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 hid_div, cfg;
 	int i, num_parents = clk_hw_get_num_parents(hw);
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets), &cfg);
 	cfg &= CFG_SRC_SEL_MASK;
 	cfg >>= CFG_SRC_SEL_SHIFT;
 
@@ -752,8 +771,8 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 			(parent_rate > (request + delta)))
 			continue;
 
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
+		regmap_read(rcg->clkr.regmap, rcg2_cfg(rcg, offsets),
+			    &hid_div);
 		f.pre_div = hid_div;
 		f.pre_div >>= CFG_SRC_DIV_SHIFT;
 		f.pre_div &= mask;
@@ -835,12 +854,13 @@ static int clk_gfx3d_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate, u8 index)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const u8 *offsets = to_rcg2_offsets(rcg);
 	u32 cfg;
 	int ret;
 
 	/* Just mux it, we don't use the division or m/n hardware */
 	cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
-	ret = regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
+	ret = regmap_write(rcg->clkr.regmap, rcg2_cfg(rcg, offsets), cfg);
 	if (ret)
 		return ret;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
