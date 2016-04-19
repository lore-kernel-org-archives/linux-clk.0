Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([58.251.152.64]:30903 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520AbcDSCOX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2016 22:14:23 -0400
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
	<suwenping@hisilicon.com>, <raojun@hisilicon.com>,
	<ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
	<zhangzhenxing@hisilicon.com>, <hermit.wangheming@hisilicon.com>,
	<jiangheng@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH] reset: hisilicon: add reset controller driver for hisilicon SOCs
Date: Tue, 19 Apr 2016 09:56:21 +0800
Message-ID: <1461030981-17814-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In most of hisilicon SOCs, reset controller and clock provider are
combined together as a block named CRG (Clock and Reset Generator).
This patch mainly implements the reset function.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
    This patch is abstracted from the patch https://lkml.org/lkml/2016/3/31/190
"[RESEND PATCH v10 2/6] clk: hisilicon: add CRG driver for hi3519 soc". I have
fixed issuess pointed by Stephen Boyd, including adding const specifier for 
hisi_reset_ops definition and fixing the memory leak bugs. Because functions in
this patch will be used by many other hisilicon SOCs, I hope it can be merged
separately if it is OK. The whole CRG block driver including clock driver will
be submitted separately, too.   

 drivers/clk/hisilicon/Kconfig  |   7 +++
 drivers/clk/hisilicon/Makefile |   1 +
 drivers/clk/hisilicon/reset.c  | 127 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/reset.h  |  32 +++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h

diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index e434854..3cd349c 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -5,6 +5,13 @@ config COMMON_CLK_HI6220
 	help
 	  Build the Hisilicon Hi6220 clock driver based on the common clock framework.
 
+config RESET_HISI
+	bool "HiSilicon Reset Controller Driver"
+	depends on ARCH_HISI || COMPILE_TEST
+	select RESET_CONTROLLER
+	help
+	  Build reset controller driver for HiSilicon device chipsets.
+
 config STUB_CLK_HI6220
 	bool "Hi6220 Stub Clock Driver"
 	depends on COMMON_CLK_HI6220 && MAILBOX
diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
index 74dba31..c037753 100644
--- a/drivers/clk/hisilicon/Makefile
+++ b/drivers/clk/hisilicon/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
 obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
 obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
 obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
+obj-$(CONFIG_RESET_HISI)	+= reset.o
 obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
new file mode 100644
index 0000000..adb8425
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.c
@@ -0,0 +1,127 @@
+/*
+ * Hisilicon Reset Controller Driver
+ *
+ * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
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
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include "reset.h"
+
+#define	HISI_RESET_BIT_MASK	0x1f
+#define	HISI_RESET_OFFSET_SHIFT	8
+#define	HISI_RESET_OFFSET_MASK	0xffff00
+
+struct hisi_reset_controller {
+	spinlock_t	lock;
+	void __iomem	*membase;
+	struct reset_controller_dev	rcdev;
+};
+
+
+#define to_hisi_reset_controller(rcdev)  \
+	container_of(rcdev, struct hisi_reset_controller, rcdev)
+
+static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
+			const struct of_phandle_args *reset_spec)
+{
+	u32 offset;
+	u8 bit;
+
+	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
+		return -EINVAL;
+
+	offset = (reset_spec->args[0] << HISI_RESET_OFFSET_SHIFT)
+		& HISI_RESET_OFFSET_MASK;
+	bit = reset_spec->args[1] & HISI_RESET_BIT_MASK;
+	return (offset | bit);
+}
+
+static int hisi_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
+	unsigned long flags;
+	u32 offset, reg;
+	u8 bit;
+
+	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
+	bit = id & HISI_RESET_BIT_MASK;
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
+	unsigned long flags;
+	u32 offset, reg;
+	u8 bit;
+
+	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
+	bit = id & HISI_RESET_BIT_MASK;
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
+int hisi_reset_init(struct device_node *np)
+{
+	struct hisi_reset_controller *rstc;
+
+	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	rstc->membase = of_iomap(np, 0);
+	if (!rstc->membase) {
+		kfree(rstc);
+		return -EINVAL;
+	}
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->rcdev.owner = THIS_MODULE;
+	rstc->rcdev.ops = &hisi_reset_ops;
+	rstc->rcdev.of_node = np;
+	rstc->rcdev.of_reset_n_cells = 2;
+	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
+
+	return reset_controller_register(&rstc->rcdev);
+}
+EXPORT_SYMBOL_GPL(hisi_reset_init);
diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
new file mode 100644
index 0000000..ffad4d7
--- /dev/null
+++ b/drivers/clk/hisilicon/reset.h
@@ -0,0 +1,32 @@
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
+struct device_node;
+
+#ifdef CONFIG_RESET_CONTROLLER
+int hisi_reset_init(struct device_node *np);
+#else
+static inline int hisi_reset_init(struct device_node *np)
+{
+	return 0;
+}
+#endif
+
+#endif	/* __HISI_RESET_H */
-- 
1.9.1

