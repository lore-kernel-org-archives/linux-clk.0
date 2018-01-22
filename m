Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-rockchip@lists.infradead.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	yang.zheng@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 5/7] clk: rockchip: remove ignore_unused flag from rk3328 vio_h2p clocks
Date: Mon, 22 Jan 2018 15:15:28 +0100
Message-Id: <20180122141530.12398-6-heiko@sntech.de>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

These are already marked as critical, so there is no need for an
additional ignore_unused flag.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index c5b381ab23b1..983ad5760ce0 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -724,8 +724,8 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(HCLK_CIF, "hclk_cif", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 9, GFLAGS),
 	GATE(HCLK_RGA, "hclk_rga", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 11, GFLAGS),
 	GATE(0, "hclk_ahb1tom", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 12, GFLAGS),
-	GATE(0, "pclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 13, GFLAGS),
-	GATE(0, "hclk_vio_h2p", "hclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 14, GFLAGS),
+	GATE(0, "pclk_vio_h2p", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 13, GFLAGS),
+	GATE(0, "hclk_vio_h2p", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 14, GFLAGS),
 	GATE(HCLK_HDCP, "hclk_hdcp", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 0, GFLAGS),
 	GATE(0, "hclk_vio_niu", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 1, GFLAGS),
 	GATE(PCLK_HDMI, "pclk_hdmi", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 4, GFLAGS),
-- 
2.14.2
