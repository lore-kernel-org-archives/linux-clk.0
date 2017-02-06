Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.133]:43774 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752886AbdBFCtz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2017 21:49:55 -0500
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de, mturquette@baylibre.com, sboyd@codeaurora.org,
        xf@rock-chips.com, wdc@rock-chips.com
Cc: linux-clk@vger.kernel.org, huangtao@rock-chips.com,
        xxx@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 2/2] clk: rockchip: describe clk_gmac using the new muxgrf type on rk3328
Date: Mon,  6 Feb 2017 10:50:35 +0800
Message-Id: <1486349435-8681-3-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1486349435-8681-1-git-send-email-zhangqing@rock-chips.com>
References: <1486349435-8681-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

With the newly introduced clk type for muxes in the grf we now can
describe some missing clocks, like the clk_gmac2io and clk_gmac2phy
that selects between clk_mac2io_src and gmac_clkin based on a bit
set in the general register files.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3328.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 1e384e143504..b04f29774ee7 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -20,6 +20,7 @@
 #include <dt-bindings/clock/rk3328-cru.h>
 #include "clk.h"
 
+#define RK3328_GRF_SOC_CON4		0x410
 #define RK3328_GRF_SOC_STATUS0		0x480
 #define RK3328_GRF_MAC_CON1		0x904
 #define RK3328_GRF_MAC_CON2		0x908
@@ -214,6 +215,8 @@ enum rk3328_plls {
 				    "gmac_clkin" };
 PNAME(mux_mac2phy_src_p)	= { "clk_mac2phy_src",
 				    "phy_50m_out" };
+PNAME(mux_mac2io_ext_p)		= { "clk_mac2io",
+				    "gmac_clkin" };
 
 static struct rockchip_pll_clock rk3328_pll_clks[] __initdata = {
 	[apll] = PLL(pll_rk3328, PLL_APLL, "apll", mux_pll_p,
@@ -680,6 +683,10 @@ enum rk3328_plls {
 	COMPOSITE(SCLK_MAC2IO_OUT, "clk_mac2io_out", mux_2plls_p, 0,
 			RK3328_CLKSEL_CON(27), 15, 1, MFLAGS, 8, 5, DFLAGS,
 			RK3328_CLKGATE_CON(3), 5, GFLAGS),
+	MUXGRF(SCLK_MAC2IO, "clk_mac2io", mux_mac2io_src_p, CLK_SET_RATE_NO_REPARENT,
+			RK3328_GRF_MAC_CON1, 10, 1, MFLAGS),
+	MUXGRF(SCLK_MAC2IO_EXT, "clk_mac2io_ext", mux_mac2io_ext_p, CLK_SET_RATE_NO_REPARENT,
+			RK3328_GRF_SOC_CON4, 14, 1, MFLAGS),
 
 	COMPOSITE(SCLK_MAC2PHY_SRC, "clk_mac2phy_src", mux_2plls_p, 0,
 			RK3328_CLKSEL_CON(26), 7, 1, MFLAGS, 0, 5, DFLAGS,
@@ -691,6 +698,8 @@ enum rk3328_plls {
 	COMPOSITE_NOMUX(SCLK_MAC2PHY_OUT, "clk_mac2phy_out", "clk_mac2phy", 0,
 			RK3328_CLKSEL_CON(26), 8, 2, DFLAGS,
 			RK3328_CLKGATE_CON(9), 2, GFLAGS),
+	MUXGRF(SCLK_MAC2PHY, "clk_mac2phy", mux_mac2phy_src_p, CLK_SET_RATE_NO_REPARENT,
+			RK3328_GRF_MAC_CON2, 10, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
 
-- 
1.9.1


