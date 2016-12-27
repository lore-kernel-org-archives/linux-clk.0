Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288
Date: Tue, 27 Dec 2016 14:43:03 +0100
Message-Id: <20161227134303.23492-2-heiko@sntech.de>
In-Reply-To: <20161227134303.23492-1-heiko@sntech.de>
References: <20161227134303.23492-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

With the newly introduced clk type for muxes in the grf we now can
describe some missing clocks, like the aclk_vcodec that selects between
aclk_vdpu and aclk_vepu based on a bit set in the general register files.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3288.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 39af05a..fbd7ac9 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -198,6 +198,7 @@ PNAME(mux_hsadcout_p)	= { "hsadc_src", "ext_hsadc" };
 PNAME(mux_edp_24m_p)	= { "ext_edp_24m", "xin24m" };
 PNAME(mux_tspout_p)	= { "cpll", "gpll", "npll", "xin27m" };
 
+PNAME(mux_aclk_vcodec_pre_p)	= { "aclk_vepu", "aclk_vdpu" };
 PNAME(mux_usbphy480m_p)		= { "sclk_otgphy1_480m", "sclk_otgphy2_480m",
 				    "sclk_otgphy0_480m" };
 PNAME(mux_hsicphy480m_p)	= { "cpll", "gpll", "usbphy480m_src" };
@@ -398,14 +399,12 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE(0, "aclk_vdpu", mux_pll_src_cpll_gpll_usb480m_p, 0,
 			RK3288_CLKSEL_CON(32), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK3288_CLKGATE_CON(3), 11, GFLAGS),
-	/*
-	 * We use aclk_vdpu by default GRF_SOC_CON0[7] setting in system,
-	 * so we ignore the mux and make clocks nodes as following,
-	 */
-	GATE(ACLK_VCODEC, "aclk_vcodec", "aclk_vdpu", 0,
+	MUXGRF(0, "aclk_vcodec_pre", mux_aclk_vcodec_pre_p, 0,
+			RK3288_GRF_SOC_CON(0), 7, 1, MFLAGS),
+	GATE(ACLK_VCODEC, "aclk_vcodec", "aclk_vcodec_pre", 0,
 		RK3288_CLKGATE_CON(9), 0, GFLAGS),
 
-	FACTOR_GATE(0, "hclk_vcodec_pre", "aclk_vdpu", 0, 1, 4,
+	FACTOR_GATE(0, "hclk_vcodec_pre", "aclk_vcodec_pre", 0, 1, 4,
 		RK3288_CLKGATE_CON(3), 10, GFLAGS),
 
 	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_vcodec_pre", 0,
-- 
2.10.2
