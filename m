Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<kevin-cw.chen@mediatek.com>, <shunli.wang@mediatek.com>,
	<chen.zhong@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] clk: mediatek: adjust dependency of reset.c to avoid unexpectedly being built
Date: Tue, 26 Dec 2017 11:52:31 +0800
Message-ID: <5a6347a5196a5eba85dce9ac7c3b9392b832f1f8.1514259933.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

commit 74cb0d6dde8 ("clk: mediatek: fixup test-building of MediaTek clock
drivers") can let the build system looking into the directory where the
clock drivers resides and then allow test-building the drivers.

But the change also gives rise to certain incorrect behavior which is
reset.c being built even not depending on either COMPILE_TEST or
ARCH_MEDIATEK alternative dependency. To get rid of reset.c being built
unexpectedly on the other platforms, it would be a good change that the
file should be built depending on its own specific configuration rather
than just on generic RESET_CONTROLLER one.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Jean Delvare <jdelvare@suse.de>
---
 drivers/clk/mediatek/Kconfig   | 7 +++++++
 drivers/clk/mediatek/Makefile  | 2 +-
 drivers/clk/mediatek/clk-mtk.h | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7338f81..52d880a 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -9,6 +9,13 @@ config COMMON_CLK_MEDIATEK
 	---help---
 	  MediaTek SoCs' clock support.
 
+config RESET_MEDIATEK
+	bool "MediaTek Reset Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on RESET_CONTROLLER
+	help
+	  This enables the reset controller driver used on MediaTek SoCs.
+
 config COMMON_CLK_MT2701
 	bool "Clock driver for MediaTek MT2701"
 	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c421ffc..2a48006 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o
-obj-$(CONFIG_RESET_CONTROLLER) += reset.o
+obj-$(CONFIG_RESET_MEDIATEK) += reset.o
 obj-$(CONFIG_COMMON_CLK_MT6797) += clk-mt6797.o
 obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
 obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf8006d..0322dec 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -229,7 +229,7 @@ void mtk_clk_register_plls(struct device_node *node,
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
-#ifdef CONFIG_RESET_CONTROLLER
+#ifdef CONFIG_RESET_MEDIATEK
 void mtk_register_reset_controller(struct device_node *np,
 			unsigned int num_regs, int regofs);
 #else
-- 
2.7.4
