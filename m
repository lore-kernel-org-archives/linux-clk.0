Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Sylvain Lemieux <slemieux.tyco@gmail.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>
Subject: [PATCH 4/5] clk: lpc32xx: use divider_ro_round_rate helper
Date: Fri,  5 Jan 2018 18:09:58 +0100
Message-Id: <20180105170959.17266-5-jbrunet@baylibre.com>
In-Reply-To: <20180105170959.17266-1-jbrunet@baylibre.com>
References: <20180105170959.17266-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

There is now an helper function to round the rate when the
divider is read-only. Let's use it

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 729333766f97..c20285e74b8e 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -963,26 +963,17 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
 	struct lpc32xx_clk_div *divider = to_lpc32xx_div(hw);
-	struct clk_hw *hw_parent = clk_hw_get_parent(hw);
-	unsigned int bestdiv;
+	unsigned int val;
 
 	/* if read only, just return current value */
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
-		regmap_read(clk_regmap, divider->reg, &bestdiv);
-		bestdiv >>= divider->shift;
-		bestdiv &= div_mask(divider->width);
-		bestdiv = _get_div(divider->table, bestdiv, divider->flags,
-			divider->width);
-
-		/* Even a read-only clock can propagate a rate change */
-		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-			if (!hw_parent)
-				return -EINVAL;
-
-			*prate = clk_hw_round_rate(hw_parent, rate * bestdiv);
-		}
+		regmap_read(clk_regmap, divider->reg, &val);
+		val >>= divider->shift;
+		val &= div_mask(divider->width);
 
-		return DIV_ROUND_UP(*prate, bestdiv);
+		return divider_ro_round_rate(hw, rate, prate, divider->table,
+					     divider->width, divider->flags,
+					     bestdiv);
 	}
 
 	return divider_round_rate(hw, rate, prate, divider->table,
-- 
2.14.3
