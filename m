Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 25/41] clk: clps711x: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:10 -0800
Message-Id: <1456858826-28541-26-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-clps711x.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-clps711x.c b/drivers/clk/clk-clps711x.c
index ff4ef4f1df62..1f60b02416a7 100644
--- a/drivers/clk/clk-clps711x.c
+++ b/drivers/clk/clk-clps711x.c
@@ -107,16 +107,15 @@ static struct clps711x_clk * __init _clps711x_clk_init(void __iomem *base,
 	writel(tmp, base + CLPS711X_SYSCON1);
 
 	clps711x_clk->clks[CLPS711X_CLK_DUMMY] =
-		clk_register_fixed_rate(NULL, "dummy", NULL, CLK_IS_ROOT, 0);
+		clk_register_fixed_rate(NULL, "dummy", NULL, 0, 0);
 	clps711x_clk->clks[CLPS711X_CLK_CPU] =
-		clk_register_fixed_rate(NULL, "cpu", NULL, CLK_IS_ROOT, f_cpu);
+		clk_register_fixed_rate(NULL, "cpu", NULL, 0, f_cpu);
 	clps711x_clk->clks[CLPS711X_CLK_BUS] =
-		clk_register_fixed_rate(NULL, "bus", NULL, CLK_IS_ROOT, f_bus);
+		clk_register_fixed_rate(NULL, "bus", NULL, 0, f_bus);
 	clps711x_clk->clks[CLPS711X_CLK_PLL] =
-		clk_register_fixed_rate(NULL, "pll", NULL, CLK_IS_ROOT, f_pll);
+		clk_register_fixed_rate(NULL, "pll", NULL, 0, f_pll);
 	clps711x_clk->clks[CLPS711X_CLK_TIMERREF] =
-		clk_register_fixed_rate(NULL, "timer_ref", NULL, CLK_IS_ROOT,
-					f_tim);
+		clk_register_fixed_rate(NULL, "timer_ref", NULL, 0, f_tim);
 	clps711x_clk->clks[CLPS711X_CLK_TIMER1] =
 		clk_register_divider_table(NULL, "timer1", "timer_ref", 0,
 					   base + CLPS711X_SYSCON1, 5, 1, 0,
@@ -126,10 +125,9 @@ static struct clps711x_clk * __init _clps711x_clk_init(void __iomem *base,
 					   base + CLPS711X_SYSCON1, 7, 1, 0,
 					   timer_div_table, &clps711x_clk->lock);
 	clps711x_clk->clks[CLPS711X_CLK_PWM] =
-		clk_register_fixed_rate(NULL, "pwm", NULL, CLK_IS_ROOT, f_pwm);
+		clk_register_fixed_rate(NULL, "pwm", NULL, 0, f_pwm);
 	clps711x_clk->clks[CLPS711X_CLK_SPIREF] =
-		clk_register_fixed_rate(NULL, "spi_ref", NULL, CLK_IS_ROOT,
-					f_spi);
+		clk_register_fixed_rate(NULL, "spi_ref", NULL, 0, f_spi);
 	clps711x_clk->clks[CLPS711X_CLK_SPI] =
 		clk_register_divider_table(NULL, "spi", "spi_ref", 0,
 					   base + CLPS711X_SYSCON1, 16, 2, 0,
@@ -137,8 +135,7 @@ static struct clps711x_clk * __init _clps711x_clk_init(void __iomem *base,
 	clps711x_clk->clks[CLPS711X_CLK_UART] =
 		clk_register_fixed_factor(NULL, "uart", "bus", 0, 1, 10);
 	clps711x_clk->clks[CLPS711X_CLK_TICK] =
-		clk_register_fixed_rate(NULL, "tick", NULL, CLK_IS_ROOT, 64);
-
+		clk_register_fixed_rate(NULL, "tick", NULL, 0, 64);
 	for (i = 0; i < CLPS711X_CLK_MAX; i++)
 		if (IS_ERR(clps711x_clk->clks[i]))
 			pr_err("clk %i: register failed with %ld\n",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
