Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45884 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753381AbbFRORj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 18 Jun 2015 10:17:39 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@linaro.org, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, stable@vger.kernel.org
Subject: [PATCH v2 1/9] clk: rockchip: rk3288: add CLK_SET_RATE_PARENT to sclk_mac
Date: Thu, 18 Jun 2015 16:18:28 +0200
Message-Id: <1434637116-17124-2-git-send-email-heiko@sntech.de>
In-Reply-To: <1434637116-17124-1-git-send-email-heiko@sntech.de>
References: <1434637116-17124-1-git-send-email-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The dwmac ethernet controller on the rk3288 supports phys connected
via rgmii and rmii. With rgmii phys it is expected that the mac clock
is provided externally while with rmii phys the clock can be external
but also generated from the plls. In the later case it of course needs
be at 50MHz, which gets set from the dwmac_rk driver.
As most devices use a rgmii phy it never surfaced so far that the mac
clk mux, doesn't go up one lever to the pll clock in the rmii case with
internal clock generation, as it is missing the CLK_SET_RATE_PARENT flag,
and thus will not set the correct frequency in most cases.

Fixes: b9e4ba541607 ("clk: rockchip: add clock controller for rk3288")
Cc: stable@vger.kernel.org
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 4f817ed..0211162 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -578,7 +578,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE(0, "mac_pll_src", mux_pll_src_npll_cpll_gpll_p, 0,
 			RK3288_CLKSEL_CON(21), 0, 2, MFLAGS, 8, 5, DFLAGS,
 			RK3288_CLKGATE_CON(2), 5, GFLAGS),
-	MUX(SCLK_MAC, "mac_clk", mux_mac_p, 0,
+	MUX(SCLK_MAC, "mac_clk", mux_mac_p, CLK_SET_RATE_PARENT,
 			RK3288_CLKSEL_CON(21), 4, 1, MFLAGS),
 	GATE(SCLK_MACREF_OUT, "sclk_macref_out", "mac_clk", 0,
 			RK3288_CLKGATE_CON(5), 3, GFLAGS),
-- 
2.1.4

