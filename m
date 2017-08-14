Return-Path: <Eugeniy.Paltsev@synopsys.com>
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2] ARC: clk: introduce HSDKv1 pll driver
Date: Mon, 14 Aug 2017 19:39:46 +0300
Message-Id: <20170814163946.18154-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

HSDKv1 board manages its clocks using various PLLs. These PLL have same
dividers and corresponding control registers mapped to different addresses.
So we add one common driver for such PLLs.

Each PLL on HSDK board consists of three dividers: IDIV, FBDIV and
ODIV. Output clock value is managed using these dividers.

We add pre-defined tables with supported rate values and appropriate
configurations of IDIV, FBDIV and ODIV for each value.

As of today we add support for PLLs that generate clock for the
HSDKv1 arc cpus, system, ddr, AXI tunnel and hdmi.

By this patch we add support for several plls (arc cpus pll and others),
so we had to use two different init types: CLK_OF_DECLARE for arc cpus pll
and regular probing for others plls.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1 -> v2:
 * Remove all MODULE* defines as this driver can't be build as module.
 * Simplified hsdk_pll_is_err and hsdk_pll_is_locked functions.
 * Use unsigned long fo best_rate in hsdk_pll_round_rate.
 * Use of_clk_get_parent_count to get num_parents.
 * Other small changes.

 .../bindings/clock/snps,hsdkv1-pll-clock.txt       |  28 ++
 MAINTAINERS                                        |   6 +
 drivers/clk/Kconfig                                |   7 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-hsdk-pll.c                         | 350 +++++++++++++++++++++
 5 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/snps,hsdkv1-pll-clock.txt
 create mode 100644 drivers/clk/clk-hsdk-pll.c

diff --git a/Documentation/devicetree/bindings/clock/snps,hsdkv1-pll-clock.txt b/Documentation/devicetree/bindings/clock/snps,hsdkv1-pll-clock.txt
new file mode 100644
index 0000000..3580aa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/snps,hsdkv1-pll-clock.txt
@@ -0,0 +1,28 @@
+Binding for the HSDKv1 Generic PLL clock
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible: should be "snps,hsdk-<name>-pll-clock"
+  "snps,hsdk-core-pll-clock"
+  "snps,hsdk-gp-pll-clock"
+  "snps,hsdk-hdmi-pll-clock"
+- reg : should contain base register location and length.
+- clocks: shall be the input parent clock phandle for the PLL.
+- #clock-cells: from common clock binding; Should always be set to 0.
+
+Example:
+	input_clk: input-clk {
+		clock-frequency = <33333333>;
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	cpu_clk: cpu-clk@0 {
+		compatible = "snps,hsdk-core-pll-clock";
+		reg = <0x00 0x10>;
+		#clock-cells = <0>;
+		clocks = <&input_clk>;
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 93dfb9d..035861f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12698,6 +12698,12 @@ F:	drivers/clocksource/arc_timer.c
 F:	drivers/tty/serial/arc_uart.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
 
+SYNOPSYS ARC HSDKv1 SDP pll clock driver
+M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+S:	Supported
+F:	drivers/clk/clk-hsdk-pll.c
+F:	Documentation/devicetree/bindings/clock/snps,hsdkv1-pll-clock.txt
+
 SYNOPSYS ARC SDP clock driver
 M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
 S:	Supported
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a874b72..4af8edf 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -31,6 +31,13 @@ config COMMON_CLK_WM831X
 
 source "drivers/clk/versatile/Kconfig"
 
+config CLK_HSDK_V1
+	bool "PLL Driver for HSDKv1 platform"
+	depends on OF || COMPILE_TEST
+	---help---
+	  This driver supports the HSDKv1 core, system, ddr, tunnel and hdmi PLLs
+	  control.
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cd376b3..91e6cbd 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
+obj-$(CONFIG_CLK_HSDK_V1)		+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_ARCH_MB86S7X)		+= clk-mb86s7x.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
new file mode 100644
index 0000000..656d93a
--- /dev/null
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -0,0 +1,350 @@
+/*
+ * Synopsys HSDKv1 SDP Generic PLL clock driver
+ *
+ * Copyright (C) 2017 Synopsys
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define CGU_PLL_CTRL	0x000 /* ARC PLL control register */
+#define CGU_PLL_STATUS	0x004 /* ARC PLL status register */
+#define CGU_PLL_FMEAS	0x008 /* ARC PLL frequency measurement register */
+#define CGU_PLL_MON	0x00C /* ARC PLL monitor register */
+
+#define CGU_PLL_CTRL_ODIV_SHIFT		2
+#define CGU_PLL_CTRL_IDIV_SHIFT		4
+#define CGU_PLL_CTRL_FBDIV_SHIFT	9
+#define CGU_PLL_CTRL_BAND_SHIFT		20
+
+#define CGU_PLL_CTRL_ODIV_MASK		GENMASK(3, CGU_PLL_CTRL_ODIV_SHIFT)
+#define CGU_PLL_CTRL_IDIV_MASK		GENMASK(8, CGU_PLL_CTRL_IDIV_SHIFT)
+#define CGU_PLL_CTRL_FBDIV_MASK		GENMASK(15, CGU_PLL_CTRL_FBDIV_SHIFT)
+
+#define CGU_PLL_CTRL_PD			BIT(0)
+#define CGU_PLL_CTRL_BYPASS		BIT(1)
+
+#define CGU_PLL_STATUS_LOCK		BIT(0)
+#define CGU_PLL_STATUS_ERR		BIT(1)
+
+#define HSDK_PLL_MAX_LOCK_TIME		100 /* 100 us */
+
+#define CGU_PLL_SOURCE_MAX		1
+
+struct hsdk_pll_cfg {
+	u32 rate;
+	u32 idiv;
+	u32 fbdiv;
+	u32 odiv;
+	u32 band;
+};
+
+static const struct hsdk_pll_cfg asdt_pll_cfg[] = {
+	{ 100000000,  0, 11, 3, 0 },
+	{ 133000000,  0, 15, 3, 0 },
+	{ 200000000,  1, 47, 3, 0 },
+	{ 233000000,  1, 27, 2, 0 },
+	{ 300000000,  1, 35, 2, 0 },
+	{ 333000000,  1, 39, 2, 0 },
+	{ 400000000,  1, 47, 2, 0 },
+	{ 500000000,  0, 14, 1, 0 },
+	{ 600000000,  0, 17, 1, 0 },
+	{ 700000000,  0, 20, 1, 0 },
+	{ 800000000,  0, 23, 1, 0 },
+	{ 900000000,  1, 26, 0, 0 },
+	{ 1000000000, 1, 29, 0, 0 },
+	{ 1100000000, 1, 32, 0, 0 },
+	{ 1200000000, 1, 35, 0, 0 },
+	{ 1300000000, 1, 38, 0, 0 },
+	{ 1400000000, 1, 41, 0, 0 },
+	{ 1500000000, 1, 44, 0, 0 },
+	{ 1600000000, 1, 47, 0, 0 },
+	{}
+};
+
+static const struct hsdk_pll_cfg hdmi_pll_cfg[] = {
+	{ 297000000,  0, 21, 2, 0 },
+	{ 540000000,  0, 19, 1, 0 },
+	{ 594000000,  0, 21, 1, 0 },
+	{}
+};
+
+struct hsdk_pll_clk {
+	struct clk_hw hw;
+	void __iomem *regs;
+	const struct hsdk_pll_cfg *pll_cfg;
+	struct device *dev;
+};
+
+static inline void hsdk_pll_write(struct hsdk_pll_clk *clk, u32 reg, u32 val)
+{
+	iowrite32(val, clk->regs + reg);
+}
+
+static inline u32 hsdk_pll_read(struct hsdk_pll_clk *clk, u32 reg)
+{
+	return ioread32(clk->regs + reg);
+}
+
+static inline void hsdk_pll_set_cfg(struct hsdk_pll_clk *clk,
+				    const struct hsdk_pll_cfg *cfg)
+{
+	u32 val = 0;
+
+	/* Powerdown and Bypass bits should be cleared */
+	val |= cfg->idiv << CGU_PLL_CTRL_IDIV_SHIFT;
+	val |= cfg->fbdiv << CGU_PLL_CTRL_FBDIV_SHIFT;
+	val |= cfg->odiv << CGU_PLL_CTRL_ODIV_SHIFT;
+	val |= cfg->band << CGU_PLL_CTRL_BAND_SHIFT;
+
+	dev_dbg(clk->dev, "write configurarion: %#x\n", val);
+
+	hsdk_pll_write(clk, CGU_PLL_CTRL, val);
+}
+
+static inline bool hsdk_pll_is_locked(struct hsdk_pll_clk *clk)
+{
+	return !!(hsdk_pll_read(clk, CGU_PLL_STATUS) & CGU_PLL_STATUS_LOCK);
+}
+
+static inline bool hsdk_pll_is_err(struct hsdk_pll_clk *clk)
+{
+	return !!(hsdk_pll_read(clk, CGU_PLL_STATUS) & CGU_PLL_STATUS_ERR);
+}
+
+static inline struct hsdk_pll_clk *to_hsdk_pll_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct hsdk_pll_clk, hw);
+}
+
+static unsigned long hsdk_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	u32 val;
+	u64 rate;
+	u32 idiv, fbdiv, odiv;
+	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
+
+	val = hsdk_pll_read(clk, CGU_PLL_CTRL);
+
+	dev_dbg(clk->dev, "current configurarion: %#x\n", val);
+
+	/* Check if PLL is disabled */
+	if (val & CGU_PLL_CTRL_PD)
+		return 0;
+
+	/* Check if PLL is bypassed */
+	if (val & CGU_PLL_CTRL_BYPASS)
+		return parent_rate;
+
+	/* input divider = reg.idiv + 1 */
+	idiv = 1 + ((val & CGU_PLL_CTRL_IDIV_MASK) >> CGU_PLL_CTRL_IDIV_SHIFT);
+	/* fb divider = 2*(reg.fbdiv + 1) */
+	fbdiv = 2 * (1 + ((val & CGU_PLL_CTRL_FBDIV_MASK) >> CGU_PLL_CTRL_FBDIV_SHIFT));
+	/* output divider = 2^(reg.odiv) */
+	odiv = 1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >> CGU_PLL_CTRL_ODIV_SHIFT);
+
+	rate = (u64)parent_rate * fbdiv;
+	do_div(rate, idiv * odiv);
+
+	return rate;
+}
+
+static long hsdk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *prate)
+{
+	int i;
+	unsigned long best_rate;
+	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
+	const struct hsdk_pll_cfg *pll_cfg = clk->pll_cfg;
+
+	if (pll_cfg[0].rate == 0)
+		return -EINVAL;
+
+	best_rate = pll_cfg[0].rate;
+
+	for (i = 1; pll_cfg[i].rate != 0; i++) {
+		if (abs(rate - pll_cfg[i].rate) < abs(rate - best_rate))
+			best_rate = pll_cfg[i].rate;
+	}
+
+	dev_dbg(clk->dev, "chosen best rate: %lu\n", best_rate);
+
+	return best_rate;
+}
+
+static int hsdk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			     unsigned long parent_rate)
+{
+	int i;
+	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
+	const struct hsdk_pll_cfg *pll_cfg = clk->pll_cfg;
+
+	for (i = 0; pll_cfg[i].rate != 0; i++) {
+		if (pll_cfg[i].rate == rate) {
+			hsdk_pll_set_cfg(clk, &pll_cfg[i]);
+
+			/*
+			 * Wait until CGU relocks and check error status.
+			 * If after timeout CGU is unlocked yet return error.
+			 */
+			udelay(HSDK_PLL_MAX_LOCK_TIME);
+			if (!hsdk_pll_is_locked(clk))
+				return -ETIMEDOUT;
+
+			if (hsdk_pll_is_err(clk))
+				return -EINVAL;
+
+			return 0;
+		}
+	}
+
+	dev_err(clk->dev, "invalid rate=%ld, parent_rate=%ld\n", rate,
+			parent_rate);
+
+	return -EINVAL;
+}
+
+static const struct clk_ops hsdk_pll_ops = {
+	.recalc_rate = hsdk_pll_recalc_rate,
+	.round_rate = hsdk_pll_round_rate,
+	.set_rate = hsdk_pll_set_rate,
+};
+
+static int hsdk_pll_clk_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct resource *mem;
+	const char *parent_name;
+	unsigned int num_parents;
+	struct hsdk_pll_clk *pll_clk;
+	struct clk_init_data init = { };
+	struct device *dev = &pdev->dev;
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pll_clk->regs = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(pll_clk->regs))
+		return PTR_ERR(pll_clk->regs);
+
+	init.name = dev->of_node->name;
+	init.ops = &hsdk_pll_ops;
+	parent_name = of_clk_get_parent_name(dev->of_node, 0);
+	init.parent_names = &parent_name;
+	num_parents = of_clk_get_parent_count(dev->of_node);
+	if (num_parents == 0 || num_parents > CGU_PLL_SOURCE_MAX) {
+		dev_err(dev, "wrong clock parents number: %u\n", num_parents);
+		return -EINVAL;
+	}
+	init.num_parents = num_parents;
+
+	pll_clk->hw.init = &init;
+	pll_clk->dev = dev;
+	pll_clk->pll_cfg = of_device_get_match_data(dev);
+
+	if (!pll_clk->pll_cfg) {
+		dev_err(dev, "No OF match data provided\n");
+		return -EINVAL;
+	}
+
+	ret = devm_clk_hw_register(dev, &pll_clk->hw);
+	if (ret) {
+		dev_err(dev, "failed to register %s clock\n", init.name);
+		return ret;
+	}
+
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+			&pll_clk->hw);
+}
+
+static int hsdk_pll_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static void __init of_hsdk_pll_clk_setup(struct device_node *node)
+{
+	int ret;
+	const char *parent_name;
+	unsigned int num_parents;
+	struct hsdk_pll_clk *pll_clk;
+	struct clk_init_data init = { };
+
+	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return;
+
+	pll_clk->regs = of_iomap(node, 0);
+	if (!pll_clk->regs) {
+		pr_err("failed to map pll registers\n");
+		goto err_free_pll_clk;
+	}
+
+	init.name = node->name;
+	init.ops = &hsdk_pll_ops;
+	parent_name = of_clk_get_parent_name(node, 0);
+	init.parent_names = &parent_name;
+	num_parents = of_clk_get_parent_count(node);
+	if (num_parents > CGU_PLL_SOURCE_MAX) {
+		pr_err("too much clock parents: %u\n", num_parents);
+		goto err_unmap_regs;
+	}
+	init.num_parents = num_parents;
+
+	pll_clk->hw.init = &init;
+	pll_clk->pll_cfg = asdt_pll_cfg;
+
+	ret = clk_hw_register(NULL, &pll_clk->hw);
+	if (ret) {
+		pr_err("failed to register %s clock\n", node->name);
+		goto err_unmap_regs;
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &pll_clk->hw);
+	if (ret) {
+		pr_err("failed to add hw provider for %s clock\n", node->name);
+		goto err_unmap_regs;
+	}
+
+	return;
+
+err_unmap_regs:
+	iounmap(pll_clk->regs);
+err_free_pll_clk:
+	kfree(pll_clk);
+}
+
+/* Core PLL needed early for ARC cpus timers */
+CLK_OF_DECLARE(hsdk_pll_clock, "snps,hsdk-core-pll-clock",
+of_hsdk_pll_clk_setup);
+
+static const struct of_device_id hsdk_pll_clk_id[] = {
+	{ .compatible = "snps,hsdk-gp-pll-clock", .data = &asdt_pll_cfg},
+	{ .compatible = "snps,hsdk-hdmi-pll-clock", .data = &hdmi_pll_cfg},
+	{ }
+};
+
+static struct platform_driver hsdk_pll_clk_driver = {
+	.driver = {
+		.name = "hsdk-gp-pll-clock",
+		.of_match_table = hsdk_pll_clk_id,
+	},
+	.probe = hsdk_pll_clk_probe,
+	.remove = hsdk_pll_clk_remove,
+};
+builtin_platform_driver(hsdk_pll_clk_driver);
-- 
2.9.3
