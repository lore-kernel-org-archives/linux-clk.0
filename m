Return-Path: <keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 2/3] clk: Loongson1: Update clocks of Loongson1B
Date: Fri, 12 Aug 2016 18:51:47 +0800
Message-Id: <1470999108-9851-3-git-send-email-keguang.zhang@gmail.com>
In-Reply-To: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch updates some clock names of Loongson1B,
and adds AC97, DMA and NAND clock.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 drivers/clk/loongson1/clk-loongson1b.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/loongson1/clk-loongson1b.c b/drivers/clk/loongson1/clk-loongson1b.c
index 336ff95..2302ee5 100644
--- a/drivers/clk/loongson1/clk-loongson1b.c
+++ b/drivers/clk/loongson1/clk-loongson1b.c
@@ -39,19 +39,19 @@ static const struct clk_ops ls1x_pll_clk_ops = {
 	.recalc_rate = ls1x_pll_recalc_rate,
 };
 
-static const char * const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk", };
-static const char * const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk", };
-static const char * const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
+static const char *const cpu_parents[] = { "cpu_clk_div", "osc_clk", };
+static const char *const ahb_parents[] = { "ahb_clk_div", "osc_clk", };
+static const char *const dc_parents[] = { "dc_clk_div", "osc_clk", };
 
 void __init ls1x_clk_init(void)
 {
 	struct clk *clk;
 
-	clk = clk_register_fixed_rate(NULL, "osc_33m_clk", NULL, 0, OSC);
-	clk_register_clkdev(clk, "osc_33m_clk", NULL);
+	clk = clk_register_fixed_rate(NULL, "osc_clk", NULL, 0, OSC);
+	clk_register_clkdev(clk, "osc_clk", NULL);
 
 	/* clock derived from 33 MHz OSC clk */
-	clk = clk_register_pll(NULL, "pll_clk", "osc_33m_clk",
+	clk = clk_register_pll(NULL, "pll_clk", "osc_clk",
 			       &ls1x_pll_clk_ops, 0);
 	clk_register_clkdev(clk, "pll_clk", NULL);
 
@@ -106,6 +106,7 @@ void __init ls1x_clk_init(void)
 			       CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
 			       BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0, &_lock);
 	clk_register_clkdev(clk, "ahb_clk", NULL);
+	clk_register_clkdev(clk, "ls1x-dma", NULL);
 	clk_register_clkdev(clk, "stmmaceth", NULL);
 
 	/* clock derived from AHB clk */
@@ -113,9 +114,11 @@ void __init ls1x_clk_init(void)
 	clk = clk_register_fixed_factor(NULL, "apb_clk", "ahb_clk", 0, 1,
 					DIV_APB);
 	clk_register_clkdev(clk, "apb_clk", NULL);
-	clk_register_clkdev(clk, "ls1x_i2c", NULL);
-	clk_register_clkdev(clk, "ls1x_pwmtimer", NULL);
-	clk_register_clkdev(clk, "ls1x_spi", NULL);
-	clk_register_clkdev(clk, "ls1x_wdt", NULL);
+	clk_register_clkdev(clk, "ls1x-ac97", NULL);
+	clk_register_clkdev(clk, "ls1x-i2c", NULL);
+	clk_register_clkdev(clk, "ls1x-nand", NULL);
+	clk_register_clkdev(clk, "ls1x-pwmtimer", NULL);
+	clk_register_clkdev(clk, "ls1x-spi", NULL);
+	clk_register_clkdev(clk, "ls1x-wdt", NULL);
 	clk_register_clkdev(clk, "serial8250", NULL);
 }
-- 
1.9.1
