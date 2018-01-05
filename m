Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>
CC: <jdelvare@suse.de>, <jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<kevin-cw.chen@mediatek.com>, <shunli.wang@mediatek.com>,
	<chen.zhong@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2] clk: mediatek: adjust dependency of reset.c to avoid unexpectedly being built
Date: Fri, 5 Jan 2018 16:14:06 +0800
Message-ID: <0a88c7902606e819438ef0f1fc5968960e718620.1515139760.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Changes from v1->v2:
Add 'select RESET_CONTROLLER' under COMMON_CLK_MEDIATEK and enable
reset.c to be built when COMMON_CLK_MEDIATEK is selected. That should
be quite reasonable because the reset controller is tightly embedded
inside and exported from these clock subsystems. At least it can be found
on infracfg and pericfg subsystem that both are really fundamental block
lots of devices must depend on.

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
 drivers/clk/mediatek/Kconfig   | 1 +
 drivers/clk/mediatek/Makefile  | 3 +--
 drivers/clk/mediatek/clk-mtk.h | 7 -------
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7338f81..1f9ea0f 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -6,6 +6,7 @@ menu "Clock driver for MediaTek SoC"
 
 config COMMON_CLK_MEDIATEK
 	bool
+	select RESET_CONTROLLER
 	---help---
 	  MediaTek SoCs' clock support.
 
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c421ffc..5160fdc 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o
-obj-$(CONFIG_RESET_CONTROLLER) += reset.o
+obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o clk-cpumux.o reset.o
 obj-$(CONFIG_COMMON_CLK_MT6797) += clk-mt6797.o
 obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
 obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf8006d..f83c2bb 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -229,14 +229,7 @@ void mtk_clk_register_plls(struct device_node *node,
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
-#ifdef CONFIG_RESET_CONTROLLER
 void mtk_register_reset_controller(struct device_node *np,
 			unsigned int num_regs, int regofs);
-#else
-static inline void mtk_register_reset_controller(struct device_node *np,
-			unsigned int num_regs, int regofs)
-{
-}
-#endif
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.7.4
