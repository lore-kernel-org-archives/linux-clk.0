Return-Path: <caesar.upstream@gmail.com>
Return-Path: <caesar.upstream@gmail.com>
From: Caesar Wang <wxt@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	heiko@sntech.de
Cc: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	wxt@rock-chips.com,
	Jianqun xu <jay.xu@rock-chips.com>
Subject: [PATCH] clk: rockchip: fix some clock gates for rk3368
Date: Thu,  7 Jan 2016 17:18:07 +0800
Message-Id: <1452158287-18742-1-git-send-email-wxt@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

From: Jianqun xu <jay.xu@rock-chips.com>

Reference to the Rockchip RK3368 TRM v1.1, some clock
gates need to be updated.

Signed-off-by: Jianqun xu <jay.xu@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3368.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index be0ede5..21f3ea9 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -780,13 +780,13 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(PCLK_TSADC, "pclk_tsadc", "pclk_peri", 0, RK3368_CLKGATE_CON(20), 0, GFLAGS),
 
 	/* pclk_pd_alive gates */
-	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(14), 8, GFLAGS),
-	GATE(PCLK_TIMER0, "pclk_timer0", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(14), 7, GFLAGS),
-	GATE(0, "pclk_alive_niu", "pclk_pd_alive", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(14), 12, GFLAGS),
-	GATE(PCLK_GRF, "pclk_grf", "pclk_pd_alive", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(14), 11, GFLAGS),
-	GATE(PCLK_GPIO3, "pclk_gpio3", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(14), 3, GFLAGS),
-	GATE(PCLK_GPIO2, "pclk_gpio2", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(14), 2, GFLAGS),
-	GATE(PCLK_GPIO1, "pclk_gpio1", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(14), 1, GFLAGS),
+	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(22), 13, GFLAGS),
+	GATE(PCLK_TIMER0, "pclk_timer0", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(22), 12, GFLAGS),
+	GATE(0, "pclk_alive_niu", "pclk_pd_alive", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(22), 9, GFLAGS),
+	GATE(PCLK_GRF, "pclk_grf", "pclk_pd_alive", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(22), 8, GFLAGS),
+	GATE(PCLK_GPIO3, "pclk_gpio3", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(22), 3, GFLAGS),
+	GATE(PCLK_GPIO2, "pclk_gpio2", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(22), 2, GFLAGS),
+	GATE(PCLK_GPIO1, "pclk_gpio1", "pclk_pd_alive", 0, RK3368_CLKGATE_CON(22), 1, GFLAGS),
 
 	/*
 	 * pclk_vio gates
@@ -796,12 +796,12 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(0, "pclk_dphytx", "hclk_vio", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(14), 8, GFLAGS),
 
 	/* pclk_pd_pmu gates */
-	GATE(PCLK_PMUGRF, "pclk_pmugrf", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(17), 0, GFLAGS),
-	GATE(PCLK_GPIO0, "pclk_gpio0", "pclk_pd_pmu", 0, RK3368_CLKGATE_CON(17), 4, GFLAGS),
-	GATE(PCLK_SGRF, "pclk_sgrf", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(17), 3, GFLAGS),
-	GATE(0, "pclk_pmu_noc", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(17), 2, GFLAGS),
-	GATE(0, "pclk_intmem1", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(17), 1, GFLAGS),
-	GATE(PCLK_PMU, "pclk_pmu", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(17), 2, GFLAGS),
+	GATE(PCLK_PMUGRF, "pclk_pmugrf", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 5, GFLAGS),
+	GATE(PCLK_GPIO0, "pclk_gpio0", "pclk_pd_pmu", 0, RK3368_CLKGATE_CON(23), 4, GFLAGS),
+	GATE(PCLK_SGRF, "pclk_sgrf", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 3, GFLAGS),
+	GATE(0, "pclk_pmu_noc", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 2, GFLAGS),
+	GATE(0, "pclk_intmem1", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 1, GFLAGS),
+	GATE(PCLK_PMU, "pclk_pmu", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 0, GFLAGS),
 
 	/* timer gates */
 	GATE(0, "sclk_timer15", "xin24m", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(24), 11, GFLAGS),
-- 
1.9.1
