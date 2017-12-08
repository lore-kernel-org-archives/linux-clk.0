Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 2/3] clk: sunxi-ng: sun8i: a83t: Add /2 fixed post divider to audio PLL
Date: Fri,  8 Dec 2017 16:35:11 +0800
Message-Id: <20171208083512.24080-3-wens@csie.org>
In-Reply-To: <20171208083512.24080-1-wens@csie.org>
References: <20171208083512.24080-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On the A83T, the audio PLL should have its div1 set to 0, or /1, and
div2 set to 1, or /2. This setting is the default, and is required
to match the sigma-delta modulation parameters from the BSP kernel.

This patch adds a /2 fixed post divider to the audio PLL, and fixes
the enforced d1 & d2 values. This also resolves the mismatch between
the values mentioned in the comment for the audio PLL, and the actual
enforced values.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 5cedcd0d8be8..06b69e433d0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -81,10 +81,12 @@ static struct ccu_nm pll_audio_clk = {
 	.lock		= BIT(2),
 	.n		= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 8, 0, 12, 0),
 	.m		= _SUNXI_CCU_DIV(0, 6),
+	.fixed_post_div	= 2,
 	.common		= {
 		.reg		= SUN8I_A83T_PLL_AUDIO_REG,
 		.lock_reg	= CCU_SUN8I_A83T_LOCK_REG,
-		.features	= CCU_FEATURE_LOCK_REG,
+		.features	= CCU_FEATURE_LOCK_REG |
+				  CCU_FEATURE_FIXED_POSTDIV,
 		.hw.init	= CLK_HW_INIT("pll-audio", "osc24M",
 					      &ccu_nm_ops, CLK_SET_RATE_UNGATE),
 	},
@@ -889,9 +891,10 @@ static int sun8i_a83t_ccu_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	/* Enforce d1 = 0, d2 = 0 for Audio PLL */
+	/* Enforce d1 = 0, d2 = 1 for Audio PLL */
 	val = readl(reg + SUN8I_A83T_PLL_AUDIO_REG);
-	val &= ~(BIT(16) | BIT(18));
+	val &= ~BIT(16);
+	val |= BIT(18);
 	writel(val, reg + SUN8I_A83T_PLL_AUDIO_REG);
 
 	/* Enforce P = 1 for both CPU cluster PLLs */
-- 
2.15.0
