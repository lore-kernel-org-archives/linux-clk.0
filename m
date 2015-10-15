Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: [PATCH v2] clk: tango4: clkgen driver for Tango4 ARM platforms
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>
CC: clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
References: <5613DBA2.20708@sigmadesigns.com>
 <20151008013054.GC26883@codeaurora.org>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <561FCBB2.8030703@sigmadesigns.com>
Date: Thu, 15 Oct 2015 17:52:18 +0200
MIME-Version: 1.0
In-Reply-To: <20151008013054.GC26883@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Provide support for Sigma Designs Tango4 (ARM-based) clock generator.
NOTE: This driver is INCOMPATIBLE with Tango3 clkgen.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Changes in v2:
Provide missing includes
Use masks instead of bit-fields :-(
Error handling
Style nits
Model the clkgen block as a single node
---
 drivers/clk/Makefile     |  1 +
 drivers/clk/clk-tango4.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 drivers/clk/clk-tango4.c

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
index 000000000000..47343afde4cf
--- /dev/null
+++ b/drivers/clk/clk-tango4.c
@@ -0,0 +1,49 @@
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+static struct clk *out[2];
+static struct clk_onecell_data clk_data = { out, 2 };
+static void __iomem *clkgen_base;
+
+#define PLL_N(val) ((val) >>  0 & 0x7f)
+#define PLL_K(val) ((val) >> 13 & 0x07)
+#define PLL_M(val) ((val) >> 16 & 0x07)
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
+static void __init tango4_clkgen_setup(struct device_node *np)
+{
+	int ret;
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
+			clkgen_base + 0x24, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
+
+	of_property_read_string_index(np, "clock-output-names", 1, &name);
+	out[1] = clk_register_fixed_factor(NULL, name, "pll1", 0, 1, 3);
+
+	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
+		panic("%s: clk registration failed\n", np->full_name);
+}
+
+CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
-- 
2.4.5
