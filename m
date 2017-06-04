Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:54727 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751393AbdFDQDR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 4 Jun 2017 12:03:17 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 07/11] drm: sun4i: add support for the TV encoder in H3 SoC
Date: Mon,  5 Jun 2017 00:01:45 +0800
Message-Id: <20170604160149.30230-8-icenowy@aosc.io>
In-Reply-To: <20170604160149.30230-1-icenowy@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
but has a internal fixed clock divider that divides the TCON1 clock
(called TVE clock in datasheet) by 11.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Quirk part rewritten.

 drivers/gpu/drm/sun4i/sun4i_tv.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 338b9e5bb2a3..b9ff6d5ea67a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -169,14 +170,21 @@ struct tv_mode {
 	const struct resync_parameters	*resync_params;
 };
 
+struct sun4i_tv_quirks {
+	int fixed_divider;
+};
+
 struct sun4i_tv {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 
 	struct clk		*clk;
+	struct clk		*mod_clk;
 	struct regmap		*regs;
 	struct reset_control	*reset;
 
+	const struct sun4i_tv_quirks *quirks;
+
 	struct sun4i_drv	*drv;
 };
 
@@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct drm_encoder *encoder,
 	struct sun4i_tcon *tcon = crtc->tcon;
 	const struct tv_mode *tv_mode = sun4i_tv_find_tv_by_mode(mode);
 
+	if (tv->quirks->fixed_divider) {
+		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
+				 tv->quirks->fixed_divider);
+		mode->crtc_clock *= tv->quirks->fixed_divider;
+	}
+
 	sun4i_tcon1_mode_set(tcon, mode);
 	sun4i_tcon_set_mux(tcon, 1, encoder);
 
@@ -579,6 +593,10 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	tv->drv = drv;
 	dev_set_drvdata(dev, tv);
 
+	tv->quirks = of_device_get_match_data(dev);
+	if (!tv->quirks)
+		return -EINVAL;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(regs)) {
@@ -684,8 +702,23 @@ static int sun4i_tv_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun4i_tv_quirks sun4i_a10_tv_quirks = {
+	/* Nothing special */
+};
+
+static const struct sun4i_tv_quirks sun8i_h3_tv_quirks = {
+	.fixed_divider = 16,
+};
+
 static const struct of_device_id sun4i_tv_of_table[] = {
-	{ .compatible = "allwinner,sun4i-a10-tv-encoder" },
+	{
+		.compatible = "allwinner,sun4i-a10-tv-encoder",
+		.data = &sun4i_a10_tv_quirks,
+	},
+	{
+		.compatible = "allwinner,sun8i-h3-tv-encoder",
+		.data = &sun8i_h3_tv_quirks,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tv_of_table);
-- 
2.12.2

