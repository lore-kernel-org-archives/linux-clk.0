Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: [PATCH v4] clk: tango4: clkgen driver for Tango4 platforms
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>
CC: clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
References: <562A5506.2070402@sigmadesigns.com>
 <20151029005658.GA19782@codeaurora.org>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <563361B8.7090300@sigmadesigns.com>
Date: Fri, 30 Oct 2015 13:25:28 +0100
MIME-Version: 1.0
In-Reply-To: <20151029005658.GA19782@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Provide support for Sigma Designs Tango4 clock generator.
NOTE: This driver is incompatible with Tango3 clkgen.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Changes in v4:
Make base a local variable
Don't use of_property_read_string_index()
Change macros to constant offsets, and use base + FOO
Style nits

Changes in v3:
Provide binding documentation
Don't unconditionally use hard-coded divider for sysclk

Changes in v2:
Provide missing includes
Use masks instead of bit-fields
Error handling
Style nits
Model the clkgen block as a single node
--- .../devicetree/bindings/clock/tango4-clock.txt     | 23 ++++++++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-tango4.c                           | 61 ++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
 create mode 100644 drivers/clk/clk-tango4.c

diff --git a/Documentation/devicetree/bindings/clock/tango4-clock.txt b/Documentation/devicetree/bindings/clock/tango4-clock.txt
new file mode 100644
index 000000000000..19c580a7bda2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tango4-clock.txt
@@ -0,0 +1,23 @@
+* Sigma Designs Tango4 Clock Generator
+
+The Tango4 clock generator outputs cpu_clk and sys_clk (the latter is used
+for RAM and various peripheral devices). The clock binding described here
+is applicable to all Tango4 SoCs.
+
+Required Properties:
+
+- compatible: should be "sigma,tango4-clkgen".
+- reg: physical base address of the device and length of memory mapped region.
+- clocks: phandle of the input clock (crystal oscillator).
+- clock-output-names: should be "cpuclk" and "sysclk".
+- #clock-cells: should be set to 1.
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
index 000000000000..1ef192289fd9
--- /dev/null
+++ b/drivers/clk/clk-tango4.c
@@ -0,0 +1,61 @@
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+static struct clk *out[2];
+static struct clk_onecell_data clk_data = { out, 2 };
+
+#define SYSCLK_CTRL	0x20
+#define CPUCLK_CTRL	0x24
+#define LEGACY_DIV	0x3c
+
+#define PLL_N(val)	(((val) >>  0) & 0x7f)
+#define PLL_K(val)	(((val) >> 13) & 0x7)
+#define PLL_M(val)	(((val) >> 16) & 0x7)
+#define DIV_INDEX(val)	(((val) >>  8) & 0xf)
+
+static void __init make_pll(int idx, const char *parent, void __iomem *base)
+{
+	char name[8];
+	u32 val, mul, div;
+
+	sprintf(name, "pll%d", idx);
+	val = readl_relaxed(base + idx*8);
+	mul =  PLL_N(val) + 1;
+	div = (PLL_M(val) + 1) << PLL_K(val);
+	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
+}
+
+static int __init get_div(void __iomem *base)
+{
+	u8 sysclk_tab[16] = { 2, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4 };
+	int idx = DIV_INDEX(readl_relaxed(base + LEGACY_DIV));
+
+	return sysclk_tab[idx];
+}
+
+static void __init tango4_clkgen_setup(struct device_node *np)
+{
+	int div, ret;
+	void __iomem *base = of_iomap(np, 0);
+	const char *parent = of_clk_get_parent_name(np, 0);
+
+	if (!base)
+		panic("%s: invalid address\n", np->full_name);
+
+	make_pll(0, parent, base);
+	make_pll(1, parent, base);
+
+	out[0] = clk_register_divider(NULL, "cpuclk", "pll0", 0,
+			base + CPUCLK_CTRL, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
+
+	div = readl_relaxed(base + SYSCLK_CTRL) & BIT(23) ? get_div(base) : 4;
+	out[1] = clk_register_fixed_factor(NULL, "sysclk", "pll1", 0, 1, div);
+
+	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
+		panic("%s: clk registration failed\n", np->full_name);
+}
+
+CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
-- 
2.4.5
