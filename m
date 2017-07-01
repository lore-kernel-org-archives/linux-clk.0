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
Subject: [PATCH 6/8] clk: vc5: Add support for the input frequency doubler
Date: Sat,  1 Jul 2017 22:04:56 +0200
Message-Id: <20170701200459.11505-6-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The VersaClock 6 has an input frequency doubler between the input
clock mux and the predivider. Add new capability flag and support
for this frequency doubler block into the driver.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
on Salvator-XS with the display LVDS output.
---
 drivers/clk/clk-versaclock5.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 453c9f721b78..d0406b62133a 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -57,6 +57,7 @@
 #define VC5_PRIM_SRC_SHDN			0x10
 #define VC5_PRIM_SRC_SHDN_EN_XTAL		BIT(7)
 #define VC5_PRIM_SRC_SHDN_EN_CLKIN		BIT(6)
+#define VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ	BIT(3)
 #define VC5_PRIM_SRC_SHDN_SP			BIT(1)
 #define VC5_PRIM_SRC_SHDN_EN_GBL_SHDN		BIT(0)
 
@@ -122,6 +123,8 @@
 /* flags to describe chip features */
 /* chip has built-in oscilator */
 #define VC5_HAS_INTERNAL_XTAL	BIT(0)
+/* chip has PFD requency doubler */
+#define VC5_HAS_PFD_FREQ_DBL	BIT(1)
 
 /* Supported IDT VC5 models. */
 enum vc5_model {
@@ -157,6 +160,7 @@ struct vc5_driver_data {
 	struct clk		*pin_clkin;
 	unsigned char		clk_mux_ins;
 	struct clk_hw		clk_mux;
+	struct clk_hw		clk_mul;
 	struct clk_hw		clk_pfd;
 	struct vc5_hw_data	clk_pll;
 	struct vc5_hw_data	clk_fod[VC5_MAX_FOD_NUM];
@@ -167,6 +171,10 @@ static const char * const vc5_mux_names[] = {
 	"mux"
 };
 
+static const char * const vc5_dbl_names[] = {
+	"dbl"
+};
+
 static const char * const vc5_pfd_names[] = {
 	"pfd"
 };
@@ -264,6 +272,54 @@ static const struct clk_ops vc5_mux_ops = {
 	.get_parent	= vc5_mux_get_parent,
 };
 
+static unsigned long vc5_dbl_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct vc5_driver_data *vc5 =
+		container_of(hw, struct vc5_driver_data, clk_mul);
+	unsigned int premul;
+
+	regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &premul);
+	if (premul & VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ)
+		parent_rate *= 2;
+
+	return parent_rate;
+}
+
+static long vc5_dbl_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	if ((*parent_rate == rate) || ((*parent_rate * 2) == rate))
+		return rate;
+	else
+		return -EINVAL;
+}
+
+static int vc5_dbl_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct vc5_driver_data *vc5 =
+		container_of(hw, struct vc5_driver_data, clk_mul);
+	u32 mask;
+
+	if ((parent_rate * 2) == rate)
+		mask = VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ;
+	else
+		mask = 0;
+
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
+			   VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ,
+			   mask);
+
+	return 0;
+}
+
+static const struct clk_ops vc5_dbl_ops = {
+	.recalc_rate	= vc5_dbl_recalc_rate,
+	.round_rate	= vc5_dbl_round_rate,
+	.set_rate	= vc5_dbl_set_rate,
+};
+
 static unsigned long vc5_pfd_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -706,12 +762,32 @@ static int vc5_probe(struct i2c_client *client,
 		goto err_clk;
 	}
 
+	if (vc5->chip_info->flags & VC5_HAS_PFD_FREQ_DBL) {
+		/* Register frequency doubler */
+		memset(&init, 0, sizeof(init));
+		init.name = vc5_dbl_names[0];
+		init.ops = &vc5_dbl_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		init.parent_names = vc5_mux_names;
+		init.num_parents = 1;
+		vc5->clk_mul.init = &init;
+		ret = devm_clk_hw_register(&client->dev, &vc5->clk_mul);
+		if (ret) {
+			dev_err(&client->dev, "unable to register %s\n",
+				init.name);
+			goto err_clk;
+		}
+	}
+
 	/* Register PFD */
 	memset(&init, 0, sizeof(init));
 	init.name = vc5_pfd_names[0];
 	init.ops = &vc5_pfd_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = vc5_mux_names;
+	if (vc5->chip_info->flags & VC5_HAS_PFD_FREQ_DBL)
+		init.parent_names = vc5_dbl_names;
+	else
+		init.parent_names = vc5_mux_names;
 	init.num_parents = 1;
 	vc5->clk_pfd.init = &init;
 	ret = devm_clk_hw_register(&client->dev, &vc5->clk_pfd);
-- 
2.11.0
