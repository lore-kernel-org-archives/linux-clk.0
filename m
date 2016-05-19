Return-Path: <gnaygnil@gmail.com>
Return-Path: <gnaygnil@gmail.com>
Date: Thu, 19 May 2016 11:42:59 +0800
From: Yang Ling <gnaygnil@gmail.com>
To: keguang.zhang@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, gnaygnil@gmail.com
Subject: [PATCH V1 1/4] clk: add Loongson1C clock support
Message-ID: <20160519034251.GA5111@ly-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

This adds clock support to Loongson1C SoC.

Signed-off-by: Yang Ling <gnaygnil@gmail.com>
---
 drivers/clk/clk-loongson1.c | 52 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
index ce2135c..cc9793a 100644
--- a/drivers/clk/clk-loongson1.c
+++ b/drivers/clk/clk-loongson1.c
@@ -15,8 +15,16 @@
 
 #include <loongson1.h>
 
+#if defined(CONFIG_LOONGSON1_LS1B)
 #define OSC		(33 * 1000000)
 #define DIV_APB		2
+#define OSC_CLK		"osc_33m_clk"
+#elif defined(CONFIG_LOONGSON1_LS1C)
+#define OSC		(24 * 1000000)
+#define DIV_APB		1
+#define OSC_CLK		"osc_24m_clk"
+#endif
+
 
 static DEFINE_SPINLOCK(_lock);
 
@@ -35,9 +43,15 @@ static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
 	u32 pll, rate;
 
 	pll = __raw_readl(LS1X_CLK_PLL_FREQ);
+#if defined(CONFIG_LOONGSON1_LS1B)
 	rate = 12 + (pll & 0x3f) + (((pll >> 8) & 0x3ff) >> 10);
 	rate *= OSC;
 	rate >>= 1;
+#elif defined(CONFIG_LOONGSON1_LS1C)
+	rate = ((pll >> 8) & 0xff) + ((pll >> 16) & 0xff);
+	rate *= OSC;
+	rate >>= 2;
+#endif
 
 	return rate;
 }
@@ -78,20 +92,27 @@ static struct clk *__init clk_register_pll(struct device *dev,
 	return clk;
 }
 
-static const char *const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk", };
-static const char *const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk", };
-static const char *const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
+static const char *const cpu_parents[] = { "cpu_clk_div", OSC_CLK, };
+static const char *const ahb_parents[] = { "ahb_clk_div", OSC_CLK, };
+static const char *const dc_parents[] = { "dc_clk_div", OSC_CLK, };
+
+static const struct clk_div_table ahb_div_table[] = {
+	[0] = { .val = 0, .div = 2 },
+	[1] = { .val = 1, .div = 4 },
+	[2] = { .val = 2, .div = 3 },
+	[3] = { .val = 3, .div = 3 },
+};
 
 void __init ls1x_clk_init(void)
 {
 	struct clk *clk;
 
-	clk = clk_register_fixed_rate(NULL, "osc_33m_clk", NULL, CLK_IS_ROOT,
+	clk = clk_register_fixed_rate(NULL, OSC_CLK, NULL, CLK_IS_ROOT,
 				      OSC);
-	clk_register_clkdev(clk, "osc_33m_clk", NULL);
+	clk_register_clkdev(clk, OSC_CLK, NULL);
 
-	/* clock derived from 33 MHz OSC clk */
-	clk = clk_register_pll(NULL, "pll_clk", "osc_33m_clk", 0);
+	/* clock derived from OSC clk */
+	clk = clk_register_pll(NULL, "pll_clk", OSC_CLK, 0);
 	clk_register_clkdev(clk, "pll_clk", NULL);
 
 	/* clock derived from PLL clk */
@@ -107,10 +128,14 @@ void __init ls1x_clk_init(void)
 				   CLK_DIVIDER_ONE_BASED |
 				   CLK_DIVIDER_ROUND_CLOSEST, &_lock);
 	clk_register_clkdev(clk, "cpu_clk_div", NULL);
+#if defined(CONFIG_LOONGSON1_LS1B)
 	clk = clk_register_mux(NULL, "cpu_clk", cpu_parents,
 			       ARRAY_SIZE(cpu_parents),
 			       CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
 			       BYPASS_CPU_SHIFT, BYPASS_CPU_WIDTH, 0, &_lock);
+#elif defined(CONFIG_LOONGSON1_LS1C)
+	clk = clk_register_fixed_factor(NULL, "cpu_clk", "cpu_clk_div", 0, 1, 1);
+#endif
 	clk_register_clkdev(clk, "cpu_clk", NULL);
 
 	/*                                 _____
@@ -123,10 +148,14 @@ void __init ls1x_clk_init(void)
 				   0, LS1X_CLK_PLL_DIV, DIV_DC_SHIFT,
 				   DIV_DC_WIDTH, CLK_DIVIDER_ONE_BASED, &_lock);
 	clk_register_clkdev(clk, "dc_clk_div", NULL);
+#if defined(CONFIG_LOONGSON1_LS1B)
 	clk = clk_register_mux(NULL, "dc_clk", dc_parents,
 			       ARRAY_SIZE(dc_parents),
 			       CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
 			       BYPASS_DC_SHIFT, BYPASS_DC_WIDTH, 0, &_lock);
+#elif defined(CONFIG_LOONGSON1_LS1C)
+	clk = clk_register_fixed_factor(NULL, "dc_clk", "dc_clk_div", 0, 1, 1);
+#endif
 	clk_register_clkdev(clk, "dc_clk", NULL);
 
 	/*                                 _____
@@ -135,6 +164,7 @@ void __init ls1x_clk_init(void)
 	 *        \___ PLL ___ DDR DIV ___|     |
 	 *                                |_____|
 	 */
+#if defined(CONFIG_LOONGSON1_LS1B)
 	clk = clk_register_divider(NULL, "ahb_clk_div", "pll_clk",
 				   0, LS1X_CLK_PLL_DIV, DIV_DDR_SHIFT,
 				   DIV_DDR_WIDTH, CLK_DIVIDER_ONE_BASED,
@@ -144,6 +174,14 @@ void __init ls1x_clk_init(void)
 			       ARRAY_SIZE(ahb_parents),
 			       CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
 			       BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0, &_lock);
+#elif defined(CONFIG_LOONGSON1_LS1C)
+	clk = clk_register_divider_table(NULL, "ahb_clk_div", "cpu_clk_div",
+					 0, LS1X_CLK_PLL_FREQ, DIV_DDR_SHIFT,
+					 DIV_DDR_WIDTH, CLK_DIVIDER_ALLOW_ZERO,
+					 ahb_div_table, &_lock);
+	clk_register_clkdev(clk, "ahb_clk_div", NULL);
+	clk = clk_register_fixed_factor(NULL, "ahb_clk", "ahb_clk_div", 0, 1, 1);
+#endif
 	clk_register_clkdev(clk, "ahb_clk", NULL);
 	clk_register_clkdev(clk, "ls1x-dma", NULL);
 	clk_register_clkdev(clk, "stmmaceth", NULL);
-- 
1.9.1


Rebase changes base on the following patch.
https://patchwork.linux-mips.org/patch/13035/
