Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] clk: rockchip: use clock ids for memory controller parts on rk3066/rk3188
Date: Fri, 13 Jan 2017 17:47:52 +0100
Message-Id: <20170113164752.25368-2-heiko@sntech.de>
In-Reply-To: <20170113164752.25368-1-heiko@sntech.de>
References: <20170113164752.25368-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Add the newly added clock ids to the clock entries of the rk3066/rk3188
clock driver. We won't be needing them in the kernel for a bit yet
but as they're used in the new u-boot ddr setup code/dts we should make
sure the clock ids stay identical and do not differ.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3188.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 062ef4960244..00ad0e5f8d66 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -507,8 +507,8 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(PCLK_GPIO2, "pclk_gpio2", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 11, GFLAGS),
 	GATE(PCLK_EFUSE, "pclk_efuse", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 2, GFLAGS),
 	GATE(PCLK_TZPC, "pclk_tzpc", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 3, GFLAGS),
-	GATE(0, "pclk_ddrupctl", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 7, GFLAGS),
-	GATE(0, "pclk_ddrpubl", "pclk_cpu", 0, RK2928_CLKGATE_CON(9), 6, GFLAGS),
+	GATE(PCLK_DDRUPCTL, "pclk_ddrupctl", "pclk_cpu", 0, RK2928_CLKGATE_CON(5), 7, GFLAGS),
+	GATE(PCLK_PUBL, "pclk_ddrpubl", "pclk_cpu", 0, RK2928_CLKGATE_CON(9), 6, GFLAGS),
 	GATE(0, "pclk_dbg", "pclk_cpu", 0, RK2928_CLKGATE_CON(9), 1, GFLAGS),
 	GATE(PCLK_GRF, "pclk_grf", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 4, GFLAGS),
 	GATE(PCLK_PMU, "pclk_pmu", "pclk_cpu", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 5, GFLAGS),
-- 
2.11.0
