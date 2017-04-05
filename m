Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 2/3] clk: sunxi-ng: a80: Remodel CPU cluster PLLs as N-type multiplier clocks
Date: Wed,  5 Apr 2017 14:37:43 +0800
Message-Id: <20170405063744.14389-3-wens@csie.org>
In-Reply-To: <20170405063744.14389-1-wens@csie.org>
References: <20170405063744.14389-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The CPU cluster PLLs on the A80 are NP clocks that are atypical in two ways:

  - The P factor is 1 bit wide, and translates to a /1 or /4 divider.

  - The P factor should only be used for output frequencies lower than
    288 MHz. The N factor has a lower limit of 12, which likely contributed
    to this extra divider.

According to the user manual, the clocks can only go as low as 200 MHz.
The vendor BSP kernel does not even define operating points below 360
MHz for these clocks. The lower end for cpufreq in the vendor kernel is
even higher. The mainline Linux kernel doesn't support cpufreq for the
A80 at the moment. This means the lower frequencies are untested, and
will likely remain unused.

The new sunxi-ng style clocks don't support the quirks listed above.
Instead of trying to work the quirks in for something of little usage,
we re-model the clocks into N-type multipler clocks, with P fixed at 1.
At probe time we check if P is set to 4, and fix it up if needed. This
is highly unlikely though.

Fixes: b8eb71dcdd08 ("clk: sunxi-ng: Add A80 CCU")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 70 ++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index a031beefa5b5..8936ef87652c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -29,41 +29,41 @@
 
 #define CCU_SUN9I_LOCK_REG	0x09c
 
-static struct clk_div_table pll_cpux_p_div_table[] = {
-	{ .val = 0, .div = 1 },
-	{ .val = 1, .div = 4 },
-	{ /* Sentinel */ },
-};
-
 /*
- * The CPU PLLs are actually NP clocks, but P is /1 or /4, so here we
- * use the NM clocks with a divider table for M.
+ * The CPU PLLs are actually NP clocks, with P being /1 or /4. However
+ * P should only be used for output frequencies lower than 228 MHz.
+ * Neither mainline Linux, U-boot, nor the vendor BSPs use these.
+ *
+ * For now we can just model it as a multiplier clock, and force P to /1.
  */
-static struct ccu_nm pll_c0cpux_clk = {
+#define SUN9I_A80_PLL_C0CPUX_REG	0x000
+#define SUN9I_A80_PLL_C1CPUX_REG	0x004
+
+static struct ccu_mult pll_c0cpux_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(0),
-	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
-	.m		= _SUNXI_CCU_DIV_TABLE(16, 1, pll_cpux_p_div_table),
+	.mult		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
 	.common		= {
-		.reg		= 0x000,
+		.reg		= SUN9I_A80_PLL_C0CPUX_REG,
 		.lock_reg	= CCU_SUN9I_LOCK_REG,
 		.features	= CCU_FEATURE_LOCK_REG,
 		.hw.init	= CLK_HW_INIT("pll-c0cpux", "osc24M",
-					      &ccu_nm_ops, CLK_SET_RATE_UNGATE),
+					      &ccu_mult_ops,
+					      CLK_SET_RATE_UNGATE),
 	},
 };
 
-static struct ccu_nm pll_c1cpux_clk = {
+static struct ccu_mult pll_c1cpux_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(1),
-	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
-	.m		= _SUNXI_CCU_DIV_TABLE(16, 1, pll_cpux_p_div_table),
+	.mult		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
 	.common		= {
-		.reg		= 0x004,
+		.reg		= SUN9I_A80_PLL_C1CPUX_REG,
 		.lock_reg	= CCU_SUN9I_LOCK_REG,
 		.features	= CCU_FEATURE_LOCK_REG,
 		.hw.init	= CLK_HW_INIT("pll-c1cpux", "osc24M",
-					      &ccu_nm_ops, CLK_SET_RATE_UNGATE),
+					      &ccu_mult_ops,
+					      CLK_SET_RATE_UNGATE),
 	},
 };
 
@@ -1188,6 +1188,36 @@ static const struct sunxi_ccu_desc sun9i_a80_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun9i_a80_ccu_resets),
 };
 
+#define SUN9I_A80_PLL_P_SHIFT	16
+#define SUN9I_A80_PLL_N_SHIFT	8
+#define SUN9I_A80_PLL_N_WIDTH	8
+
+static void sun9i_a80_cpu_pll_fixup(void __iomem *reg)
+{
+	u32 val = readl(reg);
+
+	/* bail out if P divider is not used */
+	if (!(val & BIT(SUN9I_A80_PLL_P_SHIFT)))
+		return;
+
+	/*
+	 * If P is used, output should be less than 288 MHz. When we
+	 * set P to 1, we should also decrease the multiplier so the
+	 * output doesn't go out of range, but not too much such that
+	 * the multiplier stays above 12, the minimal operation value.
+	 *
+	 * To keep it simple, set the multiplier to 17, the reset value.
+	 */
+	val &= ~GENMASK(SUN9I_A80_PLL_N_SHIFT + SUN9I_A80_PLL_N_WIDTH - 1,
+			SUN9I_A80_PLL_N_SHIFT);
+	val |= 17 << SUN9I_A80_PLL_N_SHIFT;
+
+	/* And clear P */
+	val &= ~BIT(SUN9I_A80_PLL_P_SHIFT);
+
+	writel(val, reg);
+}
+
 static int sun9i_a80_ccu_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1204,6 +1234,10 @@ static int sun9i_a80_ccu_probe(struct platform_device *pdev)
 	val &= (BIT(16) & BIT(18));
 	writel(val, reg + SUN9I_A80_PLL_AUDIO_REG);
 
+	/* Enforce P = 1 for both CPU cluster PLLs */
+	sun9i_a80_cpu_pll_fixup(reg + SUN9I_A80_PLL_C0CPUX_REG);
+	sun9i_a80_cpu_pll_fixup(reg + SUN9I_A80_PLL_C1CPUX_REG);
+
 	return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun9i_a80_ccu_desc);
 }
 
-- 
2.11.0
