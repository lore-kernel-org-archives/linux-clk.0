Return-Path: <alexander.stein@systec-electronic.com>
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: ls1021a: new platform clock driver
Date: Wed, 22 Feb 2017 16:03:47 +0100
Message-Id: <20170222150349.16790-2-alexander.stein@systec-electronic.com>
In-Reply-To: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

This driver currently only implements the QSPI divider register
SCFG_QSPI_CFG.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/clk/Makefile      |  1 +
 drivers/clk/clk-ls1021a.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 drivers/clk/clk-ls1021a.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 925081e..611f53f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
+obj-$(CONFIG_SOC_LS1021A)		+= clk-ls1021a.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_ARCH_MB86S7X)		+= clk-mb86s7x.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
diff --git a/drivers/clk/clk-ls1021a.c b/drivers/clk/clk-ls1021a.c
new file mode 100644
index 0000000..2f64806
--- /dev/null
+++ b/drivers/clk/clk-ls1021a.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright (C) 2017 SYS TEC electronic GmbH
+ * Alexander Stein <alexander.stein@systec-electronic.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+static const struct clk_div_table qspi_cfg_div_table[] = {
+	{ 0x0, 256 }, { 0x1, 64 }, { 0x2, 32 }, { 0x3, 24 },
+	{ 0x4,  20 }, { 0x5, 15 }, { 0x6, 12 }, { 0x7,  8 },
+	{ 0 },
+};
+
+static void __init scfg_qspi_cfg_ls1021a_init(struct device_node *np)
+{
+	const char *parent_name;
+	const char *name;
+	void __iomem *base;
+	struct clk *parent_clk;
+	struct clk *clk;
+	struct resource res;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_warn("Failed to map address range for node %s\n", np->name);
+		return;
+	}
+
+	parent_clk = of_clk_get(np, 0);
+	if (IS_ERR(parent_clk)) {
+		pr_warn("Failed to get clock for node %s\n", np->name);
+		return;
+	}
+
+	/* Register the input clock under the desired name. */
+	parent_name = __clk_get_name(parent_clk);
+
+	if (of_property_read_string(np, "clock-output-names", &name))
+		name = np->name;
+
+	/* Works only as those 4 bits (Bits 28-31 big endian) do not cross byte boundary */
+	clk = clk_register_divider_table(NULL, name, parent_name,
+				   0, base,
+				   4, 4, 0, qspi_cfg_div_table, NULL);
+	if (IS_ERR(clk)) {
+		pr_warn("Failed to register divider table clock (%ld)\n", PTR_ERR(clk));
+		return;
+	}
+	of_clk_add_provider(np, of_clk_src_simple_get, clk);
+}
+CLK_OF_DECLARE(scfg_qspi_cfg_ls1021a, "fsl,scfg-qspi-cfg-ls1021a", scfg_qspi_cfg_ls1021a_init);
-- 
2.10.2
