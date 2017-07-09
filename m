Return-Path: <vladimir.barinov@cogentembedded.com>
Return-Path: <vladimir.barinov@cogentembedded.com>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Marek Vasut <marek.vasut@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 1/2] clk: vc5: Add support for IDT VersaClock 5P49V5925
Date: Sun,  9 Jul 2017 20:39:57 +0300
Message-Id: <1499621997-12965-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1499621970-12925-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499621970-12925-1-git-send-email-vladimir.barinov@cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Update IDT VersaClock 5 driver to support 5P49V5925. This chip has only
external clock input, four fractional dividers (FODs) and five clock
outputs (four universal clock outputs and one reference clock output at
OUT0_SELB_I2C).

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
---
Changes in version 2:
- rebased against patch:
  [V3,8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901

 drivers/clk/clk-versaclock5.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index c894db2..1808a55 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -129,6 +129,7 @@
 /* Supported IDT VC5 models. */
 enum vc5_model {
 	IDT_VC5_5P49V5923,
+	IDT_VC5_5P49V5925,
 	IDT_VC5_5P49V5933,
 	IDT_VC5_5P49V5935,
 	IDT_VC6_5P49V6901,
@@ -686,6 +687,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 	case IDT_VC5_5P49V5933:
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
+	case IDT_VC5_5P49V5925:
 	case IDT_VC5_5P49V5935:
 	case IDT_VC6_5P49V6901:
 	default:
@@ -911,6 +913,13 @@ static int vc5_remove(struct i2c_client *client)
 	.flags = 0,
 };
 
+static const struct vc5_chip_info idt_5p49v5925_info = {
+	.model = IDT_VC5_5P49V5925,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = 0,
+};
+
 static const struct vc5_chip_info idt_5p49v5933_info = {
 	.model = IDT_VC5_5P49V5933,
 	.clk_fod_cnt = 2,
@@ -934,6 +943,7 @@ static int vc5_remove(struct i2c_client *client)
 
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
+	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
 	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
 	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
@@ -943,6 +953,7 @@ static int vc5_remove(struct i2c_client *client)
 
 static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
+	{ .compatible = "idt,5p49v5925", .data = &idt_5p49v5925_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
 	{ .compatible = "idt,5p49v6901", .data = &idt_5p49v6901_info },
-- 
1.9.1
