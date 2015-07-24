Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37220 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754430AbbGXQ6u (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jul 2015 12:58:50 -0400
Received: by wibud3 with SMTP id ud3so35930725wib.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2015 09:58:49 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org, agross@codeaurora.org
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 3/5] clk: qcom: Add support for regmap mux-div clocks
Date: Fri, 24 Jul 2015 19:58:37 +0300
Message-Id: <1437757119-6910-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add support for hardware that support switching both parent clocks and the
divider at the same time. This avoids generating intermediate frequencies
from either the old parent clock and new divider or new parent clock and
old divider combinations.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/Makefile             |    1 +
 drivers/clk/qcom/clk-regmap-mux-div.c |  291 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h |   63 +++++++
 3 files changed, 355 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f1d5e2e17667..56068d2e75a5 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
+clk-qcom-y += clk-regmap-mux-div.o
 clk-qcom-y += reset.o
 clk-qcom-$(CONFIG_QCOM_SMD_RPM) += clk-smd-rpm.o
 
diff --git a/drivers/clk/qcom/clk-regmap-mux-div.c b/drivers/clk/qcom/clk-regmap-mux-div.c
new file mode 100644
index 000000000000..854586cee366
--- /dev/null
+++ b/drivers/clk/qcom/clk-regmap-mux-div.c
@@ -0,0 +1,291 @@
+/*
+ * Copyright (c) 2015, Linaro Limited
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/regmap.h>
+
+#include "clk-regmap-mux-div.h"
+
+#define CMD_RCGR			0x0
+#define CMD_RCGR_UPDATE			BIT(0)
+#define CMD_RCGR_DIRTY_CFG		BIT(4)
+#define CMD_RCGR_ROOT_OFF		BIT(31)
+#define CFG_RCGR			0x4
+
+static int __mux_div_update_config(struct clk_regmap_mux_div *md)
+{
+	int ret;
+	u32 val, count;
+	const char *name = __clk_get_name(md->clkr.hw.clk);
+
+	ret = regmap_update_bits(md->clkr.regmap, CMD_RCGR + md->reg_offset,
+				 CMD_RCGR_UPDATE, CMD_RCGR_UPDATE);
+	if (ret)
+		return ret;
+
+	/* Wait for update to take effect */
+	for (count = 500; count > 0; count--) {
+		ret = regmap_read(md->clkr.regmap, CMD_RCGR + md->reg_offset,
+				  &val);
+		if (ret)
+			return ret;
+		if (!(val & CMD_RCGR_UPDATE))
+			return 0;
+		udelay(1);
+	}
+
+	pr_err("%s: RCG did not update its configuration", name);
+	return -EBUSY;
+}
+
+static int __mux_div_set_src_div(struct clk_regmap_mux_div *md, u32 src_sel,
+				 u32 src_div)
+{
+	int ret;
+	u32 val, mask;
+
+	val = (src_div << md->hid_shift) | (src_sel << md->src_shift);
+	mask = ((BIT(md->hid_width) - 1) << md->hid_shift) |
+	       ((BIT(md->src_width) - 1) << md->src_shift);
+
+	ret = regmap_update_bits(md->clkr.regmap, CFG_RCGR + md->reg_offset,
+				 mask, val);
+	if (ret)
+		return ret;
+
+	return __mux_div_update_config(md);
+}
+
+static void __mux_div_get_src_div(struct clk_regmap_mux_div *md, u32 *src_sel,
+				  u32 *src_div)
+{
+	u32 val, div, src;
+	const char *name = __clk_get_name(md->clkr.hw.clk);
+
+	regmap_read(md->clkr.regmap, CMD_RCGR + md->reg_offset, &val);
+
+	if (val & CMD_RCGR_DIRTY_CFG) {
+		pr_err("%s: RCG configuration is pending\n", name);
+		return;
+	}
+
+	regmap_read(md->clkr.regmap, CFG_RCGR + md->reg_offset, &val);
+	src = (val >> md->src_shift);
+	src &= BIT(md->src_width) - 1;
+	*src_sel = src;
+
+	div = (val >> md->hid_shift);
+	div &= BIT(md->hid_width) - 1;
+	*src_div = div;
+}
+
+static int mux_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+
+	return __mux_div_set_src_div(md, md->src_sel, md->div);
+}
+
+static inline bool is_better_rate(unsigned long req, unsigned long best,
+				  unsigned long new)
+{
+	return (req <= new && new < best) || (best < req && best < new);
+}
+
+static int mux_div_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	unsigned int i, div, max_div;
+	unsigned long actual_rate, best_rate = 0;
+	unsigned long req_rate = req->rate;
+
+	for (i = 0; i < __clk_get_num_parents(hw->clk); i++) {
+		struct clk *parent = clk_get_parent_by_index(hw->clk, i);
+		unsigned long parent_rate = __clk_get_rate(parent);
+
+		max_div = BIT(md->hid_width) - 1;
+		for (div = 1; div < max_div; div++) {
+			parent_rate = mult_frac(req_rate, div, 2);
+			parent_rate = __clk_round_rate(parent, parent_rate);
+			actual_rate = mult_frac(parent_rate, 2, div);
+
+			if (is_better_rate(req_rate, best_rate, actual_rate)) {
+				best_rate = actual_rate;
+				req->rate = best_rate;
+				req->best_parent_rate = parent_rate;
+				req->best_parent_hw = __clk_get_hw(parent);
+			}
+
+			if (actual_rate < req_rate || best_rate <= req_rate)
+				break;
+		}
+	}
+
+	if (!best_rate)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __mux_div_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+					 unsigned long prate, u32 src_sel)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	int ret, i;
+	u32 div, max_div, best_src = 0, best_div = 0;
+	unsigned long actual_rate, best_rate = 0;
+
+	for (i = 0; i < __clk_get_num_parents(hw->clk); i++) {
+		struct clk *parent = clk_get_parent_by_index(hw->clk, i);
+		unsigned long parent_rate = __clk_get_rate(parent);
+
+		max_div = BIT(md->hid_width) - 1;
+		for (div = 1; div < max_div; div++) {
+			parent_rate = mult_frac(rate, div, 2);
+			parent_rate = __clk_round_rate(parent, parent_rate);
+			actual_rate = mult_frac(parent_rate, 2, div);
+
+			if (is_better_rate(rate, best_rate, actual_rate)) {
+				best_rate = actual_rate;
+				best_src = md->parent_map[i].cfg;
+				best_div = div - 1;
+			}
+
+			if (actual_rate < rate || best_rate <= rate)
+				break;
+		}
+	}
+
+	ret = __mux_div_set_src_div(md, best_src, best_div);
+	if (!ret) {
+		md->div = best_div;
+		md->src_sel = best_src;
+	}
+
+	return ret;
+}
+
+static u8 mux_div_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	int num_parents = __clk_get_num_parents(hw->clk);
+	const char *name = __clk_get_name(hw->clk);
+	u32 i, div, src;
+
+	__mux_div_get_src_div(md, &src, &div);
+
+	for (i = 0; i < num_parents; i++)
+		if (src == md->parent_map[i].cfg)
+			return i;
+
+	pr_err("%s: Can't find parent %d\n", name, src);
+	return 0;
+}
+
+static int mux_div_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+
+	return __mux_div_set_src_div(md, md->parent_map[index].cfg, md->div);
+}
+
+static int mux_div_set_rate(struct clk_hw *hw,
+			    unsigned long rate, unsigned long prate)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	u8 pindex = mux_div_get_parent(hw);
+
+	return __mux_div_set_rate_and_parent(hw, rate, prate, md->src_sel);
+}
+
+static int mux_div_set_rate_and_parent(struct clk_hw *hw,  unsigned long rate,
+				       unsigned long prate, u8 index)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+
+	return __mux_div_set_rate_and_parent(hw, rate, prate,
+					     md->parent_map[index].cfg);
+}
+
+static unsigned long mux_div_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	u32 div, src;
+	int i, num_parents = __clk_get_num_parents(hw->clk);
+	const char *name = __clk_get_name(hw->clk);
+
+	__mux_div_get_src_div(md, &src, &div);
+	for (i = 0; i < num_parents; i++)
+		if (src == md->parent_map[i].cfg) {
+			struct clk *p = clk_get_parent_by_index(hw->clk, i);
+			unsigned long parent_rate = __clk_get_rate(p);
+
+			return mult_frac(parent_rate, 2, div + 1);
+		}
+
+	pr_err("%s: Can't find parent %d\n", name, src);
+	return 0;
+}
+
+static struct clk_hw *mux_div_get_safe_parent(struct clk_hw *hw,
+					      unsigned long *safe_freq)
+{
+	int i;
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	int num_parents = __clk_get_num_parents(hw->clk);
+
+	if (md->safe_freq)
+		*safe_freq = md->safe_freq;
+
+	for (i = 0; i < num_parents; i++)
+		if (md->safe_src == md->parent_map[i].cfg)
+			break;
+
+	return __clk_get_hw(clk_get_parent_by_index(hw->clk, i));
+}
+
+static void mux_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
+	struct clk_hw *parent;
+	u32 div;
+
+	if (!md->safe_freq || !md->safe_src)
+		return;
+
+	parent = mux_div_get_safe_parent(hw, &md->safe_freq);
+	div = divider_get_val(md->safe_freq, clk_get_rate(parent->clk), NULL,
+			      md->hid_width, CLK_DIVIDER_ROUND_CLOSEST);
+	div = 2 * div + 1;
+
+	__mux_div_set_src_div(md, md->safe_src, div);
+}
+
+const struct clk_ops clk_regmap_mux_div_ops = {
+	.enable = mux_div_enable,
+	.disable = mux_div_disable,
+	.get_parent = mux_div_get_parent,
+	.set_parent = mux_div_set_parent,
+	.set_rate = mux_div_set_rate,
+	.set_rate_and_parent = mux_div_set_rate_and_parent,
+	.determine_rate = mux_div_determine_rate,
+	.recalc_rate = mux_div_recalc_rate,
+	.get_safe_parent = mux_div_get_safe_parent,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_mux_div_ops);
diff --git a/drivers/clk/qcom/clk-regmap-mux-div.h b/drivers/clk/qcom/clk-regmap-mux-div.h
new file mode 100644
index 000000000000..7610a0e4abd7
--- /dev/null
+++ b/drivers/clk/qcom/clk-regmap-mux-div.h
@@ -0,0 +1,63 @@
+/*
+ * Copyright (c) 2015, Linaro Limited
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __QCOM_CLK_REGMAP_MUX_DIV_H__
+#define __QCOM_CLK_REGMAP_MUX_DIV_H__
+
+#include <linux/clk-provider.h>
+#include "clk-regmap.h"
+#include "clk-rcg.h"
+
+/**
+ * struct mux_div_clk - combined mux/divider clock
+ * @reg_offset: offset of the mux/divider register
+ * @hid_width:	number of bits in half integer divider
+ * @hid_shift:	lowest bit of hid value field
+ * @src_width:	number of bits in source select
+ * @src_shift:	lowest bit of source select field
+ * @div:	the divider raw configuration value
+ * @src_sel:	the mux index which will be used if the clock is enabled
+ * @safe_src:	the safe source mux index for this clock
+ * @safe_freq:	When switching rates from A to B, the mux div clock will
+ *		instead switch from A -> safe_freq -> B. This allows the
+ *		mux_div clock to change rates while enabled, even if this
+ *		behavior is not supported by the parent clocks.
+ *		If changing the rate of parent A also causes the rate of
+ *		parent B to change, then safe_freq must be defined.
+ *		safe_freq is expected to have a source clock which is always
+ *		on and runs at only one rate.
+ * @parent_map:	pointer to parent_map struct
+ * @clkr:	handle between common and hardware-specific interfaces
+ */
+
+struct clk_regmap_mux_div {
+	u32				reg_offset;
+	u32				hid_width;
+	u32				hid_shift;
+	u32				src_width;
+	u32				src_shift;
+	u32				div;
+	u32				src_sel;
+	u32				safe_src;
+	unsigned long			safe_freq;
+	const struct parent_map		*parent_map;
+	struct clk_regmap		clkr;
+};
+
+#define to_clk_regmap_mux_div(_hw) \
+	container_of(to_clk_regmap(_hw), struct clk_regmap_mux_div, clkr)
+
+extern const struct clk_ops clk_regmap_mux_div_ops;
+
+#endif
