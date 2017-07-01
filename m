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
Subject: [PATCH V2 8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901
Date: Sat,  1 Jul 2017 22:04:58 +0200
Message-Id: <20170701200459.11505-8-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Update IDT VersaClock 5 driver to support IDT VersaClock 6 5P49V6901.
This chip has two clock inputs (external XTAL or external CLKIN), four
fractional dividers (FODs) and five clock outputs (four universal clock
outputs and one reference clock output at OUT0_SELB_I2C).

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
on Salvator-XS with the display LVDS output.
---
V2: - Reword the commit message to explicitly mention the VC5 driver
      and the added support for VC6.
    - Mention VC6 in Kconfig
---
 drivers/clk/Kconfig           |  6 +++---
 drivers/clk/clk-versaclock5.c | 11 +++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d406b087553f..99adcb0d799c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -210,14 +210,14 @@ config COMMON_CLK_OXNAS
 	  Support for the OXNAS SoC Family clocks.
 
 config COMMON_CLK_VC5
-	tristate "Clock driver for IDT VersaClock5 devices"
+	tristate "Clock driver for IDT VersaClock 5,6 devices"
 	depends on I2C
 	depends on OF
 	select REGMAP_I2C
 	help
 	---help---
-	  This driver supports the IDT VersaClock5 programmable clock
-	  generator.
+	  This driver supports the IDT VersaClock 5 and VersaClock 6
+	  programmable clock generators.
 
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index d0406b62133a..c894db298cbd 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -131,6 +131,7 @@ enum vc5_model {
 	IDT_VC5_5P49V5923,
 	IDT_VC5_5P49V5933,
 	IDT_VC5_5P49V5935,
+	IDT_VC6_5P49V6901,
 };
 
 /* Structure to describe features of a particular VC5 model */
@@ -686,6 +687,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
 	case IDT_VC5_5P49V5935:
+	case IDT_VC6_5P49V6901:
 	default:
 		return n;
 	}
@@ -923,10 +925,18 @@ static const struct vc5_chip_info idt_5p49v5935_info = {
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
@@ -935,6 +945,7 @@ static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
+	{ .compatible = "idt,5p49v6901", .data = &idt_5p49v6901_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.11.0
