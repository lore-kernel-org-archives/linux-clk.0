Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 3/3] clk: sunxi-ng: a33: Add offset and minimum value for DDR1 PLL N factor
Date: Wed,  5 Apr 2017 14:37:44 +0800
Message-Id: <20170405063744.14389-4-wens@csie.org>
In-Reply-To: <20170405063744.14389-1-wens@csie.org>
References: <20170405063744.14389-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The DDR1 PLL on the A33 is an oddball amongst the A33 CCU clocks.
It is a clock multiplier, with the effective multiplier in the
range of 12 ~ 255 and no offset between the multiplier value and
the value programmed into the register.

Implement the zero offset and minimum value of 12 for this clock.

Fixes: d05c748bd730 ("clk: sunxi-ng: Add A33 CCU support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index a7b3c08ed0e2..56370c2c7f98 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -159,13 +159,17 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_de_clk, "pll-de",
 					BIT(28),	/* lock */
 					CLK_SET_RATE_UNGATE);
 
-/* TODO: Fix N */
-static SUNXI_CCU_N_WITH_GATE_LOCK(pll_ddr1_clk, "pll-ddr1",
-				  "osc24M", 0x04c,
-				  8, 6,			/* N */
-				  BIT(31),		/* gate */
-				  BIT(28),		/* lock */
-				  CLK_SET_RATE_UNGATE);
+static struct ccu_mult pll_ddr1_clk = {
+	.enable	= BIT(31),
+	.lock	= BIT(28),
+	.mult	= _SUNXI_CCU_MULT_OFFSET_MIN_MAX(8, 6, 0, 12, 0),
+	.common	= {
+		.reg		= 0x04c,
+		.hw.init	= CLK_HW_INIT("pll-ddr1", "osc24M",
+					      &ccu_mult_ops,
+					      CLK_SET_RATE_UNGATE),
+	},
+};
 
 static const char * const cpux_parents[] = { "osc32k", "osc24M",
 					     "pll-cpux" , "pll-cpux" };
-- 
2.11.0
