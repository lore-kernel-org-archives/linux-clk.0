Return-Path: <slash.tmp@free.fr>
Subject: [PATCH v3] clk: tango4: improve clkgen driver
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>
References: <56BE0F25.2040909@free.fr> <20160225220803.GK4847@codeaurora.org>
 <56D066B1.7000808@free.fr>
From: Mason <slash.tmp@free.fr>
Message-ID: <57023205.6050903@free.fr>
Date: Mon, 4 Apr 2016 11:21:09 +0200
MIME-Version: 1.0
In-Reply-To: <56D066B1.7000808@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Add support for USB and SDIO clocks.
Report unsupported setups and panic.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 drivers/clk/clk-tango4.c | 73 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
index 004ab7dfcfe3..eef75e305a59 100644
--- a/drivers/clk/clk-tango4.c
+++ b/drivers/clk/clk-tango4.c
@@ -4,17 +4,19 @@
 #include <linux/init.h>
 #include <linux/io.h>
 
-static struct clk *out[2];
-static struct clk_onecell_data clk_data = { out, 2 };
+#define CLK_COUNT 4 /* cpu_clk, sys_clk, usb_clk, sdio_clk */
+static struct clk *clks[CLK_COUNT];
+static struct clk_onecell_data clk_data = { clks, CLK_COUNT };
 
-#define SYSCLK_CTRL	0x20
-#define CPUCLK_CTRL	0x24
-#define LEGACY_DIV	0x3c
+#define SYSCLK_DIV	0x20
+#define CPUCLK_DIV	0x24
+#define DIV_BYPASS	BIT(23)
 
-#define PLL_N(val)	(((val) >>  0) & 0x7f)
-#define PLL_K(val)	(((val) >> 13) & 0x7)
-#define PLL_M(val)	(((val) >> 16) & 0x7)
-#define DIV_INDEX(val)	(((val) >>  8) & 0xf)
+/*** CLKGEN_PLL ***/
+#define extract_pll_n(val)	((val >>  0) & ((1u << 7) - 1))
+#define extract_pll_k(val)	((val >> 13) & ((1u << 3) - 1))
+#define extract_pll_m(val)	((val >> 16) & ((1u << 3) - 1))
+#define extract_pll_isel(val)	((val >> 24) & ((1u << 3) - 1))
 
 static void __init make_pll(int idx, const char *parent, void __iomem *base)
 {
@@ -22,40 +24,61 @@ static void __init make_pll(int idx, const char *parent, void __iomem *base)
 	u32 val, mul, div;
 
 	sprintf(name, "pll%d", idx);
-	val = readl_relaxed(base + idx*8);
-	mul =  PLL_N(val) + 1;
-	div = (PLL_M(val) + 1) << PLL_K(val);
+	val = readl(base + idx * 8);
+	mul =  extract_pll_n(val) + 1;
+	div = (extract_pll_m(val) + 1) << extract_pll_k(val);
 	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
+	if (extract_pll_isel(val) != 1)
+		panic("%s: input not set to XTAL_IN\n", name);
 }
 
-static int __init get_div(void __iomem *base)
+static void __init make_cd(int idx, void __iomem *base)
 {
-	u8 sysclk_tab[16] = { 2, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4 };
-	int idx = DIV_INDEX(readl_relaxed(base + LEGACY_DIV));
+	char name[8];
+	u32 val, mul, div;
 
-	return sysclk_tab[idx];
+	sprintf(name, "cd%d", idx);
+	val = readl(base + idx * 8);
+	mul =  1 << 27;
+	div = (2 << 27) + val;
+	clk_register_fixed_factor(NULL, name, "pll2", 0, mul, div);
+	if (val > 0xf0000000)
+		panic("%s: unsupported divider %x\n", name, val);
 }
 
 static void __init tango4_clkgen_setup(struct device_node *np)
 {
-	int div, ret;
+	struct clk **pp = clk_data.clks;
 	void __iomem *base = of_iomap(np, 0);
 	const char *parent = of_clk_get_parent_name(np, 0);
 
 	if (!base)
-		panic("%s: invalid address\n", np->full_name);
+		panic("%s: invalid address\n", np->name);
+
+	if (readl(base + CPUCLK_DIV) & DIV_BYPASS)
+		panic("%s: unsupported cpuclk setup\n", np->name);
+
+	if (readl(base + SYSCLK_DIV) & DIV_BYPASS)
+		panic("%s: unsupported sysclk setup\n", np->name);
+
+	writel(0x100, base + CPUCLK_DIV); /* disable frequency ramping */
 
 	make_pll(0, parent, base);
 	make_pll(1, parent, base);
+	make_pll(2, parent, base);
+	make_cd(2, base + 0x80);
+	make_cd(6, base + 0x80);
 
-	out[0] = clk_register_divider(NULL, "cpuclk", "pll0", 0,
-			base + CPUCLK_CTRL, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
+	pp[0] = clk_register_divider(NULL, "cpu_clk", "pll0", 0,
+			base + CPUCLK_DIV, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
+	pp[1] = clk_register_fixed_factor(NULL, "sys_clk", "pll1", 0, 1, 4);
+	pp[2] = clk_register_fixed_factor(NULL,  "usb_clk", "cd2", 0, 1, 2);
+	pp[3] = clk_register_fixed_factor(NULL, "sdio_clk", "cd6", 0, 1, 2);
 
-	div = readl_relaxed(base + SYSCLK_CTRL) & BIT(23) ? get_div(base) : 4;
-	out[1] = clk_register_fixed_factor(NULL, "sysclk", "pll1", 0, 1, div);
+	if (IS_ERR(pp[0]) || IS_ERR(pp[1]) || IS_ERR(pp[2]) || IS_ERR(pp[3]))
+		panic("%s: clk registration failed\n", np->name);
 
-	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
-	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
-		panic("%s: clk registration failed\n", np->full_name);
+	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data))
+		panic("%s: clk provider registration failed\n", np->name);
 }
 CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
-- 
2.8.0
