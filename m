Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: versatile: delete old RealView clock implementation
Date: Fri, 12 May 2017 09:40:49 +0200
Message-Id: <20170512074049.15139-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The old RealView clock implementation is not used anymore
(nothing in the kernel calls realview_clk_init()) as we have
moved all clocks over to device tree. Delete it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/Makefile             |  1 -
 drivers/clk/versatile/clk-realview.c       | 97 ------------------------------
 include/linux/platform_data/clk-realview.h |  1 -
 3 files changed, 99 deletions(-)
 delete mode 100644 drivers/clk/versatile/clk-realview.c
 delete mode 100644 include/linux/platform_data/clk-realview.h

diff --git a/drivers/clk/versatile/Makefile b/drivers/clk/versatile/Makefile
index 794130402c8d..58b54b814a6d 100644
--- a/drivers/clk/versatile/Makefile
+++ b/drivers/clk/versatile/Makefile
@@ -1,6 +1,5 @@
 # Makefile for Versatile-specific clocks
 obj-$(CONFIG_ICST)		+= icst.o clk-icst.o clk-versatile.o
 obj-$(CONFIG_INTEGRATOR_IMPD1)	+= clk-impd1.o
-obj-$(CONFIG_ARCH_REALVIEW)	+= clk-realview.o
 obj-$(CONFIG_CLK_SP810)		+= clk-sp810.o
 obj-$(CONFIG_CLK_VEXPRESS_OSC)	+= clk-vexpress-osc.o
diff --git a/drivers/clk/versatile/clk-realview.c b/drivers/clk/versatile/clk-realview.c
deleted file mode 100644
index 6fdfee3232f4..000000000000
--- a/drivers/clk/versatile/clk-realview.c
+++ /dev/null
@@ -1,97 +0,0 @@
-/*
- * Clock driver for the ARM RealView boards
- * Copyright (C) 2012 Linus Walleij
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-#include <linux/clkdev.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/clk-provider.h>
-
-#include "icst.h"
-#include "clk-icst.h"
-
-#define REALVIEW_SYS_OSC0_OFFSET             0x0C
-#define REALVIEW_SYS_OSC1_OFFSET             0x10
-#define REALVIEW_SYS_OSC2_OFFSET             0x14
-#define REALVIEW_SYS_OSC3_OFFSET             0x18
-#define REALVIEW_SYS_OSC4_OFFSET             0x1C	/* OSC1 for RealView/AB */
-#define REALVIEW_SYS_LOCK_OFFSET             0x20
-
-/*
- * Implementation of the ARM RealView clock trees.
- */
-
-static const struct icst_params realview_oscvco_params = {
-	.ref		= 24000000,
-	.vco_max	= ICST307_VCO_MAX,
-	.vco_min	= ICST307_VCO_MIN,
-	.vd_min		= 4 + 8,
-	.vd_max		= 511 + 8,
-	.rd_min		= 1 + 2,
-	.rd_max		= 127 + 2,
-	.s2div		= icst307_s2div,
-	.idx2s		= icst307_idx2s,
-};
-
-static const struct clk_icst_desc realview_osc0_desc __initconst = {
-	.params = &realview_oscvco_params,
-	.vco_offset = REALVIEW_SYS_OSC0_OFFSET,
-	.lock_offset = REALVIEW_SYS_LOCK_OFFSET,
-};
-
-static const struct clk_icst_desc realview_osc4_desc __initconst = {
-	.params = &realview_oscvco_params,
-	.vco_offset = REALVIEW_SYS_OSC4_OFFSET,
-	.lock_offset = REALVIEW_SYS_LOCK_OFFSET,
-};
-
-/*
- * realview_clk_init() - set up the RealView clock tree
- */
-void __init realview_clk_init(void __iomem *sysbase, bool is_pb1176)
-{
-	struct clk *clk;
-
-	/* APB clock dummy */
-	clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, 0, 0);
-	clk_register_clkdev(clk, "apb_pclk", NULL);
-
-	/* 24 MHz clock */
-	clk = clk_register_fixed_rate(NULL, "clk24mhz", NULL, 0, 24000000);
-	clk_register_clkdev(clk, NULL, "dev:uart0");
-	clk_register_clkdev(clk, NULL, "dev:uart1");
-	clk_register_clkdev(clk, NULL, "dev:uart2");
-	clk_register_clkdev(clk, NULL, "fpga:kmi0");
-	clk_register_clkdev(clk, NULL, "fpga:kmi1");
-	clk_register_clkdev(clk, NULL, "fpga:mmc0");
-	clk_register_clkdev(clk, NULL, "dev:ssp0");
-	if (is_pb1176) {
-		/*
-		 * UART3 is on the dev chip in PB1176
-		 * UART4 only exists in PB1176
-		 */
-		clk_register_clkdev(clk, NULL, "dev:uart3");
-		clk_register_clkdev(clk, NULL, "dev:uart4");
-	} else
-		clk_register_clkdev(clk, NULL, "fpga:uart3");
-
-
-	/* 1 MHz clock */
-	clk = clk_register_fixed_rate(NULL, "clk1mhz", NULL, 0, 1000000);
-	clk_register_clkdev(clk, NULL, "sp804");
-
-	/* ICST VCO clock */
-	if (is_pb1176)
-		clk = icst_clk_register(NULL, &realview_osc0_desc,
-					"osc0", NULL, sysbase);
-	else
-		clk = icst_clk_register(NULL, &realview_osc4_desc,
-					"osc4", NULL, sysbase);
-
-	clk_register_clkdev(clk, NULL, "dev:clcd");
-	clk_register_clkdev(clk, NULL, "issp:clcd");
-}
diff --git a/include/linux/platform_data/clk-realview.h b/include/linux/platform_data/clk-realview.h
deleted file mode 100644
index 2e426a7dbc51..000000000000
--- a/include/linux/platform_data/clk-realview.h
+++ /dev/null
@@ -1 +0,0 @@
-void realview_clk_init(void __iomem *sysbase, bool is_pb1176);
-- 
2.9.3
