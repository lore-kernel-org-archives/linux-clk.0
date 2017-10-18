Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <hermit.wangheming@hisilicon.com>, <shawn.guo@linaro.org>,
        <project-aspen-dev@linaro.org>,
        tianshuliang <tianshuliang@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 1/3] clk: hisilicon: add hisi phase clock support
Date: Wed, 18 Oct 2017 07:00:27 -0400
Message-ID: <1508324429-6012-2-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: tianshuliang <tianshuliang@hisilicon.com>

Add a phase clock type for HiSilicon SoCs,which supports
clk_set_phase operation.

Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/Makefile         |   2 +-
 drivers/clk/hisilicon/clk-hisi-phase.c | 117 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk.c            |  45 +++++++++++++
 drivers/clk/hisilicon/clk.h            |  22 +++++++
 4 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/hisilicon/clk-hisi-phase.c

diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 1e4c3dd..7189f07 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -2,7 +2,7 @@
 # Hisilicon Clock specific Makefile
 #
 
-obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o
+obj-y	+= clk.o clkgate-separated.o clkdivider-hi6220.o clk-hisi-phase.o
 
 obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
diff --git a/drivers/clk/hisilicon/clk-hisi-phase.c b/drivers/clk/hisilicon/clk-hisi-phase.c
new file mode 100644
index 0000000..436f0a1
--- /dev/null
+++ b/drivers/clk/hisilicon/clk-hisi-phase.c
@@ -0,0 +1,117 @@
+/*
+ * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Simple HiSilicon phase clock implementation.
+ */
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include "clk.h"
+
+struct clk_hisi_phase {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u32		*phase_values;
+	u32		*phase_regs;
+	u8		phase_num;
+	u32		mask;
+	u8		shift;
+	u8		flags;
+	spinlock_t	*lock;
+};
+#define to_clk_hisi_phase(_hw) container_of(_hw, struct clk_hisi_phase, hw)
+
+static u32 hisi_clk_get_phase_reg(struct clk_hisi_phase *phase, int degrees)
+{
+	int i;
+
+	for (i = 0; i < phase->phase_num; i++)
+		if (phase->phase_values[i] == degrees)
+			return phase->phase_regs[i];
+
+	return -EINVAL;
+}
+
+static int hisi_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hisi_phase *phase = to_clk_hisi_phase(hw);
+	u32 val, phase_reg;
+	unsigned long flags = 0;
+
+	phase_reg = hisi_clk_get_phase_reg(phase, degrees);
+	if (phase_reg < 0)
+		return phase_reg;
+
+	if (phase->lock)
+		spin_lock_irqsave(phase->lock, flags);
+	else
+		__acquire(phase->lock);
+
+	val = clk_readl(phase->reg);
+	val &= ~(phase->mask << phase->shift);
+	val |= phase_reg << phase->shift;
+	clk_writel(val, phase->reg);
+
+	if (phase->lock)
+		spin_unlock_irqrestore(phase->lock, flags);
+	else
+		__release(phase->lock);
+
+	return 0;
+}
+
+const struct clk_ops clk_phase_ops = {
+	.set_phase = hisi_clk_set_phase,
+};
+
+void clk_unregister_hisi_phase(struct clk *clk)
+{
+	struct clk_hisi_phase *phase;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	phase = to_clk_hisi_phase(hw);
+	clk_unregister(clk);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_hisi_phase);
+
+struct clk *clk_register_hisi_phase(struct device *dev,
+		const struct hisi_phase_clock *clks,
+		void __iomem *base, spinlock_t *lock)
+{
+	struct clk_hisi_phase *phase;
+	struct clk *clk;
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
+	phase->mask = BIT(clks->width) - 1;
+	phase->lock = lock;
+	phase->phase_values = clks->phase_values;
+	phase->phase_regs = clks->phase_regs;
+	phase->phase_num = clks->phase_num;
+	phase->hw.init = &init;
+
+	clk = clk_register(NULL, &phase->hw);
+	return clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_hisi_phase);
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index b73c1df..e3adfad 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -197,6 +197,51 @@ int hisi_clk_register_mux(const struct hisi_mux_clock *clks,
 }
 EXPORT_SYMBOL_GPL(hisi_clk_register_mux);
 
+int hisi_clk_register_phase(struct device *dev,
+			const struct hisi_phase_clock *clks,
+			int nums, struct hisi_clock_data *data)
+{
+	int i;
+	struct clk *clk;
+	void __iomem *base = data->base;
+
+	for (i = 0; i < nums; i++) {
+		clk =	clk_register_hisi_phase(dev,
+				&clks[i], base, &hisi_clk_lock);
+
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n",
+			       __func__, clks[i].name);
+			goto err;
+		}
+
+		data->clk_data.clks[clks[i].id] = clk;
+	}
+	return 0;
+
+err:
+	while (i--)
+		clk_unregister_hisi_phase(data->clk_data.clks[clks[i].id]);
+
+	return PTR_ERR(clk);
+}
+EXPORT_SYMBOL_GPL(hisi_clk_register_phase);
+
+void hisi_clk_unregister_phase(const struct hisi_phase_clock *clks,
+				int nums, struct hisi_clock_data *data)
+{
+	struct clk **clocks = data->clk_data.clks;
+	int i, id;
+
+	for (i = 0; i < nums; i++) {
+		id = clks[i].id;
+
+		if (clocks[id])
+			clk_unregister_hisi_phase(clocks[id]);
+	}
+}
+EXPORT_SYMBOL_GPL(hisi_clk_unregister_phase);
+
 int hisi_clk_register_divider(const struct hisi_divider_clock *clks,
 				      int nums, struct hisi_clock_data *data)
 {
diff --git a/drivers/clk/hisilicon/clk.h b/drivers/clk/hisilicon/clk.h
index 4e1d1af..bc18730 100644
--- a/drivers/clk/hisilicon/clk.h
+++ b/drivers/clk/hisilicon/clk.h
@@ -68,6 +68,19 @@ struct hisi_mux_clock {
 	const char		*alias;
 };
 
+struct hisi_phase_clock {
+	unsigned int    id;
+	const char      *name;
+	const char      *parent_names;
+	unsigned long   flags;
+	unsigned long   offset;
+	u8		shift;
+	u8		width;
+	u32		*phase_values;
+	u32		*phase_regs;
+	u8		phase_num;
+};
+
 struct hisi_divider_clock {
 	unsigned int		id;
 	const char		*name;
@@ -120,6 +133,15 @@ int hisi_clk_register_fixed_factor(const struct hisi_fixed_factor_clock *,
 				int, struct hisi_clock_data *);
 int hisi_clk_register_mux(const struct hisi_mux_clock *, int,
 				struct hisi_clock_data *);
+struct clk *clk_register_hisi_phase(struct device *dev,
+				const struct hisi_phase_clock *clks,
+				void __iomem *base, spinlock_t *lock);
+void clk_unregister_hisi_phase(struct clk *clk);
+int hisi_clk_register_phase(struct device *dev,
+				const struct hisi_phase_clock *clks,
+				int nums, struct hisi_clock_data *data);
+void hisi_clk_unregister_phase(const struct hisi_phase_clock *clks,
+				int nums, struct hisi_clock_data *data);
 int hisi_clk_register_divider(const struct hisi_divider_clock *,
 				int, struct hisi_clock_data *);
 int hisi_clk_register_gate(const struct hisi_gate_clock *,
-- 
2.7.4
