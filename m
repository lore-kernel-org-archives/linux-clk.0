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
Subject: [PATCH 4/8] clk: vc5: Configure the output buffer input mux on prepare
Date: Sat,  1 Jul 2017 22:04:54 +0200
Message-Id: <20170701200459.11505-4-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The output buffer input mux can be configured in either of three
states -- disabled, input from FOD, input from previous output.
Once the .prepare() callback of the output buffer is called, the
output buffer input mux must be set to either input from FOD or
input from previous output, it cannot be set to Disabled anymore
or the output won't work.

Default to the input from FOD if the output buffer input mux was
Disabled and the .prepare() was called on it.

Note that we do not set the output buffer input mux back to Disabled
in the .unprepare() callback as there is no obvious benefit of doing
so. We disable the entire output buffer in the .unprepare() callback
already.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
on Salvator-XS with the display LVDS output.
---
 drivers/clk/clk-versaclock5.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 248689d89632..7bdfd34e8280 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -507,6 +507,25 @@ static int vc5_clk_out_prepare(struct clk_hw *hw)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
 	struct vc5_driver_data *vc5 = hwdata->vc5;
+	const u8 mask = VC5_OUT_DIV_CONTROL_SELB_NORM |
+			VC5_OUT_DIV_CONTROL_SEL_EXT |
+			VC5_OUT_DIV_CONTROL_EN_FOD;
+	unsigned int src;
+	int ret;
+
+	/*
+	 * If the input mux is disabled, enable it first and
+	 * select source from matching FOD.
+	 */
+	regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
+	if ((src & mask) == 0) {
+		src = VC5_OUT_DIV_CONTROL_RESET | VC5_OUT_DIV_CONTROL_EN_FOD;
+		ret = regmap_update_bits(vc5->regmap,
+					 VC5_OUT_DIV_CONTROL(hwdata->num),
+					 mask | VC5_OUT_DIV_CONTROL_RESET, src);
+		if (ret)
+			return ret;
+	}
 
 	/* Enable the clock buffer */
 	regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
-- 
2.11.0
