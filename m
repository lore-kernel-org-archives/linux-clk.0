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
Subject: [PATCH 3/7] clk: rockchip: export sclk_hdmi_sfc on rk3328
Date: Mon, 22 Jan 2018 15:15:26 +0100
Message-Id: <20180122141530.12398-4-heiko@sntech.de>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

This clock is one of the dw-hdmi supplying clocks and thus
needs to be exported.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 17816aec206a..b7a28f2814e2 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -588,7 +588,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	COMPOSITE(ACLK_VOP_PRE, "aclk_vop_pre", mux_4plls_p, 0,
 			RK3328_CLKSEL_CON(39), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3328_CLKGATE_CON(5), 5, GFLAGS),
-	GATE(0, "clk_hdmi_sfc", "xin24m", 0,
+	GATE(SCLK_HDMI_SFC, "sclk_hdmi_sfc", "xin24m", 0,
 			RK3328_CLKGATE_CON(5), 4, GFLAGS),
 
 	COMPOSITE_NODIV(0, "clk_cif_src", mux_2plls_p, 0,
-- 
2.14.2
