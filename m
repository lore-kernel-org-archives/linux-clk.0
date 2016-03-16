Return-Path: <vishnupatekar0510@gmail.com>
Return-Path: <vishnupatekar0510@gmail.com>
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
To: robh+dt@kernel.org,
	corbet@lwn.net,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	maxime.ripard@free-electrons.com,
	linux@arm.linux.org.uk,
	emilio@elopez.com.ar
Cc: jenskuske@gmail.com,
	hdegoede@redhat.com,
	wens@csie.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 03/13] clk: sunxi: Add APB1 clock for A83T
Date: Thu, 17 Mar 2016 00:04:26 +0800
Message-Id: <1458144276-31108-4-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

APB1 is similar to sun4i-a10-apb0-clk, except different dividers.

This adds support for apb1 on A83T.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index cba9fe55..291d366 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -51,6 +51,7 @@ Required properties:
 	"allwinner,sun8i-h3-apb0-gates-clk" - for the APB0 gates on H3
 	"allwinner,sun9i-a80-apb0-gates-clk" - for the APB0 gates on A80
 	"allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
++	"allwinner,sun8i-a83t-apb1-clk" - for the APB1 clock on A83T
 	"allwinner,sun9i-a80-apb1-clk" - for the APB1 bus clock on A80
 	"allwinner,sun4i-a10-apb1-gates-clk" - for the APB1 gates on A10
 	"allwinner,sun5i-a13-apb1-gates-clk" - for the APB1 gates on A13
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index a7aab65..171282d 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -872,6 +872,12 @@ static const struct div_data sun4i_apb0_data __initconst = {
 	.table	= sun4i_apb0_table,
 };
 
+static const struct div_data sun8i_a83t_apb1_data __initconst = {
+	.shift	= 8,
+	.pow	= 0,
+	.width	= 2,
+};
+
 static void __init sunxi_divider_clk_setup(struct device_node *node,
 					   const struct div_data *data)
 {
@@ -938,6 +944,13 @@ static void __init sun4i_apb0_clk_setup(struct device_node *node)
 CLK_OF_DECLARE(sun4i_apb0, "allwinner,sun4i-a10-apb0-clk",
 	       sun4i_apb0_clk_setup);
 
+static void __init sun8i_a83t_apb1_clk_setup(struct device_node *node)
+{
+	sunxi_divider_clk_setup(node, &sun8i_a83t_apb1_data);
+}
+CLK_OF_DECLARE(sun8i_a83t_apb1, "allwinner,sun8i-a83t-apb1-clk",
+	       sun8i_a83t_apb1_clk_setup);
+
 static void __init sun4i_axi_clk_setup(struct device_node *node)
 {
 	sunxi_divider_clk_setup(node, &sun4i_axi_data);
-- 
1.9.1
