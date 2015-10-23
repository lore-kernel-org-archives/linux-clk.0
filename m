Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v3] clk: tango4: clkgen driver for Tango4 ARM platforms
Message-ID: <562A5506.2070402@sigmadesigns.com>
Date: Fri, 23 Oct 2015 17:40:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>

Add support for Sigma Designs Tango4 (ARM-based) clock generator.
NOTE: This driver is incompatible with Tango3 clkgen.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Changes in v3:
Provide binding documentation
Don't unconditionally use hard-coded divider for sysclk

Changes in v2:
Provide missing includes
Use masks instead of bit-fields
Error handling
Style nits
Model the clkgen block as a single node
---
 .../devicetree/bindings/clock/tango4-clock.txt     | 27 ++++++++++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-tango4.c                           | 57 ++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
 create mode 100644 drivers/clk/clk-tango4.c

diff --git a/Documentation/devicetree/bindings/clock/tango4-clock.txt b/Documentation/devicetree/bindings/clock/tango4-clock.txt
new file mode 100644
index 000000000000..b60dba5f1107
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tango4-clock.txt
@@ -0,0 +1,27 @@
+* Sigma Designs Tango4 Clock Generator
+
+The Tango4 clock generator outputs cpu_clk and sys_clk (the latter is used
+for RAM and various peripheral devices). The clock binding described here
+is applicable to all Tango4 SoCs.
+
+Required Properties:
+
+- compatible: shall be "sigma,tango4-clkgen".
+
+- reg: physical base address of the device and length of memory mapped region.
+
+- clocks: phandle of the input (crystal oscillator).
+
+- clock-output-names: shall be "cpuclk" and "sysclk".
+
+- #clock-cells: shall be set to 1.
+
+Example:
+
+	clkgen: clkgen@10000 {
+		compatible = "sigma,tango4-clkgen";
+		reg = <0x10000 0x40>;
+		clocks = <&xtal>;
+		clock-output-names = "cpuclk", "sysclk";
+		#clock-cells = <1>;
+	};
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index c4cf075a2320..60f42251d32a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
 obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_STM32)		+= clk-stm32f4.o
+obj-$(CONFIG_ARCH_TANGOX)		+= clk-tango4.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_U300)			+= clk-u300.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
new file mode 100644
index 000000000000..9fbee8ce4a95
--- /dev/null
+++ b/drivers/clk/clk-tango4.c
@@ -0,0 +1,57 @@
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+static struct clk *out[2];
+static struct clk_onecell_data clk_data = { out, 2 };
+static void __iomem *clkgen_base;
+
+#define sysclk_div (clkgen_base + 0x20)
+#define cpuclk_div (clkgen_base + 0x24)
+
+#define PLL_N(val) ((val) >>  0 & 0x7f)
+#define PLL_K(val) ((val) >> 13 & 0x07)
+#define PLL_M(val) ((val) >> 16 & 0x07)
+
+#define DIV_INDEX ((readl_relaxed(clkgen_base + 0x3c) >> 8) & 15)
+
+static void __init make_pll(const char *name, const char *parent, int offset)
+{
+	unsigned int val, mul, div;
+
+	val = readl_relaxed(clkgen_base + offset);
+	mul =  PLL_N(val) + 1;
+	div = (PLL_M(val) + 1) << PLL_K(val);
+	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
+}
+
+static const u8 tab[16] __initconst = { 2, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4 };
+
+static void __init tango4_clkgen_setup(struct device_node *np)
+{
+	int ret, div;
+	const char *name = NULL;
+	const char *parent = of_clk_get_parent_name(np, 0);
+
+	clkgen_base = of_iomap(np, 0);
+	if (clkgen_base == NULL)
+		panic("%s: invalid address\n", np->full_name);
+
+	make_pll("pll0", parent, 0);
+	make_pll("pll1", parent, 8);
+
+	of_property_read_string_index(np, "clock-output-names", 0, &name);
+	out[0] = clk_register_divider(NULL, name, "pll0", 0,
+			cpuclk_div, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
+
+	div = readl_relaxed(sysclk_div) & BIT(23) ? tab[DIV_INDEX] : 4;
+	of_property_read_string_index(np, "clock-output-names", 1, &name);
+	out[1] = clk_register_fixed_factor(NULL, name, "pll1", 0, 1, div);
+
+	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
+		panic("%s: clk registration failed\n", np->full_name);
+}
+
+CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
-- 
2.4.5
