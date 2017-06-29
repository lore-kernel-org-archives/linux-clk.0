Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901
Date: Thu, 29 Jun 2017 12:18:51 +0200
Message-Id: <20170629101851.23972-8-marek.vasut@gmail.com>
In-Reply-To: <20170629101851.23972-1-marek.vasut@gmail.com>
References: <20170629101851.23972-1-marek.vasut@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Update IDT VersaClock 6 driver to support 5P49V6901. This chip has
two clock inputs (external XTAL or external CLKIN), four fractional
dividers (FODs) and five clock outputs (four universal clock outputs
and one reference clock output at OUT0_SELB_I2C).

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/clk-versaclock5.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 6db84358520a..6e3166e00c8e 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -131,6 +131,7 @@ enum vc5_model {
 	IDT_VC5_5P49V5923,
 	IDT_VC5_5P49V5933,
 	IDT_VC5_5P49V5935,
+	IDT_VC6_5P49V6901,
 };
 
 /* Structure to describe features of a particular VC5 model */
@@ -687,6 +688,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
 	case IDT_VC5_5P49V5935:
+	case IDT_VC6_5P49V6901:
 	default:
 		return n;
 	}
@@ -924,10 +926,18 @@ static const struct vc5_chip_info idt_5p49v5935_info = {
 	.flags = VC5_HAS_INTERNAL_XTAL,
 };
 
+static const struct vc5_chip_info idt_5p49v6901_info = {
+	.model = IDT_VC6_5P49V6901,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = VC5_HAS_PFD_FREQ_DBL,
+};
+
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
 	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
+	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
@@ -936,6 +946,7 @@ static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
+	{ .compatible = "idt,5p49v6901", .data = &idt_5p49v6901_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.11.0
