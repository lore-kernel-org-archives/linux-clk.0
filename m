Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/2] clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
Date: Wed,  1 Mar 2017 22:00:41 +0100
Message-Id: <20170301210042.11352-2-heiko@sntech.de>
In-Reply-To: <20170301210042.11352-1-heiko@sntech.de>
References: <20170301210042.11352-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The mux_pll_src_apll_dpll_gpll_usb480m_p parent list was missing a ","
between the 3rd and 4th parent names, making them fall together and thus
lookups fail. Fix that.

Fixes: 5190c08b2989 ("clk: rockchip: add clock controller for rk3036")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 924f560dcf80..dcde70f4c105 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -127,7 +127,7 @@ PNAME(mux_ddrphy_p)		= { "dpll_ddr", "gpll_ddr" };
 PNAME(mux_pll_src_3plls_p)	= { "apll", "dpll", "gpll" };
 PNAME(mux_timer_p)		= { "xin24m", "pclk_peri_src" };
 
-PNAME(mux_pll_src_apll_dpll_gpll_usb480m_p)	= { "apll", "dpll", "gpll" "usb480m" };
+PNAME(mux_pll_src_apll_dpll_gpll_usb480m_p)	= { "apll", "dpll", "gpll", "usb480m" };
 
 PNAME(mux_mmc_src_p)	= { "apll", "dpll", "gpll", "xin24m" };
 PNAME(mux_i2s_pre_p)	= { "i2s_src", "i2s_frac", "ext_i2s", "xin12m" };
-- 
2.11.0
