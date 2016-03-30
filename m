Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:29795 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754178AbcC3Rnn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 13:43:43 -0400
Message-Id: <2b347763e38cfeeb7a2d6af6357eaea6c4ec07ac.1459358017.git.moinejf@free.fr>
In-Reply-To: <cover.1459358017.git.moinejf@free.fr>
References: <cover.1459358017.git.moinejf@free.fr>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Wed, 30 Mar 2016 18:43:29 +0200
Subject: [PATCH 1/3] clk: sunxi: Add sun6i/8i display support
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the clock type which is used by the sun6i/8i families for video display.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 38 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 834436f..8c0fda8 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -81,6 +81,7 @@ Required properties:
 	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
+	"allwinner,sun6i-a31-display-clk" - for the display clocks
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 91de0a0..0581e1b 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -1127,3 +1127,41 @@ static void __init sun6i_pll6_clk_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pll6-clk",
 	       sun6i_pll6_clk_setup);
+
+/*
+ * sun6i display
+ *
+ * rate = parent_rate / (m + 1);
+ */
+static void sun6i_display_factors(struct factors_request *req)
+{
+	u8 m;
+
+	if (req->rate > req->parent_rate)
+		req->rate = req->parent_rate;
+
+	m = DIV_ROUND_UP(req->parent_rate, req->rate);
+
+	req->rate = req->parent_rate / m;
+	req->m = m - 1;
+}
+
+static const struct clk_factors_config sun6i_display_config = {
+	.mshift = 0,
+	.mwidth = 4,
+};
+
+static const struct factors_data sun6i_display_data __initconst = {
+	.enable = 31,
+	.mux = 24,
+	.muxmask = BIT(2) | BIT(1) | BIT(0),
+	.table = &sun6i_display_config,
+	.getter = sun6i_display_factors,
+};
+
+static void __init sun6i_display_setup(struct device_node *node)
+{
+	sunxi_factors_clk_setup(node, &sun6i_display_data);
+}
+CLK_OF_DECLARE(sun6i_display, "allwinner,sun6i-a31-display-clk",
+	       sun6i_display_setup);
-- 
2.8.0

