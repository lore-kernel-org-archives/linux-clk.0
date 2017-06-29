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
Subject: [PATCH 3/8] clk: vc5: Do not warn about disabled output buffer input muxes
Date: Thu, 29 Jun 2017 12:18:46 +0200
Message-Id: <20170629101851.23972-3-marek.vasut@gmail.com>
In-Reply-To: <20170629101851.23972-1-marek.vasut@gmail.com>
References: <20170629101851.23972-1-marek.vasut@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The output buffer input mux can be configured in either of three
states -- disabled, input from FOD, input from previous output.
If the output buffer input mux is set to disabled, the code in
vc5_clk_out_get_parent() would consider this an invalid setting
and warn about it, which is not necessarily the case.

In case the output buffer input mux is disabled, default to input
from FOD to have some parent and don't print the warning.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/clk-versaclock5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index d835d48cf14d..766fcc5cc0b3 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -541,6 +541,9 @@ static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
 	regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
 	src &= mask;
 
+	if (src == 0)	/* Input mux set to DISABLED */
+		return 0;
+
 	if ((src & fodclkmask) == VC5_OUT_DIV_CONTROL_EN_FOD)
 		return 0;
 
@@ -549,6 +552,7 @@ static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
 
 	dev_warn(&vc5->client->dev,
 		 "Invalid clock output configuration (%02x)\n", src);
+
 	return 0;
 }
 
-- 
2.11.0
