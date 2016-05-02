Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	tomeu.vizoso@collabora.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 3/3] clk: rockchip: make rk3399 vop dclks keep their rate on parent rate changes
Date: Mon,  2 May 2016 18:36:22 +0200
Message-Id: <1462206982-10444-4-git-send-email-heiko@sntech.de>
In-Reply-To: <1462206982-10444-1-git-send-email-heiko@sntech.de>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The rk3399 hdmi phy is supplied by the vpll directly and needs to adapt
that frequency depending on the selected resolution on the hdmi output.
For the hdmi-phy the vpll frequency is supplied unchanged without
any dividers being present there.

The vpll also is one of the sources the general display clock of the
visual output processor (vop) and as it is somewhat special for
display operations possibly also the preferred pll source. Here a divider
is available between the pll-mux and the vop clock, so that this part
can adapt the resulting frequency if needed.

So to keep the vop clock in line with the target rate, set the newly
introduced CLK_KEEP_REQ_RATE flag for the dclk_vop clocks on rk3399.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3399.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 5248726..4462a50 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -277,11 +277,11 @@ static struct rockchip_clk_branch rk3399_uart4_pmu_fracmux __initdata =
 			RK3399_PMU_CLKSEL_CON(5), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch rk3399_dclk_vop0_fracmux __initdata =
-	MUX(DCLK_VOP0, "dclk_vop0", mux_dclk_vop0_p, CLK_SET_RATE_PARENT,
+	MUX(DCLK_VOP0, "dclk_vop0", mux_dclk_vop0_p, CLK_SET_RATE_PARENT | CLK_KEEP_REQ_RATE,
 			RK3399_CLKSEL_CON(49), 11, 1, MFLAGS);
 
 static struct rockchip_clk_branch rk3399_dclk_vop1_fracmux __initdata =
-	MUX(DCLK_VOP1, "dclk_vop1", mux_dclk_vop1_p, CLK_SET_RATE_PARENT,
+	MUX(DCLK_VOP1, "dclk_vop1", mux_dclk_vop1_p, CLK_SET_RATE_PARENT | CLK_KEEP_REQ_RATE,
 			RK3399_CLKSEL_CON(50), 11, 1, MFLAGS);
 
 static struct rockchip_clk_branch rk3399_pmuclk_wifi_fracmux __initdata =
-- 
2.8.0.rc3
