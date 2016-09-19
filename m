Return-Path: <keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 1/3] clk: Loongson1: Refactor Loongson1 clock
Date: Mon, 19 Sep 2016 12:38:54 +0800
Message-Id: <1474259936-9657-2-git-send-email-keguang.zhang@gmail.com>
In-Reply-To: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
References: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kelvin Cheung <keguang.zhang@gmail.com>

Factor out the common functions into loongson1/clk.c
to support both Loongson1B and Loongson1C. And, put
the rest into loongson1/clk-loongson1b.c.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

---
v1:
   Rebase the patch on clk: ls1x: Migrate to clk_hw based OF
   and registration APIs.
---
 drivers/clk/Makefile                               |  2 +-
 drivers/clk/loongson1/Makefile                     |  2 +
 .../clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} | 51 ++--------------------
 drivers/clk/loongson1/clk.c                        | 43 ++++++++++++++++++
 drivers/clk/loongson1/clk.h                        | 19 ++++++++
 5 files changed, 69 insertions(+), 48 deletions(-)
 create mode 100644 drivers/clk/loongson1/Makefile
 rename drivers/clk/{clk-ls1x.c => loongson1/clk-loongson1b.c} (78%)
 create mode 100644 drivers/clk/loongson1/clk.c
 create mode 100644 drivers/clk/loongson1/clk.h

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8264d81..925081e 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
-obj-$(CONFIG_MACH_LOONGSON32)		+= clk-ls1x.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_ARCH_MB86S7X)		+= clk-mb86s7x.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
@@ -61,6 +60,7 @@ obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-$(CONFIG_ARCH_MXC)			+= imx/
 obj-$(CONFIG_MACH_INGENIC)		+= ingenic/
 obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+= keystone/
+obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
 obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
 obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
 obj-$(CONFIG_MACH_PIC32)		+= microchip/
diff --git a/drivers/clk/loongson1/Makefile b/drivers/clk/loongson1/Makefile
new file mode 100644
index 0000000..5a162a1
--- /dev/null
+++ b/drivers/clk/loongson1/Makefile
@@ -0,0 +1,2 @@
+obj-y				+= clk.o
+obj-$(CONFIG_LOONGSON1_LS1B)	+= clk-loongson1b.o
diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/loongson1/clk-loongson1b.c
similarity index 78%
rename from drivers/clk/clk-ls1x.c
rename to drivers/clk/loongson1/clk-loongson1b.c
index 8430e45..5b6817e 100644
--- a/drivers/clk/clk-ls1x.c
+++ b/drivers/clk/loongson1/clk-loongson1b.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012 Zhang, Keguang <keguang.zhang@gmail.com>
+ * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
  *
  * This program is free software; you can redistribute  it and/or modify it
  * under  the terms of  the GNU General  Public License as published by the
@@ -10,25 +10,16 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-#include <linux/slab.h>
 #include <linux/err.h>
 
 #include <loongson1.h>
+#include "clk.h"
 
 #define OSC		(33 * 1000000)
 #define DIV_APB		2
 
 static DEFINE_SPINLOCK(_lock);
 
-static int ls1x_pll_clk_enable(struct clk_hw *hw)
-{
-	return 0;
-}
-
-static void ls1x_pll_clk_disable(struct clk_hw *hw)
-{
-}
-
 static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
 {
@@ -43,44 +34,9 @@ static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops ls1x_pll_clk_ops = {
-	.enable = ls1x_pll_clk_enable,
-	.disable = ls1x_pll_clk_disable,
 	.recalc_rate = ls1x_pll_recalc_rate,
 };
 
-static struct clk_hw *__init clk_hw_register_pll(struct device *dev,
-						 const char *name,
-						 const char *parent_name,
-						 unsigned long flags)
-{
-	int ret;
-	struct clk_hw *hw;
-	struct clk_init_data init;
-
-	/* allocate the divider */
-	hw = kzalloc(sizeof(struct clk_hw), GFP_KERNEL);
-	if (!hw) {
-		pr_err("%s: could not allocate clk_hw\n", __func__);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	init.name = name;
-	init.ops = &ls1x_pll_clk_ops;
-	init.flags = flags | CLK_IS_BASIC;
-	init.parent_names = (parent_name ? &parent_name : NULL);
-	init.num_parents = (parent_name ? 1 : 0);
-	hw->init = &init;
-
-	/* register the clock */
-	ret = clk_hw_register(dev, hw);
-	if (ret) {
-		kfree(hw);
-		hw = ERR_PTR(ret);
-	}
-
-	return hw;
-}
-
 static const char * const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk", };
 static const char * const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk", };
 static const char * const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
@@ -93,7 +49,8 @@ void __init ls1x_clk_init(void)
 	clk_hw_register_clkdev(hw, "osc_33m_clk", NULL);
 
 	/* clock derived from 33 MHz OSC clk */
-	hw = clk_hw_register_pll(NULL, "pll_clk", "osc_33m_clk", 0);
+	hw = clk_hw_register_pll(NULL, "pll_clk", "osc_33m_clk",
+				 &ls1x_pll_clk_ops, 0);
 	clk_hw_register_clkdev(hw, "pll_clk", NULL);
 
 	/* clock derived from PLL clk */
diff --git a/drivers/clk/loongson1/clk.c b/drivers/clk/loongson1/clk.c
new file mode 100644
index 0000000..cfcfd14
--- /dev/null
+++ b/drivers/clk/loongson1/clk.c
@@ -0,0 +1,43 @@
+/*
+ * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
+
+struct clk_hw *__init clk_hw_register_pll(struct device *dev,
+					  const char *name,
+					  const char *parent_name,
+					  const struct clk_ops *ops,
+					  unsigned long flags)
+{
+	int ret;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+
+	/* allocate the divider */
+	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = ops;
+	init.flags = flags | CLK_IS_BASIC;
+	init.parent_names = (parent_name ? &parent_name : NULL);
+	init.num_parents = (parent_name ? 1 : 0);
+	hw->init = &init;
+
+	/* register the clock */
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(hw);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/loongson1/clk.h b/drivers/clk/loongson1/clk.h
new file mode 100644
index 0000000..085d74b
--- /dev/null
+++ b/drivers/clk/loongson1/clk.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __LOONGSON1_CLK_H
+#define __LOONGSON1_CLK_H
+
+struct clk_hw *clk_hw_register_pll(struct device *dev,
+				   const char *name,
+				   const char *parent_name,
+				   const struct clk_ops *ops,
+				   unsigned long flags);
+
+#endif /* __LOONGSON1_CLK_H */
-- 
1.9.1
