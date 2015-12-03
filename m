Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([58.251.152.64]:53058 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751510AbbLCCxm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 2 Dec 2015 21:53:42 -0500
From: Jiancheng Xue <xuejiancheng@huawei.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<xuwei5@hisilicon.com>, <haojian.zhuang@linaro.org>,
	<zhangfei.gao@linaro.org>, <bintian.wang@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
	<suwenping@hisilicon.com>, <ml.yang@hisilicon.com>,
	<gaofei@hisilicon.com>, Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v2 2/9] clk: hi3519: add CRG driver for hisilicon hi3519 soc
Date: Thu, 3 Dec 2015 10:40:28 +0800
Message-ID: <1449110428-23531-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The CRG(Clock and Reset Generator) module provides
clock and reset signals for other modules in hi3519 soc.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 drivers/clk/hisilicon/Makefile     |   1 +
 drivers/clk/hisilicon/clk-hi3519.c | 100 +++++++++++++++++++++++++
 drivers/clk/hisilicon/reset.c      | 149 +++++++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/reset.h      |  25 +++++++
 4 files changed, 275 insertions(+)
 create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h

diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 74dba31..9a601c0 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
+obj-$(CONFIG_ARCH_HI3519)	+= clk-hi3519.o reset.o
diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
new file mode 100644
index 0000000..893d464
--- /dev/null
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -0,0 +1,100 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/of_address.h>
+#include <dt-bindings/clock/hi3519-clock.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include "clk.h"
+#include "reset.h"
+
+static struct hisi_fixed_rate_clock hi3519_fixed_rate_clks[] __initdata = {
+	{ HI3519_FIXED_400M, "400m", NULL, CLK_IS_ROOT, 400000000, },
+	{ HI3519_FIXED_200M, "200m", NULL, CLK_IS_ROOT, 200000000, },
+	{ HI3519_FIXED_125M, "125m", NULL, CLK_IS_ROOT, 125000000, },
+	{ HI3519_FIXED_150M, "150m", NULL, CLK_IS_ROOT, 150000000, },
+	{ HI3519_FIXED_75M, "75m", NULL, CLK_IS_ROOT, 75000000, },
+	{ HI3519_FIXED_300M, "300m", NULL, CLK_IS_ROOT, 300000000, },
+	{ HI3519_FIXED_50M, "50m", NULL, CLK_IS_ROOT, 50000000, },
+	{ HI3519_FIXED_24M, "24m", NULL, CLK_IS_ROOT, 24000000, },
+	{ HI3519_FIXED_3M, "3m", NULL, CLK_IS_ROOT, 3000000, },
+};
+
+static const char *sysaxi_mux_p[] __initconst = {"24m", "200m", };
+static u32 sysaxi_mux_table[] = {0, 1};
+
+static const char *fmc_mux_p[] __initconst = {
+		"24m", "75m", "125m", "150m", "200m", "250m", "300m", "400m", };
+static u32 fmc_mux_table[] = {0, 1, 2, 3, 4, 5, 6, 7};
+
+static const char *i2c_mux_p[] __initconst = {"clk_sysapb", "50m"};
+static u32 i2c_mux_table[] = {0, 1};
+
+static struct hisi_mux_clock hi3519_mux_clks[] __initdata = {
+	{ HI3519_SYSAXI_MUX, "sysaxi_mux", sysaxi_mux_p,
+		ARRAY_SIZE(sysaxi_mux_p),
+		CLK_SET_RATE_PARENT, 0x34, 12, 2, 0, sysaxi_mux_table, },
+	{ HI3519_FMC_MUX, "fmc_mux", fmc_mux_p, ARRAY_SIZE(fmc_mux_p),
+		CLK_SET_RATE_PARENT, 0xc0, 2, 3, 0, fmc_mux_table, },
+	{ HI3519_I2C_MUX, "i2c_mux", i2c_mux_p, ARRAY_SIZE(i2c_mux_p),
+		CLK_SET_RATE_PARENT, 0xe4, 26, 1, 0, i2c_mux_table, },
+};
+
+static struct hisi_fixed_factor_clock hi3519_fixed_factor_clks[] __initdata = {
+	{ HI3519_SYSAPB_CLK, "clk_sysapb", "sysaxi_mux", 1, 4,
+		CLK_SET_RATE_PARENT},
+};
+
+static struct hisi_gate_clock hi3519_gate_clks[] __initdata = {
+	/* fmc */
+	{ HI3519_FMC_CLK, "clk_fmc", "fmc_mux",
+		CLK_SET_RATE_PARENT, 0xc0, 1, 0, },
+	/* uart */
+	{ HI3519_UART0_CLK, "clk_uart0", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 20, 0, },
+	{ HI3519_UART1_CLK, "clk_uart1", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 21, 0, },
+	{ HI3519_UART2_CLK, "clk_uart2", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 22, 0, },
+	{ HI3519_UART3_CLK, "clk_uart3", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 23, 0, },
+	{ HI3519_UART4_CLK, "clk_uart4", "24m",
+		CLK_SET_RATE_PARENT, 0xe4, 24, 0, },
+};
+
+static void __init hi3519_clk_init(struct device_node *np)
+{
+	struct hisi_clock_data *clk_data;
+
+	clk_data = hisi_clk_init(np, HI3519_NR_CLKS);
+	if (!clk_data)
+		return;
+	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
+		hisi_reset_init(np, HI3519_NR_RSTS);
+
+	hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
+				     ARRAY_SIZE(hi3519_fixed_rate_clks),
+				     clk_data);
+	hisi_clk_register_mux(hi3519_mux_clks, ARRAY_SIZE(hi3519_mux_clks),
+					clk_data);
+	hisi_clk_register_fixed_factor(hi3519_fixed_factor_clks,
+			ARRAY_SIZE(hi3519_fixed_factor_clks), clk_data);
+	hisi_clk_register_gate(hi3519_gate_clks,
+			ARRAY_SIZE(hi3519_gate_clks), clk_data);
+}
+
+CLK_OF_DECLARE(hi3519_clk, "hisilicon,hi3519-crg", hi3519_clk_init);
diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
new file mode 100644
index 0000000..3330fb9
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.c
@@ -0,0 +1,149 @@
+/*
+ * Hisilicon Reset Controller driver
+ *
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define	HISI_RESET_BIT_SHIFT	0
+#define	HISI_RESET_BIT_WIDTH	16
+#define	HISI_RESET_OFFSET_SHIFT	16
+#define	HISI_RESET_OFFSET_WIDTH	16
+
+struct hisi_reset_controller {
+	spinlock_t					lock;
+	void __iomem				*membase;
+	struct reset_controller_dev	rcdev;
+};
+
+
+#define to_hisi_reset_controller(rcdev)  \
+	container_of(rcdev, struct hisi_reset_controller, rcdev)
+
+/*31                        16                         0
+ * |---reset_spec->args[0]---|---reset_spec->args[1]---|
+ * |-------reg_offset--------|--------reg_bit----------|
+ */
+static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
+			const struct of_phandle_args *reset_spec)
+{
+	unsigned int offset, bit, id;
+	const __be32 *addr;
+	u64 size;
+
+	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
+		return -EINVAL;
+
+	addr = of_get_address(rcdev->of_node, 0, &size, NULL);
+	if (!addr)
+		return -EINVAL;
+
+	if (reset_spec->args[1] >= 32
+		|| reset_spec->args[0] + reset_spec->args[1] / 8 > size)
+		return -EINVAL;
+
+	offset = reset_spec->args[0] & (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = (reset_spec->args[1] & (BIT(HISI_RESET_BIT_WIDTH) - 1));
+	id = offset << HISI_RESET_OFFSET_SHIFT | bit;
+
+	return id;
+}
+
+static int hisi_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
+	unsigned int offset, bit;
+	unsigned long flags;
+	u32 reg;
+
+	offset = id >> HISI_RESET_OFFSET_SHIFT;
+	offset &= (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = id & (BIT(HISI_RESET_BIT_WIDTH) - 1);
+
+	spin_lock_irqsave(&rstc->lock, flags);
+
+	reg = readl(rstc->membase + offset);
+	writel(reg | BIT(bit), rstc->membase + offset);
+
+	spin_unlock_irqrestore(&rstc->lock, flags);
+
+	return 0;
+}
+
+static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
+	unsigned int offset, bit;
+	unsigned long flags;
+	u32 reg;
+
+	offset = id >> HISI_RESET_OFFSET_SHIFT;
+	offset &= (BIT(HISI_RESET_OFFSET_WIDTH) - 1);
+	bit = id & (BIT(HISI_RESET_BIT_WIDTH) - 1);
+
+	spin_lock_irqsave(&rstc->lock, flags);
+
+	reg = readl(rstc->membase + offset);
+	writel(reg & ~BIT(bit), rstc->membase + offset);
+
+	spin_unlock_irqrestore(&rstc->lock, flags);
+
+	return 0;
+}
+
+static struct reset_control_ops hisi_reset_ops = {
+	.assert		= hisi_reset_assert,
+	.deassert	= hisi_reset_deassert,
+};
+
+int __init hisi_reset_init(struct device_node *np,
+					     int nr_rsts)
+{
+	struct hisi_reset_controller *rstc;
+
+	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	rstc->membase = of_iomap(np, 0);
+	if (!rstc->membase)
+		return -EINVAL;
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->rcdev.owner = THIS_MODULE;
+	rstc->rcdev.nr_resets = nr_rsts;
+	rstc->rcdev.ops = &hisi_reset_ops;
+	rstc->rcdev.of_node = np;
+	rstc->rcdev.of_reset_n_cells = 2;
+	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
+
+	return reset_controller_register(&rstc->rcdev);
+}
+
diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
new file mode 100644
index 0000000..74bea4e
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef	__HISI_RESET_H
+#define	__HISI_RESET_H
+
+#include <linux/of.h>
+
+int __init hisi_reset_init(struct device_node *np, int nr_rsts);
+
+#endif	/* __HISI_RESET_H */
-- 
1.9.1

