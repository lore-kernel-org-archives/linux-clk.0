Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	tianshuliang <tianshuliang@hisilicon.com>
Subject: [PATCH v2 1/2] clk: hisilicon: add hisi phase clock support
Date: Mon,  5 Mar 2018 15:01:31 +0800
Message-Id: <1520233292-14704-2-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1520233292-14704-1-git-send-email-shawn.guo@linaro.org>
References: <1520233292-14704-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: tianshuliang <tianshuliang@hisilicon.com>

Add a phase clock type for HiSilicon SoCs,which supports
clk_set_phase operation.

Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/Makefile         |   2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c | 121 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.c            |  24 +++++++
 drivers/clk/hisilicon/clk.h            |  19 ++++++
 4 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/hisilicon/clk-hisi-phase.c

diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 4806fc2cb4ac..2a714c0f9657 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -3,7 +3,7 @@
 # Hisilicon Clock specific Makefile
 #
 
-obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o
+obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o clk-hisi-phase.o
 
 obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
diff --git a/drivers/clk/hisilicon/clk-hisi-phase.c b/drivers/clk/hisilicon/clk-hisi-phase.c
new file mode 100644
index 000000000000..42ce157ff828
--- /dev/null
+++ b/drivers/clk/hisilicon/clk-hisi-phase.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
+ *
+ * Simple HiSilicon phase clock implementation.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk.h"
+
+struct clk_hisi_phase {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u32		*phase_degrees;
+	u32		*phase_regvals;
+	u8		phase_num;
+	u32		mask;
+	u8		shift;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_clk_hisi_phase(_hw) container_of(_hw, struct clk_hisi_phase, hw)
+
+static int hisi_phase_regval_to_degrees(struct clk_hisi_phase *phase,
+					u32 regval)
+{
+	int i;
+
+	for (i = 0; i < phase->phase_num; i++)
+		if (phase->phase_regvals[i] == regval)
+			return phase->phase_degrees[i];
+
+	return -EINVAL;
+}
+
+static int hisi_clk_get_phase(struct clk_hw *hw)
+{
+	struct clk_hisi_phase *phase = to_clk_hisi_phase(hw);
+	u32 regval;
+
+	regval = readl(phase->reg);
+	regval = (regval & phase->mask) >> phase->shift;
+
+	return hisi_phase_regval_to_degrees(phase, regval);
+}
+
+static int hisi_phase_degrees_to_regval(struct clk_hisi_phase *phase,
+					int degrees)
+{
+	int i;
+
+	for (i = 0; i < phase->phase_num; i++)
+		if (phase->phase_degrees[i] == degrees)
+			return phase->phase_regvals[i];
+
+	return -EINVAL;
+}
+
+static int hisi_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hisi_phase *phase = to_clk_hisi_phase(hw);
+	unsigned long flags = 0;
+	int regval;
+	u32 val;
+
+	regval = hisi_phase_degrees_to_regval(phase, degrees);
+	if (regval < 0)
+		return regval;
+
+	spin_lock_irqsave(phase->lock, flags);
+
+	val = clk_readl(phase->reg);
+	val &= ~phase->mask;
+	val |= regval << phase->shift;
+	clk_writel(val, phase->reg);
+
+	spin_unlock_irqrestore(phase->lock, flags);
+
+	return 0;
+}
+
+const struct clk_ops clk_phase_ops = {
+	.get_phase = hisi_clk_get_phase,
+	.set_phase = hisi_clk_set_phase,
+};
+
+struct clk *clk_register_hisi_phase(struct device *dev,
+		const struct hisi_phase_clock *clks,
+		void __iomem *base, spinlock_t *lock)
+{
+	struct clk_hisi_phase *phase;
+	struct clk_init_data init;
+
+	phase = devm_kzalloc(dev, sizeof(struct clk_hisi_phase), GFP_KERNEL);
+	if (!phase)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = clks->name;
+	init.ops = &clk_phase_ops;
+	init.flags = clks->flags | CLK_IS_BASIC;
+	init.parent_names = clks->parent_names ? &clks->parent_names : NULL;
+	init.num_parents = clks->parent_names ? 1 : 0;
+
+	phase->reg = base + clks->offset;
+	phase->shift = clks->shift;
+	phase->mask = (BIT(clks->width) - 1) << clks->shift;
+	phase->lock = lock;
+	phase->phase_degrees = clks->phase_degrees;
+	phase->phase_regvals = clks->phase_regvals;
+	phase->phase_num = clks->phase_num;
+	phase->hw.init = &init;
+
+	return devm_clk_register(dev, &phase->hw);
+}
+EXPORT_SYMBOL_GPL(clk_register_hisi_phase);
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index b73c1dfae7f1..29046b8334c2 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -197,6 +197,30 @@ int hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_mux);
 
+int hisi_clk_register_phase(struct device *dev,
+			    const struct hisi_phase_clock *clks,
+			    int nums, struct hisi_clock_data *data)
+{
+	void __iomem *base = data->base;
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		clk = clk_register_hisi_phase(dev, &clks[i], base,
+					      &hisi_clk_lock);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+			       clks[i].name);
+			return PTR_ERR(clk);
+		}
+
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hisi_clk_register_phase);
+
 int hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 				      int nums, struct hisi_clock_data *data)
 {
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 4e1d1affc6f5..8d7ee5c3231b 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -68,6 +68,19 @@ struct hisi_mux_clock {
 	const char		*alias;
 };
 
+struct hisi_phase_clock {
+	unsigned int		id;
+	const char		*name;
+	const char		*parent_names;
+	unsigned long		flags;
+	unsigned long		offset;
+	u8			shift;
+	u8			width;
+	u32			*phase_degrees;
+	u32			*phase_regvals;
+	u8			phase_num;
+};
+
 struct hisi_divider_clock {
 	unsigned int		id;
 	const char		*name;
@@ -120,6 +133,12 @@ int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
 				int, struct hisi_clock_data *);
 int hisi_clk_register_mux(const struct hisi_mux_clock *, int,
 				struct hisi_clock_data *);
+struct clk *clk_register_hisi_phase(struct device *dev,
+				const struct hisi_phase_clock *clks,
+				void __iomem *base, spinlock_t *lock);
+int hisi_clk_register_phase(struct device *dev,
+				const struct hisi_phase_clock *clks,
+				int nums, struct hisi_clock_data *data);
 int hisi_clk_register_divider(const struct hisi_divider_clock *,
 				int, struct hisi_clock_data *);
 int hisi_clk_register_gate(const struct hisi_gate_clock *,
-- 
1.9.1
