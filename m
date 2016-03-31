Return-Path: <Jose.Abreu@synopsys.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com,
	sboyd@codeaurora.org, mturquette@baylibre.com,
	Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH v3] clk/axs10x: Add I2S PLL clock driver
Date: Thu, 31 Mar 2016 18:08:14 +0100
Message-Id: <4018d5e586f6a5b37c665000fbec8f6aad9388f3.1459443839.git.joabreu@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

The ARC SDP I2S clock can be programmed using a
specific PLL.

This patch has the goal of adding a clock driver
that programs this PLL.

At this moment the rate values are hardcoded in
a table but in the future it would be ideal to
use a function which determines the PLL values
given the desired rate.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
---

Changes v2 -> v3:
* Implemented recalc_rate

Changes v1 -> v2:
* Renamed folder to axs10x (as suggested by Alexey Brodkin)
* Added more supported rates

 arch/arc/boot/dts/axs10x_mb.dtsi   |   5 ++
 drivers/clk/Makefile               |   1 +
 drivers/clk/axs10x/Makefile        |   1 +
 drivers/clk/axs10x/i2s_pll_clock.c | 163 +++++++++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 drivers/clk/axs10x/Makefile
 create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index ab5d570..9c68226 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -23,6 +23,11 @@
 				#clock-cells = <0>;
 			};
 
+			i2sclk: i2sclk {
+				compatible = "snps,i2s-pll-clock";
+				#clock-cells = <0>;
+			};
+
 			apbclk: apbclk {
 				compatible = "fixed-clock";
 				clock-frequency = <50000000>;
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 46869d6..2ca62dc6 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -84,3 +84,4 @@ obj-$(CONFIG_X86)			+= x86/
 obj-$(CONFIG_ARCH_ZX)			+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_H8300)		+= h8300/
+obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
diff --git a/drivers/clk/axs10x/Makefile b/drivers/clk/axs10x/Makefile
new file mode 100644
index 0000000..01996b8
--- /dev/null
+++ b/drivers/clk/axs10x/Makefile
@@ -0,0 +1 @@
+obj-y += i2s_pll_clock.o
diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
new file mode 100644
index 0000000..f050e70
--- /dev/null
+++ b/drivers/clk/axs10x/i2s_pll_clock.c
@@ -0,0 +1,163 @@
+/*
+ * Synopsys AXS10X SDP I2S PLL clock driver
+ *
+ * Copyright (C) 2016 Synopsys
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+/* FPGA Version Info */
+#define FPGA_VER_INFO	0xE0011230
+#define FPGA_VER_27M	0x000FBED9
+
+/* PLL registers addresses */
+#define PLL_IDIV_ADDR	0xE00100A0
+#define PLL_FBDIV_ADDR	0xE00100A4
+#define PLL_ODIV0_ADDR	0xE00100A8
+#define PLL_ODIV1_ADDR	0xE00100AC
+
+struct i2s_pll_cfg {
+	unsigned int rate;
+	unsigned int idiv;
+	unsigned int fbdiv;
+	unsigned int odiv0;
+	unsigned int odiv1;
+};
+
+static struct i2s_pll_cfg i2s_pll_cfg_27m[] = {
+	/* 27 Mhz */
+	{ 1024000, 0x104, 0x451, 0x10E38, 0x2000 },
+	{ 1411200, 0x104, 0x596, 0x10D35, 0x2000 },
+	{ 1536000, 0x208, 0xA28, 0x10B2C, 0x2000 },
+	{ 2048000, 0x82, 0x451, 0x10E38, 0x2000 },
+	{ 2822400, 0x82, 0x596, 0x10D35, 0x2000 },
+	{ 3072000, 0x104, 0xA28, 0x10B2C, 0x2000 },
+	{ 2116800, 0x82, 0x3CF, 0x10C30, 0x2000 },
+	{ 2304000, 0x104, 0x79E, 0x10B2C, 0x2000 },
+	{ 0, 0, 0, 0, 0 },
+};
+
+static struct i2s_pll_cfg i2s_pll_cfg_28m[] = {
+	/* 28.224 Mhz */
+	{ 1024000, 0x82, 0x105, 0x107DF, 0x2000 },
+	{ 1411200, 0x28A, 0x1, 0x10001, 0x2000 },
+	{ 1536000, 0xA28, 0x187, 0x10042, 0x2000 },
+	{ 2048000, 0x41, 0x105, 0x107DF, 0x2000 },
+	{ 2822400, 0x145, 0x1, 0x10001, 0x2000 },
+	{ 3072000, 0x514, 0x187, 0x10042, 0x2000 },
+	{ 2116800, 0x514, 0x42, 0x10001, 0x2000 },
+	{ 2304000, 0x619, 0x82, 0x10001, 0x2000 },
+	{ 0, 0, 0, 0, 0 },
+};
+
+struct i2s_pll_clk {
+	struct clk_hw hw;
+	unsigned long ref_clk;
+	struct i2s_pll_cfg *pll_cfg;
+};
+
+static inline struct i2s_pll_clk *to_i2s_pll_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct i2s_pll_clk, hw);
+}
+
+static unsigned int i2s_pll_get_value(unsigned int val)
+{
+	return ((val & 0x3F) + ((val >> 6) & 0x3F));
+}
+
+static unsigned long i2s_pll_recalc_rate(struct clk_hw *hw,
+			unsigned long parent_rate)
+{
+	struct i2s_pll_clk *clk = to_i2s_pll_clk(hw);
+	unsigned int idiv, fbdiv, odiv;
+
+	idiv = i2s_pll_get_value(readl((void *)PLL_IDIV_ADDR));
+	fbdiv = i2s_pll_get_value(readl((void *)PLL_FBDIV_ADDR));
+	odiv = i2s_pll_get_value(readl((void *)PLL_ODIV0_ADDR));
+
+	return (((clk->ref_clk / idiv ) * fbdiv) / odiv);
+}
+
+static long i2s_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate)
+{
+	/* TODO: Round rate to nearest valid rate */
+	return rate;
+}
+
+static int i2s_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long parent_rate)
+{
+	struct i2s_pll_cfg *pll_cfg = to_i2s_pll_clk(hw)->pll_cfg;
+	int i;
+
+	for (i = 0; pll_cfg[i].rate != 0; i++) {
+		if (pll_cfg[i].rate == rate) {
+			writel(pll_cfg[i].idiv, (void *)PLL_IDIV_ADDR);
+			writel(pll_cfg[i].fbdiv, (void *)PLL_FBDIV_ADDR);
+			writel(pll_cfg[i].odiv0, (void *)PLL_ODIV0_ADDR);
+			writel(pll_cfg[i].odiv1, (void *)PLL_ODIV1_ADDR);
+			return 0;
+		}
+	}
+
+	pr_err("%s: invalid rate=%ld, parent_rate=%ld\n", __func__,
+			rate, parent_rate);
+	return -EINVAL;
+}
+
+static const struct clk_ops i2s_pll_ops = {
+	.recalc_rate = i2s_pll_recalc_rate,
+	.round_rate = i2s_pll_round_rate,
+	.set_rate = i2s_pll_set_rate,
+};
+
+static void __init i2s_pll_clk_setup(struct device_node *node)
+{
+	const char *clk_name = node->name;
+	struct clk *clk;
+	struct i2s_pll_clk *pll_clk;
+	struct clk_init_data init;
+
+	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return;
+
+	init.name = clk_name;
+	init.ops = &i2s_pll_ops;
+	init.flags = CLK_IS_BASIC;
+	init.num_parents = 0;
+	pll_clk->hw.init = &init;
+
+	clk = clk_register(NULL, &pll_clk->hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register %s div clock (%ld)\n",
+				__func__, clk_name, PTR_ERR(clk));
+		goto free_clock;
+	}
+
+	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M) {
+		pll_clk->ref_clk = 27000000;
+		pll_clk->pll_cfg = i2s_pll_cfg_27m;
+	} else {
+		pll_clk->ref_clk = 28224000;
+		pll_clk->pll_cfg = i2s_pll_cfg_28m;
+	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	return;
+
+free_clock:
+	kfree(pll_clk);
+}
+
+CLK_OF_DECLARE(i2s_pll_clk, "snps,i2s-pll-clock", i2s_pll_clk_setup);
+
-- 
1.9.1
