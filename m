Return-Path: <keguang.zhang@gmail.com>
Return-Path: <keguang.zhang@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 2/3] clk: Loongson1: Update clocks of Loongson1B
Date: Mon, 19 Sep 2016 12:38:55 +0800
Message-Id: <1474259936-9657-3-git-send-email-keguang.zhang@gmail.com>
In-Reply-To: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
References: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch updates some clock names of Loongson1B,
and adds AC97, DMA and NAND clock.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

---
v1:
   Rebase the patch on clk: ls1x: Migrate to clk_hw based OF
   and registration APIs.
---
 drivers/clk/loongson1/clk-loongson1b.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/loongson1/clk-loongson1b.c b/drivers/clk/loongson1/clk-loongson1b.c
index 5b6817e..4b3d9d2 100644
--- a/drivers/clk/loongson1/clk-loongson1b.c
+++ b/drivers/clk/loongson1/clk-loongson1b.c
@@ -37,19 +37,19 @@ static const struct clk_ops ls1x_pll_clk_ops = {
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
 	struct clk_hw *hw;
 
-	hw = clk_hw_register_fixed_rate(NULL, "osc_33m_clk", NULL, 0, OSC);
-	clk_hw_register_clkdev(hw, "osc_33m_clk", NULL);
+	hw = clk_hw_register_fixed_rate(NULL, "osc_clk", NULL, 0, OSC);
+	clk_hw_register_clkdev(hw, "osc_clk", NULL);
 
 	/* clock derived from 33 MHz OSC clk */
-	hw = clk_hw_register_pll(NULL, "pll_clk", "osc_33m_clk",
+	hw = clk_hw_register_pll(NULL, "pll_clk", "osc_clk",
 				 &ls1x_pll_clk_ops, 0);
 	clk_hw_register_clkdev(hw, "pll_clk", NULL);
 
@@ -104,6 +104,7 @@ void __init ls1x_clk_init(void)
 			       CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
 			       BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0, &_lock);
 	clk_hw_register_clkdev(hw, "ahb_clk", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-dma", NULL);
 	clk_hw_register_clkdev(hw, "stmmaceth", NULL);
 
 	/* clock derived from AHB clk */
@@ -111,9 +112,11 @@ void __init ls1x_clk_init(void)
 	hw = clk_hw_register_fixed_factor(NULL, "apb_clk", "ahb_clk", 0, 1,
 					DIV_APB);
 	clk_hw_register_clkdev(hw, "apb_clk", NULL);
-	clk_hw_register_clkdev(hw, "ls1x_i2c", NULL);
-	clk_hw_register_clkdev(hw, "ls1x_pwmtimer", NULL);
-	clk_hw_register_clkdev(hw, "ls1x_spi", NULL);
-	clk_hw_register_clkdev(hw, "ls1x_wdt", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-ac97", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-i2c", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-nand", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-pwmtimer", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-spi", NULL);
+	clk_hw_register_clkdev(hw, "ls1x-wdt", NULL);
 	clk_hw_register_clkdev(hw, "serial8250", NULL);
 }
-- 
1.9.1
