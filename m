Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Hendrik v . Raven" <hendrik@consetetur.de>
Subject: [PATCH v2 3/8] clk: meson: add audio clock divider support
Date: Fri, 31 Mar 2017 15:04:06 +0200
Message-Id: <20170331130411.4781-4-jbrunet@baylibre.com>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The audio divider needs a specific clock divider driver.
With am mpll parent clock, which is able to provide a fairly precise rate,
the generic divider tends to select low value of the divider. In such case
the quality of the clock is very poor. For the same final rate, maximizing
the audio clock divider value and selecting the corresponding mpll rate
gives better results. This is what this driver aims to acheive. So far, so
good.

Cc: Hendrik v. Raven <hendrik@consetetur.de>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile            |   2 +-
 drivers/clk/meson/clk-audio-divider.c | 144 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h              |  10 +++
 3 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/clk-audio-divider.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 349583405b7c..83b6d9d65aa1 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,6 +2,6 @@
 # Makefile for Meson specific clk
 #
 
-obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o clk-mpll.o clk-audio-divider.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
 obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o
diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
new file mode 100644
index 000000000000..6c07db06642d
--- /dev/null
+++ b/drivers/clk/meson/clk-audio-divider.c
@@ -0,0 +1,144 @@
+/*
+ * Copyright (c) 2017 AmLogic, Inc.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * i2s master clock divider: The algorithm of the generic clk-divider used with
+ * a very precise clock parent such as the mpll tends to select a low divider
+ * factor. This gives poor results with this particular divider, especially with
+ * high frequencies (> 100 MHz)
+ *
+ * This driver try to select the maximum possible divider with the rate the
+ * upstream clock can provide.
+ */
+
+#include <linux/clk-provider.h>
+#include "clkc.h"
+
+#define to_meson_clk_audio_divider(_hw) container_of(_hw, \
+				struct meson_clk_audio_divider, hw)
+
+static int _div_round(unsigned long parent_rate, unsigned long rate,
+		      unsigned long flags)
+{
+	if (flags & CLK_DIVIDER_ROUND_CLOSEST)
+		return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, rate);
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+}
+
+static int _get_val(unsigned long parent_rate, unsigned long rate)
+{
+	return DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
+}
+
+static int _valid_divider(struct clk_hw *hw, int divider)
+{
+	struct meson_clk_audio_divider *adiv =
+		to_meson_clk_audio_divider(hw);
+	int max_divider;
+	u8 width;
+
+	width = adiv->div.width;
+	max_divider = 1 << width;
+
+	return clamp(divider, 1, max_divider);
+}
+
+static unsigned long audio_divider_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct meson_clk_audio_divider *adiv =
+		to_meson_clk_audio_divider(hw);
+	struct parm *p;
+	unsigned long reg, divider;
+
+	p = &adiv->div;
+	reg = readl(adiv->base + p->reg_off);
+	divider = PARM_GET(p->width, p->shift, reg) + 1;
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, divider);
+}
+
+static long audio_divider_round_rate(struct clk_hw *hw,
+				     unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	struct meson_clk_audio_divider *adiv =
+		to_meson_clk_audio_divider(hw);
+	unsigned long max_prate;
+	int divider;
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+		divider = _div_round(*parent_rate, rate, adiv->flags);
+		divider = _valid_divider(hw, divider);
+		return DIV_ROUND_UP_ULL((u64)*parent_rate, divider);
+	}
+
+	/* Get the maximum parent rate */
+	max_prate = clk_hw_round_rate(clk_hw_get_parent(hw), ULONG_MAX);
+
+	/* Get the corresponding rounded down divider */
+	divider = max_prate / rate;
+	divider = _valid_divider(hw, divider);
+
+	/* Get actual rate of the parent */
+	*parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
+					 divider * rate);
+
+	return DIV_ROUND_UP_ULL((u64)*parent_rate, divider);
+}
+
+static int audio_divider_set_rate(struct clk_hw *hw,
+				  unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct meson_clk_audio_divider *adiv =
+		to_meson_clk_audio_divider(hw);
+	struct parm *p;
+	unsigned long reg, flags = 0;
+	int val;
+
+	val = _get_val(parent_rate, rate);
+
+	if (adiv->lock)
+		spin_lock_irqsave(adiv->lock, flags);
+	else
+		__acquire(adiv->lock);
+
+	p = &adiv->div;
+	reg = readl(adiv->base + p->reg_off);
+	reg = PARM_SET(p->width, p->shift, reg, val);
+	writel(reg, adiv->base + p->reg_off);
+
+	if (adiv->lock)
+		spin_unlock_irqrestore(adiv->lock, flags);
+	else
+		__release(adiv->lock);
+
+	return 0;
+}
+
+const struct clk_ops meson_clk_audio_divider_ro_ops = {
+	.recalc_rate	= audio_divider_recalc_rate,
+	.round_rate	= audio_divider_round_rate,
+};
+
+const struct clk_ops meson_clk_audio_divider_ops = {
+	.recalc_rate	= audio_divider_recalc_rate,
+	.round_rate	= audio_divider_round_rate,
+	.set_rate	= audio_divider_set_rate,
+};
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index b0c9999d03de..d6feafe8bd6c 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -121,6 +121,14 @@ struct meson_clk_mpll {
 	spinlock_t *lock;
 };
 
+struct meson_clk_audio_divider {
+	struct clk_hw hw;
+	void __iomem *base;
+	struct parm div;
+	u8 flags;
+	spinlock_t *lock;
+};
+
 #define MESON_GATE(_name, _reg, _bit)					\
 struct clk_gate _name = { 						\
 	.reg = (void __iomem *) _reg, 					\
@@ -141,5 +149,7 @@ extern const struct clk_ops meson_clk_pll_ops;
 extern const struct clk_ops meson_clk_cpu_ops;
 extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
+extern const struct clk_ops meson_clk_audio_divider_ro_ops;
+extern const struct clk_ops meson_clk_audio_divider_ops;
 
 #endif /* __CLKC_H */
-- 
2.9.3
