Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 3/3] clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL
Date: Fri,  8 Dec 2017 16:35:12 +0800
Message-Id: <20171208083512.24080-4-wens@csie.org>
In-Reply-To: <20171208083512.24080-1-wens@csie.org>
References: <20171208083512.24080-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The audio blocks require specific clock rates. Until now we were using
the closest clock rate possible with integer N-M factors. This resulted
in audio playback being slightly slower than it should be.

The vendor kernel gets around this (for newer SoCs) by using sigma-delta
modulation to generate a fractional-N factor. This patch copies the
parameters for the A83T.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 06b69e433d0f..04a9c33f53f0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -76,17 +76,26 @@ static struct ccu_mult pll_c1cpux_clk = {
  */
 #define SUN8I_A83T_PLL_AUDIO_REG	0x008
 
+/* clock rates doubled for post divider */
+static struct ccu_sdm_setting pll_audio_sdm_table[] = {
+	{ .rate = 45158400, .pattern = 0xc00121ff, .m = 29, .n = 54 },
+	{ .rate = 49152000, .pattern = 0xc000e147, .m = 30, .n = 61 },
+};
+
 static struct ccu_nm pll_audio_clk = {
 	.enable		= BIT(31),
 	.lock		= BIT(2),
 	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
 	.m		= _SUNXI_CCU_DIV(0, 6),
 	.fixed_post_div	= 2,
+	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table, BIT(24),
+					 0x284, BIT(31)),
 	.common		= {
 		.reg		= SUN8I_A83T_PLL_AUDIO_REG,
 		.lock_reg	= CCU_SUN8I_A83T_LOCK_REG,
 		.features	= CCU_FEATURE_LOCK_REG |
-				  CCU_FEATURE_FIXED_POSTDIV,
+				  CCU_FEATURE_FIXED_POSTDIV |
+				  CCU_FEATURE_SIGMA_DELTA_MOD,
 		.hw.init	= CLK_HW_INIT("pll-audio", "osc24M",
 					      &ccu_nm_ops, CLK_SET_RATE_UNGATE),
 	},
-- 
2.15.0
