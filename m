Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andy Yan <andy.yan@rock-chips.com>
To: heiko@sntech.de
Cc: robh+dt@kernel.org, shawn.lin@rock-chips.com,
        zhangqing@rock-chips.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        sboyd@codeaurora.org, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 05/23] clk: rockchip: fix up the pll clks error for rv1108 SoC
Date: Wed,  2 Aug 2017 16:33:04 +0800
Message-Id: <1501662784-11973-1-git-send-email-andy.yan@rock-chips.com>
In-Reply-To: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
References: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Elaine Zhang <zhangqing@rock-chips.com>

fix up the lock_shift describe error.
remove the ROCKCHIP_PLL_SYNC_RATE flag for gpll.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v2: None

 drivers/clk/rockchip/clk-rv1108.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rv1108.c b/drivers/clk/rockchip/clk-rv1108.c
index 3c670db..9c6bad0 100644
--- a/drivers/clk/rockchip/clk-rv1108.c
+++ b/drivers/clk/rockchip/clk-rv1108.c
@@ -148,11 +148,11 @@ PNAME(mux_i2s2_p)		= { "i2s2_src", "i2s2_frac", "xin12m" };
 
 static struct rockchip_pll_clock rv1108_pll_clks[] __initdata = {
 	[apll] = PLL(pll_rk3399, PLL_APLL, "apll", mux_pll_p, 0, RV1108_PLL_CON(0),
-		     RV1108_PLL_CON(3), 8, 31, 0, rv1108_pll_rates),
+		     RV1108_PLL_CON(3), 8, 0, 0, rv1108_pll_rates),
 	[dpll] = PLL(pll_rk3399, PLL_DPLL, "dpll", mux_pll_p, 0, RV1108_PLL_CON(8),
-		     RV1108_PLL_CON(11), 8, 31, 0, NULL),
+		     RV1108_PLL_CON(11), 8, 1, 0, NULL),
 	[gpll] = PLL(pll_rk3399, PLL_GPLL, "gpll", mux_pll_p, 0, RV1108_PLL_CON(16),
-		     RV1108_PLL_CON(19), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rv1108_pll_rates),
+		     RV1108_PLL_CON(19), 8, 2, 0, rv1108_pll_rates),
 };
 
 #define MFLAGS CLK_MUX_HIWORD_MASK
-- 
2.7.4
