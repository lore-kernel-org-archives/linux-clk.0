Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33435 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932200AbcL0NnV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Dec 2016 08:43:21 -0500
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
        sboyd@codeaurora.org, zhangqing@rock-chips.com,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] clk: rockchip: add a clock-type for muxes based in the grf
Date: Tue, 27 Dec 2016 14:43:02 +0100
Message-Id: <20161227134303.23492-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Rockchip socs often have some tiny number of muxes not controlled from
the core clock controller but through bits set in the general register
files. Add a clock-type that can control these as well, so that we
don't need to work around them being absent.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Hi Elaine,

these two patches showcase how I'd think the tiny amount of grf-based clocks
is handled best. I did some reparenting tests with the aclk_vcodec_pre
from the second patch, so am pretty confident that it should work as expected.

If noone complains, I plan to apply these two for 4.11 so your rk3328 clock-
controller can build on top of these.

 drivers/clk/rockchip/Makefile     |   1 +
 drivers/clk/rockchip/clk-muxgrf.c | 102 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.c        |   7 +++
 drivers/clk/rockchip/clk.h        |  21 ++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 drivers/clk/rockchip/clk-muxgrf.c

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index 16e098c..a43a54d 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -8,6 +8,7 @@ obj-y	+= clk-pll.o
 obj-y	+= clk-cpu.o
 obj-y	+= clk-inverter.o
 obj-y	+= clk-mmc-phase.o
+obj-y	+= clk-muxgrf.o
 obj-y	+= clk-ddr.o
 obj-$(CONFIG_RESET_CONTROLLER)	+= softrst.o
 
diff --git a/drivers/clk/rockchip/clk-muxgrf.c b/drivers/clk/rockchip/clk-muxgrf.c
new file mode 100644
index 0000000..4f29118
--- /dev/null
+++ b/drivers/clk/rockchip/clk-muxgrf.c
@@ -0,0 +1,102 @@
+/*
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
+#include <linux/slab.h>
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include "clk.h"
+
+struct rockchip_muxgrf_clock {
+	struct clk_hw		hw;
+	struct regmap		*regmap;
+	u32			reg;
+	u32			shift;
+	u32			width;
+	int			flags;
+};
+
+#define to_muxgrf_clock(_hw) container_of(_hw, struct rockchip_muxgrf_clock, hw)
+
+static u8 rockchip_muxgrf_get_parent(struct clk_hw *hw)
+{
+	struct rockchip_muxgrf_clock *mux = to_muxgrf_clock(hw);
+	unsigned int mask = GENMASK(mux->width - 1, 0);
+	unsigned int val;
+
+	regmap_read(mux->regmap, mux->reg, &val);
+
+	val >>= mux->shift;
+	val &= mask;
+
+	return val;
+}
+
+static int rockchip_muxgrf_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rockchip_muxgrf_clock *mux = to_muxgrf_clock(hw);
+	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
+	unsigned int val;
+
+	val = index;
+	val <<= mux->shift;
+
+	if (mux->flags & CLK_MUX_HIWORD_MASK)
+		return regmap_write(mux->regmap, mux->reg, val | (mask << 16));
+	else
+		return regmap_update_bits(mux->regmap, mux->reg, mask, val);
+}
+
+static const struct clk_ops rockchip_muxgrf_clk_ops = {
+	.get_parent = rockchip_muxgrf_get_parent,
+	.set_parent = rockchip_muxgrf_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+
+struct clk *rockchip_clk_register_muxgrf(const char *name,
+				const char *const *parent_names, u8 num_parents,
+				int flags, struct regmap *regmap, int reg,
+				int shift, int width, int mux_flags)
+{
+	struct rockchip_muxgrf_clock *muxgrf_clock;
+	struct clk_init_data init;
+	struct clk *clk;
+
+	if (IS_ERR(regmap)) {
+		pr_err("%s: regmap not available\n", __func__);
+		return ERR_PTR(-ENOTSUPP);
+	}
+
+	muxgrf_clock = kmalloc(sizeof(*muxgrf_clock), GFP_KERNEL);
+	if (!muxgrf_clock)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = flags;
+	init.num_parents = num_parents;
+	init.parent_names = parent_names;
+	init.ops = &rockchip_muxgrf_clk_ops;
+
+	muxgrf_clock->hw.init = &init;
+	muxgrf_clock->regmap = regmap;
+	muxgrf_clock->reg = reg;
+	muxgrf_clock->shift = shift;
+	muxgrf_clock->width = width;
+	muxgrf_clock->flags = mux_flags;
+
+	clk = clk_register(NULL, &muxgrf_clock->hw);
+	if (IS_ERR(clk))
+		kfree(muxgrf_clock);
+
+	return clk;
+}
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index b886be3..3abcbf4 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -417,6 +417,13 @@ void __init rockchip_clk_register_branches(
 				list->mux_shift, list->mux_width,
 				list->mux_flags, &ctx->lock);
 			break;
+		case branch_muxgrf:
+			clk = rockchip_clk_register_muxgrf(list->name,
+				list->parent_names, list->num_parents,
+				flags, ctx->grf, list->muxdiv_offset,
+				list->mux_shift, list->mux_width,
+				list->mux_flags);
+			break;
 		case branch_divider:
 			if (list->div_table)
 				clk = clk_register_divider_table(NULL,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index d67eecc..58be202 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -317,11 +317,17 @@ struct clk *rockchip_clk_register_inverter(const char *name,
 				void __iomem *reg, int shift, int flags,
 				spinlock_t *lock);
 
+struct clk *rockchip_clk_register_muxgrf(const char *name,
+				const char *const *parent_names, u8 num_parents,
+				int flags, struct regmap *grf, int reg,
+				int shift, int width, int mux_flags);
+
 #define PNAME(x) static const char *const x[] __initconst
 
 enum rockchip_clk_branch_type {
 	branch_composite,
 	branch_mux,
+	branch_muxgrf,
 	branch_divider,
 	branch_fraction_divider,
 	branch_gate,
@@ -551,6 +557,21 @@ struct rockchip_clk_branch {
 		.gate_offset	= -1,				\
 	}
 
+#define MUXGRF(_id, cname, pnames, f, o, s, w, mf)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_muxgrf,		\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.muxdiv_offset	= o,				\
+		.mux_shift	= s,				\
+		.mux_width	= w,				\
+		.mux_flags	= mf,				\
+		.gate_offset	= -1,				\
+	}
+
 #define DIV(_id, cname, pname, f, o, s, w, df)			\
 	{							\
 		.id		= _id,				\
-- 
2.10.2

