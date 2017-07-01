Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/8] clk: vc5: Split clock input mux and predivider
Date: Sat,  1 Jul 2017 22:04:55 +0200
Message-Id: <20170701200459.11505-5-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Split the VC5 clock input mux and the predivider to more accurately
model the hardware and fix the previously incorrect assumption that
both the OUT_SEL_I2CB and the PLL are fed from the predivider.

It is in fact the clock input mux output which is directly feeding
the clock into the OUT_SEL_I2CB output, while the clock input mux
output first passes through the predivider before it is fed into
the PLL.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
on Salvator-XS with the display LVDS output.
---
 drivers/clk/clk-versaclock5.c | 46 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 7bdfd34e8280..453c9f721b78 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -157,6 +157,7 @@ struct vc5_driver_data {
 	struct clk		*pin_clkin;
 	unsigned char		clk_mux_ins;
 	struct clk_hw		clk_mux;
+	struct clk_hw		clk_pfd;
 	struct vc5_hw_data	clk_pll;
 	struct vc5_hw_data	clk_fod[VC5_MAX_FOD_NUM];
 	struct vc5_hw_data	clk_out[VC5_MAX_CLK_OUT_NUM];
@@ -166,6 +167,10 @@ static const char * const vc5_mux_names[] = {
 	"mux"
 };
 
+static const char * const vc5_pfd_names[] = {
+	"pfd"
+};
+
 static const char * const vc5_pll_names[] = {
 	"pll"
 };
@@ -254,11 +259,16 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 	return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);
 }
 
-static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
+static const struct clk_ops vc5_mux_ops = {
+	.set_parent	= vc5_mux_set_parent,
+	.get_parent	= vc5_mux_get_parent,
+};
+
+static unsigned long vc5_pfd_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
 	struct vc5_driver_data *vc5 =
-		container_of(hw, struct vc5_driver_data, clk_mux);
+		container_of(hw, struct vc5_driver_data, clk_pfd);
 	unsigned int prediv, div;
 
 	regmap_read(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV, &prediv);
@@ -276,7 +286,7 @@ static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
 		return parent_rate / VC5_REF_DIVIDER_REF_DIV(div);
 }
 
-static long vc5_mux_round_rate(struct clk_hw *hw, unsigned long rate,
+static long vc5_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *parent_rate)
 {
 	unsigned long idiv;
@@ -296,11 +306,11 @@ static long vc5_mux_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *parent_rate / idiv;
 }
 
-static int vc5_mux_set_rate(struct clk_hw *hw, unsigned long rate,
+static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct vc5_driver_data *vc5 =
-		container_of(hw, struct vc5_driver_data, clk_mux);
+		container_of(hw, struct vc5_driver_data, clk_pfd);
 	unsigned long idiv;
 	u8 div;
 
@@ -328,12 +338,10 @@ static int vc5_mux_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static const struct clk_ops vc5_mux_ops = {
-	.set_parent	= vc5_mux_set_parent,
-	.get_parent	= vc5_mux_get_parent,
-	.recalc_rate	= vc5_mux_recalc_rate,
-	.round_rate	= vc5_mux_round_rate,
-	.set_rate	= vc5_mux_set_rate,
+static const struct clk_ops vc5_pfd_ops = {
+	.recalc_rate	= vc5_pfd_recalc_rate,
+	.round_rate	= vc5_pfd_round_rate,
+	.set_rate	= vc5_pfd_set_rate,
 };
 
 /*
@@ -698,12 +706,26 @@ static int vc5_probe(struct i2c_client *client,
 		goto err_clk;
 	}
 
+	/* Register PFD */
+	memset(&init, 0, sizeof(init));
+	init.name = vc5_pfd_names[0];
+	init.ops = &vc5_pfd_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = vc5_mux_names;
+	init.num_parents = 1;
+	vc5->clk_pfd.init = &init;
+	ret = devm_clk_hw_register(&client->dev, &vc5->clk_pfd);
+	if (ret) {
+		dev_err(&client->dev, "unable to register %s\n", init.name);
+		goto err_clk;
+	}
+
 	/* Register PLL */
 	memset(&init, 0, sizeof(init));
 	init.name = vc5_pll_names[0];
 	init.ops = &vc5_pll_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = vc5_mux_names;
+	init.parent_names = vc5_pfd_names;
 	init.num_parents = 1;
 	vc5->clk_pll.num = 0;
 	vc5->clk_pll.vc5 = vc5;
-- 
2.11.0
