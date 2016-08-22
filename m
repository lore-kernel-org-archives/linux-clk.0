Return-Path: <gnaygnil@gmail.com>
Return-Path: <gnaygnil@gmail.com>
Date: Mon, 22 Aug 2016 12:50:39 +0800
From: Yang Ling <gnaygnil@gmail.com>
To: keguang.zhang@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] CLK: Add Loongson1C clock support
Message-ID: <20160822045034.GA6545@ly-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

This patch adds clock support to Loongson1C SoC.

Signed-off-by: Yang Ling <gnaygnil@gmail.com>

---
V2:
  Use loongson1 generic clock interface.
---
 drivers/clk/loongson1/Makefile         |   1 +
 drivers/clk/loongson1/clk-loongson1c.c | 102 +++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/clk/loongson1/clk-loongson1c.c

diff --git a/drivers/clk/loongson1/Makefile b/drivers/clk/loongson1/Makefile
index 5a162a1..b7f6a16 100644
--- a/drivers/clk/loongson1/Makefile
+++ b/drivers/clk/loongson1/Makefile
@@ -1,2 +1,3 @@
 obj-y				+= clk.o
 obj-$(CONFIG_LOONGSON1_LS1B)	+= clk-loongson1b.o
+obj-$(CONFIG_LOONGSON1_LS1C)	+= clk-loongson1c.o
diff --git a/drivers/clk/loongson1/clk-loongson1c.c b/drivers/clk/loongson1/clk-loongson1c.c
new file mode 100644
index 0000000..7e7e5ff
--- /dev/null
+++ b/drivers/clk/loongson1/clk-loongson1c.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+
+#include <loongson1.h>
+#include "clk.h"
+
+#define OSC		(24 * 1000000)
+#define DIV_APB		1
+
+static DEFINE_SPINLOCK(_lock);
+
+static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	u32 pll, rate;
+
+	pll = __raw_readl(LS1X_CLK_PLL_FREQ);
+	rate = ((pll >> 8) & 0xff) + ((pll >> 16) & 0xff);
+	rate *= OSC;
+	rate >>= 2;
+
+	return rate;
+}
+
+static const struct clk_ops ls1x_pll_clk_ops = {
+	.enable = ls1x_pll_clk_enable,
+	.disable = ls1x_pll_clk_disable,
+	.recalc_rate = ls1x_pll_recalc_rate,
+};
+
+static const char *const cpu_parents[] = { "cpu_clk_div", "osc_clk", };
+static const char *const ahb_parents[] = { "ahb_clk_div", "osc_clk", };
+static const char *const dc_parents[] = { "dc_clk_div", "osc_clk", };
+
+static const struct clk_div_table ahb_div_table[] = {
+	[0] = {	.val = 0, .div = 2 },
+	[1] = {	.val = 1, .div = 4 },
+	[2] = {	.val = 2, .div = 3 },
+	[3] = {	.val = 3, .div = 3 },
+};
+
+void __init ls1x_clk_init(void)
+{
+	struct clk *clk;
+
+	clk = clk_register_fixed_rate(NULL, "osc_clk", NULL, 0, OSC);
+	clk_register_clkdev(clk, "osc_clk", NULL);
+
+	/* clock derived from 24 MHz OSC clk */
+	clk = clk_register_pll(NULL, "pll_clk", "osc_clk",
+				&ls1x_pll_clk_ops, 0);
+	clk_register_clkdev(clk, "pll_clk", NULL);
+
+	clk = clk_register_divider(NULL, "cpu_clk_div", "pll_clk",
+				   CLK_GET_RATE_NOCACHE, LS1X_CLK_PLL_DIV,
+				   DIV_CPU_SHIFT, DIV_CPU_WIDTH,
+				   CLK_DIVIDER_ONE_BASED |
+				   CLK_DIVIDER_ROUND_CLOSEST, &_lock);
+	clk_register_clkdev(clk, "cpu_clk_div", NULL);
+	clk = clk_register_fixed_factor(NULL, "cpu_clk", "cpu_clk_div",
+					0, 1, 1);
+	clk_register_clkdev(clk, "cpu_clk", NULL);
+
+	clk = clk_register_divider(NULL, "dc_clk_div", "pll_clk",
+				   0, LS1X_CLK_PLL_DIV, DIV_DC_SHIFT,
+				   DIV_DC_WIDTH, CLK_DIVIDER_ONE_BASED, &_lock);
+	clk_register_clkdev(clk, "dc_clk_div", NULL);
+	clk = clk_register_fixed_factor(NULL, "dc_clk", "dc_clk_div", 0, 1, 1);
+	clk_register_clkdev(clk, "dc_clk", NULL);
+
+	clk = clk_register_divider_table(NULL, "ahb_clk_div", "cpu_clk_div",
+				0, LS1X_CLK_PLL_FREQ, DIV_DDR_SHIFT,
+				DIV_DDR_WIDTH, CLK_DIVIDER_ALLOW_ZERO,
+				ahb_div_table, &_lock);
+	clk_register_clkdev(clk, "ahb_clk_div", NULL);
+	clk = clk_register_fixed_factor(NULL, "ahb_clk", "ahb_clk_div",
+					0, 1, 1);
+	clk_register_clkdev(clk, "ahb_clk", NULL);
+	clk_register_clkdev(clk, "ls1x-dma", NULL);
+	clk_register_clkdev(clk, "stmmaceth", NULL);
+
+	/* clock derived from AHB clk */
+	clk = clk_register_fixed_factor(NULL, "apb_clk", "ahb_clk", 0, 1,
+					DIV_APB);
+	clk_register_clkdev(clk, "apb_clk", NULL);
+	clk_register_clkdev(clk, "ls1x-ac97", NULL);
+	clk_register_clkdev(clk, "ls1x-i2c", NULL);
+	clk_register_clkdev(clk, "ls1x-nand", NULL);
+	clk_register_clkdev(clk, "ls1x-pwmtimer", NULL);
+	clk_register_clkdev(clk, "ls1x-spi", NULL);
+	clk_register_clkdev(clk, "ls1x-wdt", NULL);
+	clk_register_clkdev(clk, "serial8250", NULL);
+}
-- 
1.9.1
