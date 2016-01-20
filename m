Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	xf@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/4] clk: rockchip: rk3368: fix hdmi_cec gate-register
Date: Wed, 20 Jan 2016 22:49:20 +0100
Message-Id: <1453326560-20475-4-git-send-email-heiko@sntech.de>
In-Reply-To: <1453326560-20475-1-git-send-email-heiko@sntech.de>
References: <1453326560-20475-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Fix a typo making the sclk_hdmi_cec access a wrong register to handle
its gate.

Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 6037beb..57acb62 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -442,7 +442,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(SCLK_HDMI_HDCP, "sclk_hdmi_hdcp", "xin24m", 0,
 			RK3368_CLKGATE_CON(4), 13, GFLAGS),
 	GATE(SCLK_HDMI_CEC, "sclk_hdmi_cec", "xin32k", 0,
-			RK3368_CLKGATE_CON(5), 12, GFLAGS),
+			RK3368_CLKGATE_CON(4), 12, GFLAGS),
 
 	COMPOSITE_NODIV(0, "vip_src", mux_pll_src_cpll_gpll_p, 0,
 			RK3368_CLKSEL_CON(21), 15, 1, MFLAGS,
-- 
2.6.4
